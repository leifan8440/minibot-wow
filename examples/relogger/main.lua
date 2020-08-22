-- Do nothing if not on GLUE screen.
if (not IsOnGlueScreen()) then
    return;
end

-- Login email. If not previously set by SetSystemVariable, use "test@test.com".
local email = wmbapi.GetSystemVar("relogger.email") or "test@test.com";
-- Login password. If not previously set by SetSystemVariable, use "password".
local password = wmbapi.GetSystemVar("relogger.password") or "password";
-- Login account. If not previously set by SetSystemVariable, use "WoW1".
local account = wmbapi.GetSystemVar("relogger.account") or "WoW1";
-- Login realm. If not previously set by SetSystemVariable, nil to use the current one.
local realm = wmbapi.GetSystemVar("relogger.realm");
-- Login character. If not previously set by SetSystemVariable, use "character".
local character = wmbapi.GetSystemVar("relogger.character") or "character";
-- Do nothing if email is set to empty.
if (#email == 0 or #password == 0) then
    return;
end

-- Global states.
local failure, is_failure_shown;
local is_launcher_login_cancelled;
local login_start_time;

-- The relogger "rotation" for retail.
local function retail_rotation()
    -- If there is a total failure, show it and terminate.
    if (failure) then
        if (not is_failure_shown) then
            C_Login.DisconnectFromServer();
            message("Relogger failed: " .. failure);
            is_failure_shown = true;
        end
        return;
    end

    -- Get the current states.
    local current_screen = GlueParent.currentScreen;
    if (not GlueParent_IsScreenValid(current_screen)) then
        return;
    end
    local aurora_state, is_connected_to_wow, wow_connection_state, has_realm_list, is_waiting_for_realm_list = C_Login.GetState();

    -- Cancel the current system error.
    if (aurora_state == LE_AURORA_STATE_NONE and C_Login.GetLastError() and GlueDialog and GlueDialog:IsVisible()) then
        GlueDialog:Hide();
        C_Login.ClearLastError();
    end

    -- If it is in login screen, start login.
    if (current_screen == "login" and not is_connected_to_wow) then
        -- Cancel launcher login as it is definitely not what we want.
        if (C_Login.IsLauncherLogin() and not is_launcher_login_cancelled) then
            AccountLogin_CheckAutoLogin = function() end;
            C_Login.CancelLauncherLogin();
            C_Login.DisconnectFromServer();
            if (GlueDialog and GlueDialog.which == "CANCEL" and GlueDialog:IsVisible()) then
                GlueDialog:Hide();
                is_launcher_login_cancelled = true;
            end
            return;
        end
        -- Retry login if timeout (30s).
        if (wow_connection_state == LE_WOW_CONNECTION_STATE_NONE and login_start_time and GetTime() - login_start_time > 30) then
            C_Login.DisconnectFromServer();
            if (GlueDialog and GlueDialog.which == "CANCEL" and GlueDialog:IsVisible()) then
                GlueDialog:Hide();
            end
        end
        -- Login with email and password.
        if (aurora_state == LE_AURORA_STATE_NONE and C_Login.IsLoginReady()) then
            AccountLogin.UI.AccountEditBox:SetText(email);
            AccountLogin.UI.PasswordEditBox:SetText(password);
            AccountLogin_Login();
            login_start_time = GetTime();
            return;
        end
        -- Select the account.
        if (AccountLogin.UI.WoWAccountSelectDialog:IsShown()) then
            local game_accounts = C_Login.GetGameAccounts();
            if (game_accounts and #game_accounts > 0) then
                local game_account_index = 0;
                for i = 1, #game_accounts do
                    if (game_accounts[i] == account) then
                        game_account_index = i;
                        break;
                    end
                end
                if (game_account_index > 0) then
                    WoWAccountSelect_SelectAccount(game_account_index);
                else
                    AccountLogin.UI.WoWAccountSelectDialog:Hide();
                    failure = string.format("The account <%s> does not exist.", account);
                end
            end
            return;
        end
    end

    -- If it is in realm list, select the right realm.
    if (current_screen == "realmlist" and wow_connection_state == LE_WOW_CONNECTION_STATE_NONE and has_realm_list and not is_waiting_for_realm_list) then
        if (not realm) then
            failure = "The realm is not specified.";
            return;
        end
        local categories = C_RealmList.GetAvailableCategories();
        local realm_address;
        for i = 1, #categories do
            local realms = C_RealmList.GetRealmsInCategory(categories[i]);
            for j = 1, #realms do
                if (C_RealmList.GetRealmInfo(realms[j]) == realm) then
                    realm_address = realms[j];
                    break;
                end
            end
            if (realm_address) then
                break;
            end
        end
        if (realm_address) then
            C_RealmList.ConnectToRealm(realm_address);
        else
            failure = string.format("The realm <%s> does not exist.", realm);
        end
        return;
    end

    -- If it is in character screen, select realm and character, then enter world.
    if (current_screen == "charselect" and is_connected_to_wow and not has_realm_list and not is_waiting_for_realm_list) then
        -- Wait for character list to be retrieved.
        if (CharacterSelect_IsRetrievingCharacterList()) then
            return;
        end
        -- Change realm if necessary.
        local current_realm = GetServerName();
        if (realm and current_realm ~= realm) then
            CharacterSelect_ChangeRealm();
            return;
        end
        -- Select the character.
        local character_count = GetNumCharacters();
        if (character_count == 0) then
            failure = string.format("The realm <%s> does not have any characters.", current_realm);
            return;
        end
        local is_character_selected;
        for i = 1, character_count do
            local character_name = GetCharacterInfo(i);
            if (character_name == character) then
                CharacterSelect_SelectCharacter(i);
                is_character_selected = true;
                break;
            end
        end
        if (not is_character_selected) then
            failure = string.format("The character <%s> does not exist in the realm <%s>.", character, current_realm);
            return;
        end
        -- Enter world.
        CharacterSelect_EnterWorld();
    end
end

-- Start the "relogger" rotation.
local rotation_frame = CreateFrame("FRAME");
rotation_frame:SetScript("OnUpdate", function()
    local versionType, buildType, version, internalVersion, date = GetBuildInfo();
    if (tonumber(string.sub(version, 1, 1)) > 1) then
        retail_rotation();
    else
        message("Relogger: Classic support is not done yet!");
    end
end);