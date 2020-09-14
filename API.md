# Custom API

- Common
  - [Arguments](#common-arguments)
  - [Constants](#common-constants)
  - [File](#common-file)
  - [Maths](#common-maths)
  - [Memory](#common-memory)
  - [Miscellanea](#common-miscellanea)
  - [Network](#common-network)
- In-World
  - [Action](#in-world-action)
  - [Aura](#in-world-aura)
  - [BlackTech](#in-world-blacktech)
  - [Missile](#in-world-missile)
  - [Navigation](#in-world-navigation)
  - [Spell](#in-world-spell)
  - [State](#in-world-state)
  - Object
    - [Constants](#in-world-object-constants)
    - [Descriptor](#in-world-object-descriptor)
    - [Field](#in-world-object-field)
    - [General](#in-world-object-general)
    - [Miscellanea](#in-world-object-miscellanea)
  - [Object Manager](#in-world-object-manager)
  - [Vision](#in-world-vision)

This is the up-to-date list of `MiniBot` custom API, classified into 3 categories according to their lifecycles:

1. Common<br />
The functions that always exist in both GLUE and World.
2. In-World<br />
The functions that only exist in-world.
3. GLUE<br />
The functions that only exist in GLUE screens.

All of the custom API below are registered in a specific global table `wmbapi` if the client is not OEM. Otherwise, the table name becomes `[MACRO]api`, such as "abcapi" if your OEM short name is "abc". Remember to refer back to this from time to time as the API may change in future.

Before diving into the list, last but not least, we **DO NOT** provide intensive support for the API set. Questions such as "hey, what does API XXX mean?" will be ignored. Please help yourself if you decide to utilize them for your own good.

[Back to Top](#custom-api)

## Common (Arguments)

- `path = GetAppStorageDirectory()`

Gets the base directory path of app storage.

- `path = GetAppDirectory()`

Gets the app base directory path.

- `username = GetAppUsername()`

Gets the app username.

- `path = GetWoWDirectory()`

Gets the WoW base directory path.

- `account = GetCurrentAccount()`

Gets the name of the current WoW account. (same as the WTF subfolder)

- `value = GetSystemVar(name)`

Gets the value of the system variable previously set by `SetSystemVar`. **nil** if it does not exist.

- `value = SetSystemVar(name, value)`

Sets a system variable.

The standard Lua environment gets reset after screen switch including **/reload**. All Lua variables get lost because of this. In this way, we provide "System Variables" that allow you to persist information across different screens in the current game session. This is similar as the game "Console Variable", consisting of a name-value pair.

```lua
-- name (string): The name of the system variable.
-- value (string): The value of the system variable.
```

[Back to Top](#custom-api)

## Common (Constants)

- `encodings = GetStringEncodingsTable()`

Gets the table of supported string encodings.
```lua
encodings = {
  Base64 = 1,
  Hex = 2
}
```

- `types = GetValueTypesTable()`

Gets the table that contains all value types to read from memory, which looks like:

```lua
types = {
  Bool = 1,
  Char = 2,
  Byte = 3,
  Short = 4,
  UShort = 5,
  Int = 6,
  UInt = 7,
  Long = 8,
  ULong = 9,
  Float = 10,
  Double = 11,
  String = 12,
  IntPtr = 13,
  UIntPtr = 14,
  GUID = 15,
}
```

## Common (Encryption)

- `output = AesEncrypt(input, key, iv[, encoding])`

Encrypts a plain string by AES-256 with PKCS#7 padding.

```lua
-- input (string): The plain string.
-- key (string): The key for encryption (must be 32 letters).
-- iv (string): The IV for encryption (must be 16 letters).
-- encoding (number): One of the encodings to encrypt the result, from GetStringEncodingsTable(). nil for default encodings.Base64.
-- output (string): The encrypted string.
```

- `output = AesDecrypt(input, key, iv[, encoding])`

Decrypts an encrypted string by AES-256 with PKCS#7 padding.

```lua
-- input (string): The encrypted string.
-- key (string): The key for encryption (must be 32 letters).
-- iv (string): The IV for encryption (must be 16 letters).
-- encoding (number): One of the encodings to encrypt the result, from GetStringEncodingsTable(). nil for default encodings.Base64.
-- output (string): The plain string. nil if decryption fails.
```

In order to make sure your own AES encryption matches the API above, the test vector is given below:

```lua
local test = "test";
local encodings = GetStringEncodingsTable();
local encrypted_string = AesEncrypt(test, "01234567890123456789012345678901", "0123456789012345", encodings.Hex);
local decrypted_string = AesDecrypt(encrypted_string, "01234567890123456789012345678901", "0123456789012345", encodings.Hex);
print("result:", encrypted_string, decrypted_string, test == decrypted_string);
-- result: A68C23C38693A8EBD1D6276FBB90E5E1 test true
```

## Common (File)

- `isOrNot = FileExists(path)`

Checks if a file exists.

- `text = ReadFile(path)`

Reads all text from a file.

- `success = WriteFile(path, text[, append])`

Writes all text to a file.

- `isOrNot = DirectoryExists(path)`

Checks if a directory exists.

- `success = CreateDirectory(path)`

Creates a directory.

- `fileNames = GetDirectoryFiles(path)`

Gets all file names in a specific directory. Remind the path must end with wildcards. e.g. ```C:\Windows\*.lua```

- `folderNames = GetDirectoryFolders(path)`

Gets all sub folder names in a specific directory.

[Back to Top](#custom-api)

## Common (Maths)

- `centers = GetAllSpanningCircles(radius, minWeight, points)`

Gets all spanning circles of a specific radius over certain weighted points.

[Back to Top](#custom-api)

## Common (Memory)

- `value = ReadMemory(module, offset, type)`

Reads a value at a specific memory offset/rva in a specific memory module.

```lua
-- module (string): The name of the memory module. nil for "Wow.exe" aka the main module.
-- offset (number): The offset/rva in the memory module to read.
-- type (number): The type of the value. Check GetValueTypesTable().
-- value (number): The result value. nil if the memory address is not found.
```

- `offset = GetMemoryOffset(module, address)`

Gets the offset of a memory address in a specific module.

```lua
-- module (string): The name of the memory module. nil for "Wow.exe" aka the main module.
-- address (number): The absolute memory address.
-- offset (number): The result offset. nil if the memory address is not found.
```

## Common (Miscellanea)

- `down, toggled = GetKeyState(key)`

Gets the pressed state of a specific key.

- `success = PlaySoundFile(path)`

Plays a specific sound WAV/MP3 file once.

- `RunScript(name, script)`

Runs a Lua script with a name by engine.

- `SetCustomScript(name, script)`

Adds a custom script (indexed by name) that gets loaded side by side with the engine modules (Primary and Secondary). Notice that such script also gets loaded in GLUE screen.

[Back to Top](#custom-api)

## Common (Network)

- `request = SendHttpRequest(info)`

Sends a HTTP request asynchronously. The API will return immediately after the request is sent without waiting for the response.

```lua
-- The request info.
info = {
  -- string: The request URL.
  Url = "https://www.microsoft.com/",
  -- [OPTIONAL] string: The request method, can be "GET", "POST", "PUT" or "DELETE".
  Method = "POST",
  -- [OPTIONAL] string: The additional request headers.
  Headers = "Content-Type: application/json\r\nX-Custom: test",
  -- [OPTIONAL] string: The request body, only used Method is "POST" or "PUT".
  Body = "{\"test\": 123}",
  -- [OPTIONAL] string: The pinned HTTPs server certificate as a protection for packet sniffing. If provided, the server certificate must match it or the HTTP request would fail with status "INVALID_CERTIFICATE".
  Certificate = "PINNED CERTIFICATE",
  -- [OPTIONAL] function: The callback function when the status of the request is updated.
  Callback = function(request, status) ... end,
}
-- The HTTP request ID if sent successfully, for querying HTTP response later.
request = "abc123"
```

- `status[, response] = ReceiveHttpResponse(request)`

Checks the status and receives the response of an existing HTTP request. The request will be cleared from memory after the API call if the request is done successfully or unsuccessfully.

```lua
-- The HTTP request ID previously sent.
request = "abc123"
-- The current status of the HTTP request, can be:
-- "REQUESTING": The request is still on the way.
-- "REQUEST_FAILED": The request is terminated due to failures.
-- "INVALID_CERTIFICATE": The request is terminated due to invalid HTTPs certificate.
-- "RESPONDING": Downloading response after the request is sent.
-- "RESPONSE_HEADERS_FAILED": The response download is terminated while fetching response headers.
-- "RESPONSE_BODY_FAILED": The response download is terminated while fetching response body.
-- "SUCCESS": The response is received and everything about the HTTP request is done.
status = "CONNECTING"
-- The response data, available if status is "SUCCESS"
response = {
  -- number: The HTTP response status code.
  Code = 200,
  -- string: The HTTP response headers.
  Headers = "HTTP/1.1 200 OK...",
  -- string: The HTTP response body.
  Body = "...",
  -- string: The actual server certificate if the request is HTTPs, which can be used for pinning.
  Certificate = "SERVER CERTIFICATE",
}
```

Given the nature of async programming model, a simple example to send and receive HTTP is given as below, leveraging the callback function.

```lua
wmbapi.SendHttpRequest({
  Url = "https://www.microsoft.com",
  ...
  Callback = function(request, status)
    -- Deal with the current status and response of the HTTP request here.
    if (status == "SUCCESS") then
      local _, response = wmbapi.ReceiveHttpResponse(request);
      print("response body:", response.Body);
    end
  end
});
```

Another example to send and receive HTTP is given as below, leveraging frame updates.

```lua
local http_frame = CreateFrame("FRAME");
local http_request;
http_frame:SetScript("OnUpdate", function()
  if (not http_request) then
    local info = {...}; -- Fill your actual info here.
    http_request = wmbapi.SendHttpRequest(info);
  else
    local http_status, http_response = wmbapi.ReceiveHttpResponse(http_request)
    if (not http_status) then
      -- The HTTP request has been fulfiled.
      http_frame:SetScript("OnUpdate", nil);
      http_frame = nil;
      return;
    end
    -- Deal with the current status and response of the HTTP request here.
    if (http_status == "SUCCESS") then
      print("response body:", http_response.Body);
    end
  end
end);
```

- `connection = ConnectWebsocket(info)`

Connects to a remote websocket server asynchronously. The API will return immediately after the connection is initiated.

```lua
-- The websocket info.
info = {
  -- string: The websocket URL. (Use http(s) instead of ws(s))
  Url = "https://echo.websocket.org",
  -- [OPTIONAL] string: The additional request headers.
  Headers = "Content-Type: application/json\r\nX-Custom: test",
  -- [OPTIONAL] string: The pinned HTTPs server certificate as a protection for packet sniffing. If provided, the server certificate must match it or the websocket connection would fail with status "INVALID_CERTIFICATE".
  Certificate = "PINNED CERTIFICATE",
  -- [OPTIONAL] function: The callback function when the status of the connection is updated, which can be any one of "CONNECTING", "CONNECTION_FAILED", "INVALID_CERTIFICATE", "CONNECTED", "CLOSING", "CLOSED".
  ConnectCallback = function(connection, status) ... end,
  -- [OPTIONAL] function: The callback function when a piece of data is sent over the connection. (Only string data is supported)
  SendCallback = function(connection, data) ... end,
  -- [OPTIONAL] function: The callback function when a piece of data is received over the connection. (Only string data is supported)
  ReceiveCallback = function(connection, data) ... end
}
-- The websocket connection ID if sent successfully.
connection = "abc123"
```

- `success = CloseWebsocket(connection)`

Closes an existing websocket connection.

- `success = SendWebsocketData(connection, data)`

Sends a piece of string data over an existing websocket connection.

Given the nature of async programming model, a simple example to establish a websocket connection, send data, and disconnect it after data is received is given as below.

```lua
wmbapi.ConnectWebsocket({
  Url = "https://echo.websocket.org",
  ...
  ConnectCallback = function(connection, status)
    -- Deal with the current connection status here.
    if (status == "CONNECTED") then
      print("connected!");
      wmbapi.SendWebsocketData(connection, "test data!");
    elseif (status == "CLOSED") then
      print("disconnected!");
    end
  end,
  SendCallback = function(connection, data)
    print("data sent:", data);
  end,
  ReceiveCallback = function(connection, data)
    print("data received:", data);
    wmbapi.CloseWebsocket(connection);
  end
});
```

## In-World (Action)

- `ClickPosition(x, y, z[, right])`

Clicks a world position.

- `FaceDirection(angle[, update])`

Faces a horizontal direction, in radian.

- `SetPitch(angle)`

Sets the player vertical pitch, in radian.

- `MoveTo(x, y, z[, instantTurn])`

Moves the player to a specific position, using CTM.

[Back to Top](#custom-api)

## In-World (Aura)

- `count = GetAuraCount(unit, [spellId])`

Gets the count of auras on a specific unit, optionally filtered by spell ID. You must call this API first to actually search auras to be saved in memory. This API returns all auras including hidden ones, more than you can get normally by BLZ API [UnitAura](https://wow.gamepedia.com/API_UnitAura).

```lua
-- unit (string): The unit to check the auras.
-- spellId (number): The spell ID of the auras to filter. nil for all.
-- count (number): The actual aura count. nil if the unit does not exist.
```

- `spellId | ... = GetAuraWithIndex(index[, detailed = false])`

Gets the info of a specific aura, saved by the most recent call to `GetAuraCount()`. If "detailed" is true, the return values will be the same as the BLZ API [UnitAura](https://wow.gamepedia.com/API_UnitAura). If "detailed" is false, the return value will be only the aura spell ID with a bit better performance.

Due to technical difficulties, we only make partial results available in Classic version, which include `_, _, count, _, duration, expirationTime, source, _, _, spellId, ...` ONLY. But in Retail, all are just fine so don't worry.

```lua
-- index (number): The index of the aura.
-- detailed (boolean): Whether to get the details for the aura.
-- spellId (number): The spell ID of the aura.
```

A code example to show all auras of the current target is given below.

```lua
if (UnitExists("target")) then
  local aura_count = GetAuraCount("target");
  print(">>>>" .. UnitName("target") .. "<<<<");
  for i = 1, aura_count do
    print(GetAuraWithIndex(i, true));
  end
end
```

[Back to Top](#custom-api)

## In-World (BlackTech)

- `SetCameraDistanceMax([distance])`

Sets the current camera distance maximum. If nil, restore original setting.

- `SetClimbAngle([angle])`

Sets the engine allowed climb angle, in radian. If nil, restore original setting.

- `success = SetCVarEx(name, value)`

Sets a CVar without system limitation.

- `SetNameplateDistanceMax([distance])`

Sets the current nameplate visible distance maximum. If nil, restore original setting.

- `StopFalling()`

Stops the current falling of the character right now.

- `EnableFlyingMode(enabled)`

Enable/Disable flying mode of the character. (HINT: DO NOT enable flying while falling or you would get disconnected)

- `isFlying = IsFlyingModeEnabled()`

Gets whether flying mode is enabled for the character.

- `modes = GetNoClipModes()`

Gets the current no-clip mode flags, which is a sum of:
0: none
1: building
2: static object
4: dynamic object

- `SetNoClipModes(modes)`

Sets the current no-clip mode flags. Check the enum above.

[Back to Top](#custom-api)

## In-World (Missile)

- `count = GetMissileCount()`

Gets the count of the flying missiles.

- `spellId, spellVisualId, x, y, z, sourceObject, sourceX, sourceY, sourceZ, targetObject, targetX, targetY, targetZ = GetMissileWithIndex(index)`

Gets the info of a specific missile.

[Back to Top](#custom-api)

## In-World (Navigation)

- `mapId, zoneId = GetCurrentMapInfo()`

Gets the map information about the current location.

- `success = LoadMap(mapId)`

Loads a navigation map.

- `success = UnloadMap(mapId)`

Unloads a navigation map.

- `isOrNot = IsMapLoaded(mapId)`

Checks if a navigation map is loaded.

- `path = FindPath(mapId, x1, y1, z1, x2, y2, z2[, ignoreWater = true, waypointCountMax = 1024])`

Calculates a path to navigate from one position to another.

```lua
-- mapId (number): The map ID.
-- x1, y1, z1 (number): The start position.
-- x2, y2, z2 (number): The end position.
-- ignoreWater (boolean): Whether to avoid walking into water terrain.
-- waypointCountMax (number): The count maximum of the path waypoints. Returns nil even if a path with too many waypoints is found.
```

[Back to Top](#custom-api)

## In-World (Object-Constants)

All of the constants are contained in different tables as below. You should print the most up-to-date actual constants in-game using a simple Lua "for-pairs" loop for 100% accuracy.

- `flags = GetObjectTypeFlagsTable()`

Gets the table that contains all type flags, which looks like:

```lua
flags = {
  Object = 1,
  Item = 2,
  Container = 4,
  AzeriteEmpoweredItem = 8,
  AzeriteItem = 16,
  ...
}
```

- `fields = GetObjectFieldsTable()`

Gets the table that contains all object field offsets, which looks like:

```lua
fields = {
  ["AnimationState"] = 123,
  ...
}
```

- `descriptors = GetObjectDescriptorsTable()`

Gets the table that contains all object descriptor offsets, which looks like:

```lua
descriptors = {
  ["CGObjectData__m_guid"] = 0,
  ["CGObjectData__m_entryID"] = 8,
  ...
}
```

Also notice that there are some descriptor names ending with "_union". This indicates that there might be one or several child values mixed together in the descriptor.

- `movementFlags = GetUnitMovementFlagsTable()`

Gets the table that contains all unit movement flags, which looks like:

```lua
descriptors = {
  Forward = 1,
  Backward = 2,
  StrafeLeft = 4,
  StrafeRight = 8,
  TurnLeft = 16,
  ...  
}
```

[Back to Top](#custom-api)

## In-World (Object-Descriptor)

- `value = ObjectDescriptor(object, offset, type)`

Gets a descriptor value of an object.

- `scale = ObjectScale(object)`

Gets the scale of an object.

- `dynamicFlags = ObjectDynamicFlags(object)`

Gets the dynamic flags of an object.

- `creator = UnitCreator(object)`

Gets the creator object of an object.

- `radius = UnitBoundingRadius(object)`

Gets the bounding radius of an unit.

- `reach = UnitCombatReach(object)`

Gets the combat reach of an unit.

- `target = UnitTarget(object)`

Gets the target object of an unit.

- `flags = UnitFlags(object)`

Gets the flags of an unit.

[Back to Top](#custom-api)

## In-World (Object-Field)

- `value = ObjectField(object, offset, type)`

Gets a field value of an object.

- `castingTarget = UnitCastingTarget(unit)`

Gets the casting target object of a unit.

- `transport = UnitTransport(unit)`

Gets the transport object of a unit.

- `pitch = UnitPitch(unit)`

Gets the vertical pitch of a unit, in radian.

- `flags = UnitMovementFlags(unit)`

Gets the movement flags of a unit, indicating its moving status.

- `value = UnitMovementField(unit, offset, type)`

Gets the field value of a unit's movement struct.

- `typeId = UnitCreatureTypeId(unit)`

Gets the ID of a unit's creature type.

- `familyId = UnitCreatureFamilyId(unit)`

Gets the ID of a unit's creature family. nil if the unit does not have one.

- `value = UnitCreatureField(object, offset, type)`

Gets the field value of a unit's creature cache struct.

[Back to Top](#custom-api)

## In-World (Object-General)

- `object = GetObject(object | UnitID)`

Gets the object by its ID. nil if the object does not exist.

- `object = GetObjectWithGUID(guid)`

Gets the object by its GUID.

- `flags = ObjectTypeFlags(object)`

Gets the type flags of an object.

- `isOrNot = ObjectIsType(object, type)`

Checks if an object is of specific type.

- `isOrNot = ObjectExists(object)`

Checks whether an object exists in memory.

- `id = ObjectId(object)`

Gets the ID of an object.

```lua
-- id (number): The object ID. nil if the object does not exist anymore.
```

- `x, y, z = ObjectPosition(object)`

Gets the world position of an object.

- `facing = ObjectFacing(object)`

Gets the horizontal rotation of an object, in radian.

- `distance = GetDistanceBetweenPositions(x1, y1, z1, x2, y2, z2)`

Gets the distance between two positions in 3D.

- `distance = GetDistanceBetweenObjects(object1, object2)`

Gets the distance between two objects in 3D.

- `x, y, z = GetPositionBetweenObjects(object1, object2, distance)`

Gets the position from object 1 to object 2.

- `x, y, z = GetPositionBetweenPositions(x1, y1, z1, x2, y2, z2, distance)`

Gets the position from position 1 to position 2.

- `x, y, z = GetPositionFromPosition(x1, y1, z1, distance, facing, pitch)`

Gets the position relative to a specific position.

- `facing, pitch = GetAnglesBetweenObjects(object1, object2)`

Gets the angles (facing & pitch) between two objects.

- `isOrNot = ObjectIsFacing(object1, object2[, tolerance = PI/2])`

Checks if an object is facing another object.

- `isOrNot = ObjectIsBehind(object1, object2)`

Checks if an object is behind another object.

[Back to Top](#custom-api)

## In-World (Object-Miscellanea)

- `x, y, z = GetCorpsePosition()`

Gets the position of the corpse.

- `isOrNot = UnitIsLootable(unit)`

Gets whether a unit is lootable.

- `isOrNot = UnitIsSkinnable(unit)`

Gets whether a unit is skinnable.

- `isOrNot = UnitIsMounted(unit)`

Gets whether a unit is mounted.

[Back to Top](#custom-api)

## In-World (Object Manager)

- `count, isUpdated, addedObjects, removedObjects = GetObjectCount()`

Gets the count of all world objects, as well as the changes compared to the last call. This must be called first to search and save the memory objects. (ideally once for every frame)

```lua
-- count (number): The current total count.
-- isUpdated (boolean): Whether the current world objects are changed compared to the last call.
-- addedObjects (table): The added world objects array compared to the last call.
-- removedObjects (table): The added world objects array compared to the last call.
```

- `object = GetObjectWithIndex(index)`

Gets a specific world object by its index in the saved memory objects from the previous call to `GetObjectCount`.

- `count = GetNpcCount([center | x, y, z][, range][, rangeOption])`

Gets the count of specific NPCs, similar as `GetObjectCount` except that it is restricted to NPCs (non-player units) only.

- `npc = GetNpcWithIndex(index)`

Gets a specific NPC by its index in the saved memory objects from the previous call to `GetNpcCount`.

- `count = GetPlayerCount([center | x, y, z][, range][, rangeOption])`

Gets the count of specific players, similar as `GetObjectCount` except that it is restricted to players only.

- `player = GetPlayerWithIndex(index)`

Gets a specific player by its index in the saved memory objects from the previous call to `GetPlayerCount`.

```lua
-- rangeOption can optionally specify the meaning of range, which is one of the several values below.
direct = 0; -- raw distance between myself and the unit
target_reach_only = 1; -- consider only the unit reach on top of the range
both_reaches = 2; -- consider both reaches of myself and the unit on top of the range
both_melee_reaches = 3; -- consider the unit as a melee target on top of the range
both_melee_reaches_with_movement = 4; -- consider the unit as a moving melee target on top of the range
```

- `count = GetGameObjectCount([center | x, y, z][, range])`

Gets the count of specific game objects, similar as `GetNpcCount` except that it is restricted to game objects only.

- `gameObject = GetGameObjectWithIndex(index)`

Gets a specific game object by its index in the saved memory objects from the previous call to `GetGameObjectCount`.

- `count = GetDynamicObjectCount([center | x, y, z][, range])`

Gets the count of specific dynamic objects, similar as `GetNpcCount` except that it is restricted to dynamic objects only.

- `dynamicObject = GetDynamicObjectWithIndex(index)`

Gets a specific dynamic object by its index in the saved memory objects from the previous call to `GetDynamicObjectCount`.

- `count = GetAreaTriggerCount([center | x, y, z][, range])`

Gets the count of specific area triggers, similar as `GetNpcCount` except that it is restricted to area triggers only.

- `areaTrigger = GetAreaTriggerWithIndex(index)`

Gets a specific area trigger by its index in the saved memory objects from the previous call to `GetAreaTriggerCount`.

[Back to Top](#custom-api)

## In-World (Spell)

- `isOrNot = IsAoEPending()`

Checks if there is a pending spell on the cursor.

- `CancelPendingSpell()`

Cancels the pending spell on the cursor.

[Back to Top](#custom-api)

## In-World (State)

- `ResetAfk()`

Resets the timer for AFK.

[Back to Top](#custom-api)

## In-World (Vision)

- `x, y, z = TraceLine(x1, y1, z1, x2, y2, z2, flags)`

Checks ray cast intersection from position 1 to position 2.

- `x, y, z = GetCameraPosition()`

Gets the position of the camera.

- `isOnScreen, x, y = WorldToScreen(object | x, y, z)`

Projects a world position to the screen NDC position.

- `x, y, z[, object] = ScreenToWorld(x, y)`

Projects a screen NDC position to a world object or a terrain position.

[Back to Top](#custom-api)