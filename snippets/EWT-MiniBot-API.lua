-- Converted API
if not wmbapi then -- Use wmbapi variable to detect whether MiniBot's API is fully loaded
	return
end
ObjectTypes = {
	Object = wmbapi.GetObjectTypeFlagsTable().Object,
	Item = wmbapi.GetObjectTypeFlagsTable().Item,
	Container = wmbapi.GetObjectTypeFlagsTable().Container,
	AzeriteEmpoweredItem = wmbapi.GetObjectTypeFlagsTable().AzeriteEmpoweredItem,
	AzeriteItem = wmbapi.GetObjectTypeFlagsTable().AzeriteItem,
	Unit = wmbapi.GetObjectTypeFlagsTable().Unit,
	Player = wmbapi.GetObjectTypeFlagsTable().Player,
	ActivePlayer = wmbapi.GetObjectTypeFlagsTable().ActivePlayer,
	GameObject = wmbapi.GetObjectTypeFlagsTable().GameObject,
	DynamicObject = wmbapi.GetObjectTypeFlagsTable().DynamicObject,
	Corpse = wmbapi.GetObjectTypeFlagsTable().Corpse,
	AreaTrigger = wmbapi.GetObjectTypeFlagsTable().AreaTrigger,
	SceneObject = wmbapi.GetObjectTypeFlagsTable().SceneObject,
	ConversationData = wmbapi.GetObjectTypeFlagsTable().Conversation
}
MovementFlags = {
    Forward = wmbapi.GetUnitMovementFlagsTable().Forward,
    Backward = wmbapi.GetUnitMovementFlagsTable().Backward,
    StrafeLeft = wmbapi.GetUnitMovementFlagsTable().StrafeLeft,
    StrafeRight = wmbapi.GetUnitMovementFlagsTable().StrafeRight,
    TurnLeft = wmbapi.GetUnitMovementFlagsTable().TurnLeft,
    TurnRight = wmbapi.GetUnitMovementFlagsTable().TurnRight,
    PitchUp = wmbapi.GetUnitMovementFlagsTable().PitchUp,
    PitchDown = wmbapi.GetUnitMovementFlagsTable().PitchDown,
    Walking = wmbapi.GetUnitMovementFlagsTable().Walking,
    Immobilized = wmbapi.GetUnitMovementFlagsTable().Immobilized,
    Falling = wmbapi.GetUnitMovementFlagsTable().Falling,
    FallingFar = wmbapi.GetUnitMovementFlagsTable().FallingFar,
    Swimming = wmbapi.GetUnitMovementFlagsTable().Swimming,
    Ascending = wmbapi.GetUnitMovementFlagsTable().Ascending,
    Descending = wmbapi.GetUnitMovementFlagsTable().Descending,
    CanFly = wmbapi.GetUnitMovementFlagsTable().CanFly,
    Flying = wmbapi.GetUnitMovementFlagsTable().Flying,
}
Types = {
    Bool = wmbapi.GetValueTypesTable().Bool,
    Char = wmbapi.GetValueTypesTable().Char,
    Byte = wmbapi.GetValueTypesTable().Byte,
    Short = wmbapi.GetValueTypesTable().Short,
    UShort = wmbapi.GetValueTypesTable().UShort,
    Int = wmbapi.GetValueTypesTable().Int,
    UInt = wmbapi.GetValueTypesTable().UInt,
    Long = wmbapi.GetValueTypesTable().Long,
    ULong = wmbapi.GetValueTypesTable().ULong,
    Float = wmbapi.GetValueTypesTable().Float,
    Double = wmbapi.GetValueTypesTable().Double,
    String = wmbapi.GetValueTypesTable().String,
    GUID = wmbapi.GetValueTypesTable().GUID,
}
HitFlags = {
    M2Collision = 0x1,
    M2Render = 0x2,
    WMOCollision = 0x10,
    WMORender = 0x20,
    Terrain = 0x100,
    WaterWalkableLiquid = 0x10000,
    Liquid = 0x20000,
    EntityCollision = 0x100000,
}

StopFalling = wmbapi.StopFalling
ObjectTypeFlags = wmbapi.ObjectTypeFlags
GetObjectWithPointer = wmbapi.GetObject
ObjectExists = wmbapi.ObjectExists
ObjectIsVisible = UnitIsVisible
ObjectPosition = wmbapi.ObjectPosition
ObjectFacing = wmbapi.ObjectFacing
ObjectName = UnitName
ObjectID = wmbapi.ObjectId
ObjectIsUnit = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Unit) end
ObjectIsPlayer = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Player) end
ObjectIsGameObject = function(obj) return obj and ObjectIsType(obj,ObjectTypes.GameObject) end
ObjectIsAreaTrigger = function(obj) return obj and ObjectIsType(obj,ObjectTypes.AreaTrigger) end
GetDistanceBetweenPositions = wmbapi.GetDistanceBetweenPositions
GetDistanceBetweenObjects = wmbapi.GetDistanceBetweenObjects
GetPositionBetweenObjects = wmbapi.GetPositionBetweenObjects
GetPositionFromPosition = wmbapi.GetPositionFromPosition
GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi end
GetPositionBetweenPositions = wmbapi.GetPositionBetweenPositions
ObjectIsFacing = wmbapi.ObjectIsFacing
ObjectInteract = InteractUnit
GetObjectCount = wmbapi.GetObjectCount
GetObjectWithIndex = wmbapi.GetObjectWithIndex
GetObjectWithGUID = wmbapi.GetObjectWithGUID
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitTarget = wmbapi.UnitTarget
UnitCastID = function(unit) return select(7,GetSpellInfo(UnitCastingInfo(unit))), select(7,GetSpellInfo(UnitChannelInfo(unit))), wmbapi.UnitCastingTarget(unit), wmbapi.UnitCastingTarget(unit) end
TraceLine = wmbapi.TraceLine
GetCameraPosition = wmbapi.GetCameraPosition
CancelPendingSpell = wmbapi.CancelPendingSpell
ClickPosition = wmbapi.ClickPosition
IsAoEPending = wmbapi.IsAoEPending
GetTargetingSpell = wmbapi.IsAoEPending
WorldToScreen = function(...) 
	local x, y = select(2,wmbapi.WorldToScreen(...))
	return x * 1365, y * 768
WorldToScreenRaw = function(...)
	local x, y = select(2,wmbapi.WorldToScreen(...))
	return x, 1-y
end
ScreenToWorld = function(X, Y) return wmbapi.ScreenToWorld(X / 1365, Y / 768) end
GetDirectoryFiles = wmbapi.GetDirectoryFiles
ReadFile = wmbapi.ReadFile
WriteFile = wmbapi.WriteFile
CreateDirectory = wmbapi.CreateDirectory
GetSubdirectories = wmbapi.GetDirectoryFolders
GetWoWDirectory = wmbapi.GetWoWDirectory
GetHackDirectory = wmbapi.GetAppDirectory
AddEventCallback = function(Event, Callback)
	if not MiniBotFrames then
		MiniBotFrames = CreateFrame("Frame")
		MiniBotFrames:SetScript("OnEvent",MiniBotFrames_OnEvent)
	end
	MiniBotFrames:RegisterEvent(Event)
end
AddFrameCallback = function(frame)
	if not MiniBotFrames then
		MiniBotFrames = CreateFrame("Frame")
	end
	MiniBotFrames:SetScript("OnUpdate",frame)
end
SendHTTPRequest = wmbapi.SendHttpRequest
GetKeyState = wmbapi.GetKeyState
GetWoWWindow = function()
	return GetScreenWidth() * 1.2, GetScreenHeight() * 1.2
end
StopMoving = function()
	MoveAndSteerStop()
	MoveForwardStop()
	MoveBackwardStop()
	PitchDownStop()
	PitchUpStop()
	StrafeLeftStop()
	StrafeRightStop()
	TurnLeftStop()
	TurnOrActionStop()
	TurnRightStop()
	if GetUnitSpeed("player") > 0 then
		MoveForwardStart()
		MoveForwardStop()
	end
	if GetKeyState(0x02) then 
		TurnOrActionStart()
	elseif GetKeyState(0x01) then
		CameraOrSelectOrMoveStart()
	end
end
IsMeshLoaded = wmbapi.IsMapLoaded
CalculatePath = wmbapi.FindPath
SetMaximumClimbAngle = wmbapi.SetClimbAngle
GetMapId = wmbapi.GetCurrentMapInfo
ObjectGUID = UnitGUID
ObjectEntryID = UnitGUID
ObjectIsType = wmbapi.ObjectIsType
GetAnglesBetweenObjects = wmbapi.GetAnglesBetweenObjects
FaceDirection = function(a) if wmbapi.GetObject(a) then wmbapi.FaceDirection(GetAnglesBetweenObjects(a,"player")*2,true) else wmbapi.FaceDirection(a,true) end end
ObjectIsBehind = wmbapi.ObjectIsBehind
ObjectDescriptor = wmbapi.ObjectDescriptor
ObjectTypeFlags = wmbapi.ObjectTypeFlags
ObjectField = wmbapi.ObjectField
GetActivePlayer = function() return "player" end
UnitIsFacing = function(unit1,unit2,degree) return ObjectIsFacing(unit1,unit2,math.rad(degree)/2) end
UnitIsFalling = function(unit) return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Falling end
UnitMovementFlags = wmbapi.UnitMovementFlags
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitFlags = wmbapi.UnitFlags
PlayerFlags = function() return wmbapi.UnitFlags("player") end
ObjectCreator = wmbapi.UnitCreator
UnitCanBeLooted = wmbapi.UnitIsLootable
UnitCanBeSkinned = wmbapi.UnitIsSkinnable
UnitPitch = wmbapi.UnitPitch
GetGroundZ = function(StartX, StartY, Flags) return TraceLine(StartX, StartY, 10000, StartX, StartY, -10000, Flags or 0x10) end
GetCorpsePosition = wmbapi.GetCorpsePosition
MoveTo = wmbapi.MoveTo
ObjectDynamicFlags = wmbapi.ObjectDynamicFlags
GetUnitTransport = wmbapi.UnitTransport
GetUnitMovement = wmbapi.UnitMovementField
WebsocketClose = wmbapi.CloseWebsocket
WebsocketSend = wmbapi.SendWebsocketData
ObjectPointer = wmbapi.GetObject
UnitCreatureTypeID = wmbapi.UnitCreatureTypeId
AesEncrypt = wmbapi.AesEncrypt
AesDecrypt = wmbapi.AesDecrypt
GetMousePosition = function() 
	local X, Y = GetCursorPosition()		
	return GetScreenWidth() * 1.2 * X / 1365, GetScreenHeight() * 1.2 * Y / 768
end
AddLuaString = function(String, Name) return RunScript(Name, String) end
if LibDraw then
	SetDrawColor = LibDraw.SetColor
	Draw2DLine = LibDraw.Draw2DLine
	Draw2DText = function(textX, textY, text)
		local F = tremove(LibDraw.fontstrings) or LibDraw.canvas:CreateFontString(nil, "BACKGROUND")
		F:SetFontObject("GameFontNormal")
		F:SetText(text)
		F:SetTextColor(LibDraw.line.r, LibDraw.line.g, LibDraw.line.b, LibDraw.line.a)
		if p then
			local width = F:GetStringWidth() - 4
			local offsetX = width*0.5
			local offsetY = F:GetStringHeight() + 3.5
			local pwidth = width*p*0.01
			FHAugment.drawLine(textX-offsetX, textY-offsetY, (textX+offsetX), textY-offsetY, 4, r, g, b, 0.25)
			FHAugment.drawLine(textX-offsetX, textY-offsetY, (textX+offsetX)-(width-pwidth), textY-offsetY, 4, r, g, b, 1)
		end
		F:SetPoint("TOPLEFT", UIParent, "TOPLEFT", textX-(F:GetStringWidth()*0.5), textY)
		F:Show()
		tinsert(LibDraw.fontstrings_used, F) 
	end
end
ObjectRawType = function(obj)
	local result = 0
	local type_flags = ObjectTypeFlags(obj)
	if (band(type_flags, ObjectTypes.ActivePlayer) > 0) then
		result = 7
	elseif (band(type_flags, ObjectTypes.Player) > 0) then
		result = 6
	elseif (band(type_flags, ObjectTypes.Unit) > 0) then
		result = 5
	elseif (band(type_flags, ObjectTypes.GameObject) > 0) then
		result = 8
	elseif (band(type_flags, ObjectTypes.AreaTrigger) > 0) then
		result = 11
	elseif (band(type_flags, ObjectTypes.Item) > 0) then
		result = 1
	elseif (band(type_flags, ObjectTypes.Container) > 0) then
		result = 2
	elseif (band(type_flags, ObjectTypes.AzeriteEmpoweredItem) > 0) then
		result = 3
	elseif (band(type_flags, ObjectTypes.AzeriteItem) > 0) then
		result = 4
	elseif (band(type_flags, ObjectTypes.DynamicObject) > 0) then
		result = 9
	elseif (band(type_flags, ObjectTypes.Corpse) > 0) then
		result = 10
	elseif (band(type_flags, ObjectTypes.SceneObject) > 0) then
		result = 12
	elseif (band(type_flags, ObjectTypes.ConversationData) > 0) then
		result = 13
	end
	return result
end
Offsets = {
	["cgactiveplayerdata__pvpinfo"]="CGActivePlayerData__pvpInfo",
	["cgactiveplayerdata__parrypercentage"]="CGActivePlayerData__parryPercentage",
	["cgunitdata__petnumber"]="CGUnitData__petNumber",
	["cgactiveplayerdata__overridespellsid"]="CGActivePlayerData__overrideSpellsID",
	["cgactiveplayerdata__knowntitles"]="CGActivePlayerData__knownTitles",
	["cgobjectdata__m_dynamicflags"]="CGObjectData__m_dynamicFlags",
	["cgplayerdata__loottargetguid"]="CGPlayerData__lootTargetGUID",
	["cgactiveplayerdata__ammoid"]="CGActivePlayerData__ammoID",
	["cgunitdata__aurastate"]="CGUnitData__auraState",
	["cgsceneobjectdata__m_createdby"]="CGSceneObjectData__m_createdBy",
	["cgunitdata__summonedby"]="CGUnitData__summonedBy",
	["cgplayerdata__haircolorid"]="CGPlayerData__hairColorID",
	["cgactiveplayerdata__pvppowerdamage"]="CGActivePlayerData__pvpPowerDamage",
	["cgunitdata__interactspellid"]="CGUnitData__interactSpellID",
	["cgunitdata__rangedattackpower"]="CGUnitData__rangedAttackPower",
	["cgactiveplayerdata__exploredzones"]="CGActivePlayerData__exploredZones",
	["cgunitdata__petnametimestamp"]="CGUnitData__petNameTimestamp",
	["cgactiveplayerdata__lastweekdishonorablekills"]="CGActivePlayerData__lastWeekDishonorableKills",
	["cgareatriggerdata__m_creatingeffectguid"]="CGAreaTriggerData__m_creatingEffectGUID",
	["cgactiveplayerdata__uihitmodifier"]="CGActivePlayerData__uiHitModifier",
	["cgcontainerdata__m_numslots"]="CGContainerData__m_numSlots",
	["cgcorpsedata__m_guildguid"]="CGCorpseData__m_guildGUID",
	["cgactiveplayerdata__trackresourcemask"]="CGActivePlayerData__trackResourceMask",
	["cgunitdata__effectivelevel"]="CGUnitData__effectiveLevel",
	["cgdynamicobjectdata__m_casttime"]="CGDynamicObjectData__m_castTime",
	["cgunitdata__scaleduration"]="CGUnitData__scaleDuration",
	["cgunitdata__overridedisplaypowerid"]="CGUnitData__overrideDisplayPowerID",
	["cgactiveplayerdata__moddamagedoneneg"]="CGActivePlayerData__modDamageDoneNeg",
	["cgunitdata__lookatcontrollerid"]="CGUnitData__lookAtControllerID",
	["cgdynamicobjectdata__m_caster"]="CGDynamicObjectData__m_caster",
	["cgunitdata__power"]="CGUnitData__power",
	["cggameobjectdata__m_level"]="CGGameObjectData__m_level",
	["cgunitdata__flags2_union"]="CGUnitData__flags2_union",
	["cgactiveplayerdata__bagslotflags"]="CGActivePlayerData__bagSlotFlags",
	["cgunitdata__nativexdisplayscale_union"]="CGUnitData__nativeXDisplayScale_union",
	["cgunitdata__createdby"]="CGUnitData__createdBy",
	["cgactiveplayerdata__modpethaste"]="CGActivePlayerData__modPetHaste",
	["cgunitdata__rangedattackpowermodpos"]="CGUnitData__rangedAttackPowerModPos",
	["cgunitdata__battlepetcompanionnametimestamp"]="CGUnitData__battlePetCompanionNameTimestamp",
	["cgunitdata__attackpowermultiplier"]="CGUnitData__attackPowerMultiplier",
	["cgactiveplayerdata__professionskillline"]="CGActivePlayerData__professionSkillLine",
	["cgunitdata__offhandweaponattackpower"]="CGUnitData__offHandWeaponAttackPower",
	["cgunitdata__maxhealthmodifier"]="CGUnitData__maxHealthModifier",
	["cgactiveplayerdata__modspellpowerpercent"]="CGActivePlayerData__modSpellPowerPercent",
	["cgactiveplayerdata__pvprankprogress"]="CGActivePlayerData__pvpRankProgress",
	["cgareatriggerdata__m_spellxspellvisualid"]="CGAreaTriggerData__m_spellXSpellVisualID",
	["cgunitdata__rangedattackpowermultiplier"]="CGUnitData__rangedAttackPowerMultiplier",
	["cgunitdata__modhaste"]="CGUnitData__modHaste",
	["cgactiveplayerdata__modperiodichealingdonepercent"]="CGActivePlayerData__modPeriodicHealingDonePercent",
	["cgunitdata__shapeshiftform"]="CGUnitData__shapeshiftForm",
	["cgunitdata__scalinghealthitemlevelcurveid"]="CGUnitData__scalingHealthItemLevelCurveID",
	["cgunitdata__modcastingspeed"]="CGUnitData__modCastingSpeed",
	["cggameobjectdata__m_parentrotation"]="CGGameObjectData__m_parentRotation",
	["cgareatriggerdata__m_spellid"]="CGAreaTriggerData__m_spellID",
	["cgitemdata__m_modifiersmask"]="CGItemData__m_modifiersMask",
	["cgunitdata__nativedisplayid"]="CGUnitData__nativeDisplayID",
	["cgunitdata__mountdisplayid"]="CGUnitData__mountDisplayID",
	["cgareatriggerdata__m_caster"]="CGAreaTriggerData__m_caster",
	["cgplayerdata__avgitemlevel"]="CGPlayerData__avgItemLevel",
	["cgunitdata__displayid"]="CGUnitData__displayID",
	["cgunitdata__battlepetdbid"]="CGUnitData__battlePetDBID",
	["cgdynamicobjectdata__m_spellxspellvisualid"]="CGDynamicObjectData__m_spellXSpellVisualID",
	["cgactiveplayerdata__trialxp"]="CGActivePlayerData__trialXP",
	["cgplayerdata__guilddeletedate"]="CGPlayerData__guildDeleteDate",
	["cgareatriggerdata__m_decalpropertiesid"]="CGAreaTriggerData__m_decalPropertiesID",
	["cgunitdata__basemana"]="CGUnitData__baseMana",
	["cgitemdata__m_durability"]="CGItemData__m_durability",
	["cgactiveplayerdata__weapondmgmultipliers"]="CGActivePlayerData__weaponDmgMultipliers",
	["cgitemdata__m_enchantment"]="CGItemData__m_enchantment",
	["cgplayerdata__wowaccount"]="CGPlayerData__wowAccount",
	["cgunitdata__powercostmodifier"]="CGUnitData__powerCostModifier",
	["cgunitdata__npcflags"]="CGUnitData__npcFlags",
	["cgactiveplayerdata__skill"]="CGActivePlayerData__skill",
	["cgunitdata__resistancebuffmodsnegative"]="CGUnitData__resistanceBuffModsNegative",
	["cgunitdata__modrangedhaste"]="CGUnitData__modRangedHaste",
	["cgplayerdata__duelteam"]="CGPlayerData__duelTeam",
	["cgunitdata__flags3"]="CGUnitData__flags3",
	["cgactiveplayerdata__combotarget"]="CGActivePlayerData__comboTarget",
	["cgunitdata__maxoffhanddamage"]="CGUnitData__maxOffHandDamage",
	["cgunitdata__minitemlevel"]="CGUnitData__minItemLevel",
	["cgactiveplayerdata__moddamagedonepercent"]="CGActivePlayerData__modDamageDonePercent",
	["cgactiveplayerdata__scalingplayerleveldelta"]="CGActivePlayerData__scalingPlayerLevelDelta",
	["cgunitdata__maxitemlevel"]="CGUnitData__maxItemLevel",
	["cgunitdata__maxpower"]="CGUnitData__maxPower",
	["cgunitdata__scalingdamageitemlevelcurveid"]="CGUnitData__scalingDamageItemLevelCurveID",
	["cgactiveplayerdata__honor"]="CGActivePlayerData__honor",
	["cgobjectdata__m_scale"]="CGObjectData__m_scale",
	["cgcorpsedata__m_factiontemplate"]="CGCorpseData__m_factionTemplate",
	["cgplayerdata__currentbattlepetbreedquality"]="CGPlayerData__currentBattlePetBreedQuality",
	["cgactiveplayerdata__honornextlevel"]="CGActivePlayerData__honorNextLevel",
	["cgunitdata__summon"]="CGUnitData__summon",
	["cgitemdata__m_stackcount"]="CGItemData__m_stackCount",
	["cgitemdata__m_artifactxp"]="CGItemData__m_artifactXP",
	["cgunitdata__scalinglevelmin"]="CGUnitData__scalingLevelMin",
	["cgactiveplayerdata__questcompleted"]="CGActivePlayerData__questCompleted",
	["cgactiveplayerdata__shieldblock"]="CGActivePlayerData__shieldBlock",
	["cgactiveplayerdata__dodgepercentagefromattribute"]="CGActivePlayerData__dodgePercentageFromAttribute",
	["cgunitdata__summonedbyhomerealm"]="CGUnitData__summonedByHomeRealm",
	["cgitemdata__m_context"]="CGItemData__m_context",
	["cgunitdata__mainhandweaponattackpower"]="CGUnitData__mainHandWeaponAttackPower",
	["cgunitdata__powercostmultiplier"]="CGUnitData__powerCostMultiplier",
	["cgactiveplayerdata__overridezonepvptype"]="CGActivePlayerData__overrideZonePVPType",
	["cgareatriggerdata__m_duration"]="CGAreaTriggerData__m_duration",
	["cgcorpsedata__m_partyguid"]="CGCorpseData__m_partyGUID",
	["cgunitdata__scalinglevelmax"]="CGUnitData__scalingLevelMax",
	["cgactiveplayerdata__parrypercentagefromattribute"]="CGActivePlayerData__parryPercentageFromAttribute",
	["cgactiveplayerdata__moddamagedonepos"]="CGActivePlayerData__modDamageDonePos",
	["cgunitdata__statnegbuff"]="CGUnitData__statNegBuff",
	["cgdynamicobjectdata__m_spellid"]="CGDynamicObjectData__m_spellID",
	["cgunitdata__target"]="CGUnitData__target",
	["cgobjectdata__m_guid"]="CGObjectData__m_guid",
	["cgactiveplayerdata__xp"]="CGActivePlayerData__XP",
	["cgunitdata__charm"]="CGUnitData__charm",
	["cgactiveplayerdata__pvppowerhealing"]="CGActivePlayerData__pvpPowerHealing",
	["cgactiveplayerdata__lfgbonusfactionid"]="CGActivePlayerData__lfgBonusFactionID",
	["cgcorpsedata__m_skinid"]="CGCorpseData__m_skinID",
	["cgunitdata__setattackspeedaura"]="CGUnitData__setAttackSpeedAura",
	["cgunitdata__animtier"]="CGUnitData__animTier",
	["cgunitdata__attackpower"]="CGUnitData__attackPower",
	["cgunitdata__flags2"]="CGUnitData__flags2",
	["cgunitdata__rangedweaponattackpower"]="CGUnitData__rangedWeaponAttackPower",
	["cgunitdata__charmedby"]="CGUnitData__charmedBy",
	["cggameobjectdata__m_guildguid"]="CGGameObjectData__m_guildGUID",
	["cgplayerdata__customdisplayoption"]="CGPlayerData__customDisplayOption",
	["cgactiveplayerdata__yesterdaydishonorablekills"]="CGActivePlayerData__yesterdayDishonorableKills",
	["cgdynamicobjectdata__m_type"]="CGDynamicObjectData__m_type",
	["cgitemdata__m_itemappearancemodid"]="CGItemData__m_itemAppearanceModID",
	["cgcorpsedata__m_items"]="CGCorpseData__m_items",
	["cgitemdata__m_giftcreator"]="CGItemData__m_giftCreator",
	["cgunitdata__guildguid"]="CGUnitData__guildGUID",
	["cgitemdata__m_propertyseed"]="CGItemData__m_propertySeed",
	["cgunitdata__trainingpointstotal"]="CGUnitData__trainingPointsTotal",
	["cgactiveplayerdata__modtargetphysicalresistance"]="CGActivePlayerData__modTargetPhysicalResistance",
	["cgunitdata__scalingleveldelta"]="CGUnitData__scalingLevelDelta",
	["cgunitdata__battlepetcompanionguid"]="CGUnitData__battlePetCompanionGUID",
	["cgactiveplayerdata__nextlevelxp"]="CGActivePlayerData__nextLevelXP",
	["cgunitdata__stateanimkitid"]="CGUnitData__stateAnimKitID",
	["cgcontainerdata__m_slots"]="CGContainerData__m_slots",
	["cgactiveplayerdata__offhandexpertise"]="CGActivePlayerData__offhandExpertise",
	["cgactiveplayerdata__maxtalenttiers"]="CGActivePlayerData__maxTalentTiers",
	["cgsceneobjectdata__m_scriptpackageid"]="CGSceneObjectData__m_scriptPackageID",
	["cgitemdata__m_containedin"]="CGItemData__m_containedIn",
	["cgactiveplayerdata__mainhandexpertise"]="CGActivePlayerData__mainhandExpertise",
	["cgactiveplayerdata__rangedexpertise"]="CGActivePlayerData__rangedExpertise",
	["cgactiveplayerdata__farsightobject"]="CGActivePlayerData__farsightObject",
	["cgplayerdata__guildtimestamp"]="CGPlayerData__guildTimeStamp",
	["cgactiveplayerdata__numrespecs"]="CGActivePlayerData__numRespecs",
	["cgunitdata__health"]="CGUnitData__health",
	["cgunitdata__lifesteal"]="CGUnitData__lifesteal",
	["cgactiveplayerdata__uispellhitmodifier"]="CGActivePlayerData__uiSpellHitModifier",
	["cgareatriggerdata__m_timetotarget"]="CGAreaTriggerData__m_timeToTarget",
	["cgplayerdata__playertitle"]="CGPlayerData__playerTitle",
	["cgplayerdata__virtualplayerrealm"]="CGPlayerData__virtualPlayerRealm",
	["cgunitdata__mindamage"]="CGUnitData__minDamage",
	["cgunitdata__lookslikecreatureid"]="CGUnitData__looksLikeCreatureID",
	["cgunitdata__displayscale"]="CGUnitData__displayScale",
	["cgunitdata__maxhealth"]="CGUnitData__maxHealth",
	["cgactiveplayerdata__localflags"]="CGActivePlayerData__localFlags",
	["cgplayerdata__inebriation"]="CGPlayerData__inebriation",
	["cgactiveplayerdata__noreagentcostmask"]="CGActivePlayerData__noReagentCostMask",
	["cgunitdata__modspellhaste"]="CGUnitData__modSpellHaste",
	["cgactiveplayerdata__summonedbattlepetguid"]="CGActivePlayerData__summonedBattlePetGUID",
	["cgareatriggerdata__m_timetotargetextrascale_union"]="CGAreaTriggerData__m_timeToTargetExtraScale_union",
	["cgactiveplayerdata__offhandcritpercentage"]="CGActivePlayerData__offhandCritPercentage",
	["cgactiveplayerdata__lastweekrank"]="CGActivePlayerData__lastWeekRank",
	["cgunitdata__petnextlevelexperience"]="CGUnitData__petNextLevelExperience",
	["cgdynamicobjectdata__m_radius"]="CGDynamicObjectData__m_radius",
	["cgactiveplayerdata__speed"]="CGActivePlayerData__speed",
	["cgunitdata__wildbattlepetlevel"]="CGUnitData__wildBattlePetLevel",
	["cgunitdata__flags"]="CGUnitData__flags",
	["cgplayerdata__honorlevel"]="CGPlayerData__honorLevel",
	["cgunitdata__statposbuff"]="CGUnitData__statPosBuff",
	["cgactiveplayerdata__coinage"]="CGActivePlayerData__coinage",
	["cgunitdata__minitemlevelcutoff"]="CGUnitData__minItemLevelCutoff",
	["cgsceneobjectdata__m_scenetype"]="CGSceneObjectData__m_sceneType",
	["cgcorpsedata__m_owner"]="CGCorpseData__m_owner",
	["cgsceneobjectdata__m_rndseedval"]="CGSceneObjectData__m_rndSeedVal",
	["cgareatriggerdata__m_boundsradius2d"]="CGAreaTriggerData__m_boundsRadius2D",
	["cgactiveplayerdata__characterpoints"]="CGActivePlayerData__characterPoints",
	["cgunitdata__stateworldeffectid"]="CGUnitData__stateWorldEffectID",
	["cgitemdata__m_spellcharges"]="CGItemData__m_spellCharges",
	["cgareatriggerdata__m_timetotarget_union"]="CGAreaTriggerData__m_timeToTarget_union",
	["cgcorpsedata__m_customdisplayoption"]="CGCorpseData__m_customDisplayOption",
	["cgcorpsedata__m_dynamicflags"]="CGCorpseData__m_dynamicFlags",
	["cgareatriggerdata__m_timetotargetextrascale"]="CGAreaTriggerData__m_timeToTargetExtraScale",
	["cgcorpsedata__m_flags"]="CGCorpseData__m_flags",
	["cggameobjectdata__m_customparam_union"]="CGGameObjectData__m_customParam_union",
	["cgactiveplayerdata__watchedfactionindex"]="CGActivePlayerData__watchedFactionIndex",
	["cggameobjectdata__m_spawntrackingstateanimkitid"]="CGGameObjectData__m_spawnTrackingStateAnimKitID",
	["cggameobjectdata__m_spawntrackingstateanimid"]="CGGameObjectData__m_spawnTrackingStateAnimID",
	["cggameobjectdata__m_statespellvisualid"]="CGGameObjectData__m_stateSpellVisualID",
	["cgunitdata__combatreach"]="CGUnitData__combatReach",
	["cgactiveplayerdata__trackcreaturemask"]="CGActivePlayerData__trackCreatureMask",
	["cgconversationdata__m_lastlineendtime"]="CGConversationData__m_lastLineEndTime",
	["cgplayerdata__visibleitems"]="CGPlayerData__visibleItems",
	["cggameobjectdata__m_spellvisualid"]="CGGameObjectData__m_spellVisualID",
	["cgactiveplayerdata__maxlevel"]="CGActivePlayerData__maxLevel",
	["cggameobjectdata__m_percenthealth_union"]="CGGameObjectData__m_percentHealth_union",
	["cgareatriggerdata__m_timetotargetscale"]="CGAreaTriggerData__m_timeToTargetScale",
	["cggameobjectdata__m_flags_union"]="CGGameObjectData__m_flags_union",
	["cggameobjectdata__m_percenthealth"]="CGGameObjectData__m_percentHealth",
	["cgactiveplayerdata__pvplastweekstiermaxfromwins"]="CGActivePlayerData__pvpLastWeeksTierMaxFromWins",
	["cgplayerdata__taximountanimkitid"]="CGPlayerData__taxiMountAnimKitID",
	["cgactiveplayerdata__pvptiermaxfromwins"]="CGActivePlayerData__pvpTierMaxFromWins",
	["cgplayerdata__guildlevel"]="CGPlayerData__guildLevel",
	["cgactiveplayerdata__bankbagslotflags"]="CGActivePlayerData__bankBagSlotFlags",
	["cgunitdata__factiontemplate"]="CGUnitData__factionTemplate",
	["cgactiveplayerdata__lootspecid"]="CGActivePlayerData__lootSpecID",
	["cgactiveplayerdata__maxcreaturescalinglevel"]="CGActivePlayerData__maxCreatureScalingLevel",
	["cgunitdata__minrangeddamage"]="CGUnitData__minRangedDamage",
	["cgactiveplayerdata__overridespellpowerbyappercent"]="CGActivePlayerData__overrideSpellPowerByAPPercent",
	["cgactiveplayerdata__combatratings"]="CGActivePlayerData__combatRatings",
	["cgactiveplayerdata__restinfo"]="CGActivePlayerData__restInfo",
	["cgactiveplayerdata__lifetimedishonorablekills"]="CGActivePlayerData__lifetimeDishonorableKills",
	["cgactiveplayerdata__sessiondishonorablekills"]="CGActivePlayerData__sessionDishonorableKills",
	["cgactiveplayerdata__buybackprice"]="CGActivePlayerData__buybackPrice",
	["cgactiveplayerdata__pvpmedals"]="CGActivePlayerData__pvpMedals",
	["cgactiveplayerdata__lastweekcontribution"]="CGActivePlayerData__lastWeekContribution",
	["cgactiveplayerdata__overrideapbyspellpowerpercent"]="CGActivePlayerData__overrideAPBySpellPowerPercent",
	["cgactiveplayerdata__versatilitybonus"]="CGActivePlayerData__versatilityBonus",
	["cgunitdata__nativedisplayid_union"]="CGUnitData__nativeDisplayID_union",
	["cgunitdata__modhasteregen"]="CGUnitData__modHasteRegen",
	["cgunitdata__channeldata_union"]="CGUnitData__channelData_union",
	["cgitemdata__m_maxdurability"]="CGItemData__m_maxDurability",
	["cgactiveplayerdata__thisweekcontribution"]="CGActivePlayerData__thisWeekContribution",
	["cgunitdata__maxrangeddamage"]="CGUnitData__maxRangedDamage",
	["cgareatriggerdata__m_spellforvisuals"]="CGAreaTriggerData__m_spellForVisuals",
	["cgactiveplayerdata__thisweekdishonorablekills"]="CGActivePlayerData__thisWeekDishonorableKills",
	["cgactiveplayerdata__spellcritpercentage"]="CGActivePlayerData__spellCritPercentage",
	["cgactiveplayerdata__modhealingpercent"]="CGActivePlayerData__modHealingPercent",
	["cgunitdata__rangedattackpowermodneg"]="CGUnitData__rangedAttackPowerModNeg",
	["cgunitdata__maxdamage"]="CGUnitData__maxDamage",
	["cgplayerdata__fakeinebriation"]="CGPlayerData__fakeInebriation",
	["cgunitdata__mountdisplayid_union"]="CGUnitData__mountDisplayID_union",
	["cgactiveplayerdata__modresiliencepercent"]="CGActivePlayerData__modResiliencePercent",
	["cgitemdata__m_creator"]="CGItemData__m_creator",
	["cgactiveplayerdata__yesterdaycontribution"]="CGActivePlayerData__yesterdayContribution",
	["cggameobjectdata__m_flags"]="CGGameObjectData__m_flags",
	["cgunitdata__contenttuningid"]="CGUnitData__contentTuningID",
	["cgunitdata__attackpowermodpos"]="CGUnitData__attackPowerModPos",
	["cgactiveplayerdata__numbackpackslots"]="CGActivePlayerData__numBackpackSlots",
	["cgunitdata__modpowerregen"]="CGUnitData__modPowerRegen",
	["cgitemdata__m_expiration"]="CGItemData__m_expiration",
	["cgactiveplayerdata__versatility"]="CGActivePlayerData__versatility",
	["cgunitdata__scalingfactiongroup"]="CGUnitData__scalingFactionGroup",
	["cgactiveplayerdata__weaponatkspeedmultipliers"]="CGActivePlayerData__weaponAtkSpeedMultipliers",
	["cgactiveplayerdata__homerealmtimeoffset"]="CGActivePlayerData__homeRealmTimeOffset",
	["cgunitdata__rangedattackroundbasetime"]="CGUnitData__rangedAttackRoundBaseTime",
	["cgactiveplayerdata__lifetimehonorablekills"]="CGActivePlayerData__lifetimeHonorableKills",
	["cgunitdata__lookatcontrollertarget"]="CGUnitData__lookAtControllerTarget",
	["cgactiveplayerdata__sturdiness"]="CGActivePlayerData__sturdiness",
	["cgunitdata__attackroundbasetime"]="CGUnitData__attackRoundBaseTime",
	["cgactiveplayerdata__avoidance"]="CGActivePlayerData__avoidance",
	["cgactiveplayerdata__rangedcritpercentage"]="CGActivePlayerData__rangedCritPercentage",
	["cgunitdata__hoverheight"]="CGUnitData__hoverHeight",
	["cgunitdata__displaypower"]="CGUnitData__displayPower",
	["cgactiveplayerdata__critpercentage"]="CGActivePlayerData__critPercentage",
	["cgunitdata__basehealth"]="CGUnitData__baseHealth",
	["cggameobjectdata__m_displayid"]="CGGameObjectData__m_displayID",
	["cgunitdata__statespellvisualid"]="CGUnitData__stateSpellVisualID",
	["cgunitdata__resistances"]="CGUnitData__resistances",
	["cgactiveplayerdata__dodgepercentage"]="CGActivePlayerData__dodgePercentage",
	["cgunitdata__level"]="CGUnitData__level",
	["cgitemdata__m_randompropertiesid"]="CGItemData__m_randomPropertiesID",
	["cgplayerdata__currentspecid"]="CGPlayerData__currentSpecID",
	["cgactiveplayerdata__blockpercentage"]="CGActivePlayerData__blockPercentage",
	["cgunitdata__nativexdisplayscale"]="CGUnitData__nativeXDisplayScale",
	["cgunitdata__stats"]="CGUnitData__stats",
	["cgunitdata__resistancebuffmodspositive"]="CGUnitData__resistanceBuffModsPositive",
	["cgunitdata__createdbyspell"]="CGUnitData__createdBySpell",
	["cgplayerdata__pvprank"]="CGPlayerData__pvpRank",
	["cgactiveplayerdata__mastery"]="CGActivePlayerData__mastery",
	["cgactiveplayerdata__modhealingdonepercent"]="CGActivePlayerData__modHealingDonePercent",
	["cgactiveplayerdata__invslots"]="CGActivePlayerData__invSlots",
	["cgcorpsedata__m_facialhairstyleid"]="CGCorpseData__m_facialHairStyleID",
	["cgactiveplayerdata__modtargetresistance"]="CGActivePlayerData__modTargetResistance",
	["cgplayerdata__questlog"]="CGPlayerData__questLog",
	["cgactiveplayerdata__combatratingexpertise"]="CGActivePlayerData__combatRatingExpertise",
	["cggameobjectdata__m_factiontemplate"]="CGGameObjectData__m_factionTemplate",
	["cgareatriggerdata__m_timetotargetscale_union"]="CGAreaTriggerData__m_timeToTargetScale_union",
	["cgunitdata__stateanimid"]="CGUnitData__stateAnimID",
	["cggameobjectdata__m_customparam"]="CGGameObjectData__m_customParam",
	["cgitemdata__m_owner"]="CGItemData__m_owner",
	["cgplayerdata__duelarbiter"]="CGPlayerData__duelArbiter",
	["cgplayerdata__playerflags"]="CGPlayerData__playerFlags",
	["cgcorpsedata__m_displayid"]="CGCorpseData__m_displayID",
	["cgplayerdata__playerflagsex"]="CGPlayerData__playerFlagsEx",
	["cgunitdata__critter"]="CGUnitData__critter",
	["cgunitdata__modtimerate"]="CGUnitData__modTimeRate",
	["cgitemdata__m_createplayedtime"]="CGItemData__m_createPlayedTime",
	["cgunitdata__minoffhanddamage"]="CGUnitData__minOffHandDamage",
	["cgunitdata__attackpowermodneg"]="CGUnitData__attackPowerModNeg",
	["cgitemdata__m_dynamicflags"]="CGItemData__m_dynamicFlags",
	["cgactiveplayerdata__modhealingdonepos"]="CGActivePlayerData__modHealingDonePos",
	["cgunitdata__lookslikemountid"]="CGUnitData__looksLikeMountID",
	["cgunitdata__flags_union"]="CGUnitData__flags_union",
	["cggameobjectdata__m_stateworldeffectid"]="CGGameObjectData__m_stateWorldEffectID",
	["cgunitdata__boundingradius"]="CGUnitData__boundingRadius",
	["cgunitdata__flags3_union"]="CGUnitData__flags3_union",
	["cgunitdata__sex"]="CGUnitData__sex",
	["cgactiveplayerdata__petspellpower"]="CGActivePlayerData__petSpellPower",
	["cggameobjectdata__m_createdby"]="CGGameObjectData__m_createdBy",
	["cgactiveplayerdata__buybacktimestamp"]="CGActivePlayerData__buybackTimestamp",
	["cgobjectdata__m_entryid"]="CGObjectData__m_entryID",
	["cgunitdata__emotestate"]="CGUnitData__emoteState",
	["cgplayerdata__guildrankid"]="CGPlayerData__guildRankID",
	["cgunitdata__channeldata"]="CGUnitData__channelData",
	["cgunitdata__virtualitems"]="CGUnitData__virtualItems",
	["cgunitdata__petexperience"]="CGUnitData__petExperience",
	["cgunitdata__demoncreator"]="CGUnitData__demonCreator"
}
GetOffset = function(offset)
	return wmbapi.GetObjectDescriptorsTable()[Offsets[string.lower(offset)]]
end


-- Missing API
StartFalling = nil
InitializeNavigation = nil
DestroyNavigation = nil
GetMeshPointInfo = nil
Teleport = nil
TeleportDirection = nil
AddTeleportCallbacks = nil
ObjectIsCollidable = nil
ObjectBoundingBox = nil
GameObjectFlags = nil
GetServerPosition = nil
ObjectIsFacingPosition = nil
ObjectAnimation = nil
GetActiveMover = nil
UnitIsStanding = nil
SetMovementFlags = nil
SendMovementUpdate = nil
ObjectDisplayID = nil
GetGameObjectType = nil
UnitSetDisplayID = nil
SetMountDisplayID = nil
SetVisibleItem = nil
SetVisibleEnchant = nil
UnitUpdateModel = nil
GetLastClickInfo = nil
WorldPreload = nil
IsInFront = nil
GetAuctionTimers = nil
IsHackEnabled = nil
SetHackEnabled = nil
LoadScript = nil
GetScriptName = nil
RemoveLuaString = nil
RegisterLuaFunction = nil
AddPacketCallback = nil
RemovePacketCallback = nil
AddTimerCallback = nil
GetHardwareId = nil
GetSessionVariable = nil
SetSessionVariable = nil
SaveSessionConfig = nil
IsForeground = nil
GetAsyncKeyState = nil
GetDescriptor = nil
CreateTimer = nil
StopTimer = nil
SendKey = nil
MoveMouse = nil
SendClick = nil
GetModuleAddress = nil
GetWoWProcess = nil
PatchAddress = nil
GetClockTime = nil
SendPacket = nil
GetByteValue = nil
UnloadEWT = nil
RsaGetPubKey = nil
RsaEncrypt = nil
HashString = nil


--Modified API
request = SendHttpRequest(info)
-- The request info.
info = {
  -- string: The request URL.
  Url = "https://www.microsoft.com/",
  -- string: The request method, can be "GET", "POST", "PUT" or "DELETE".
  Method = "POST",
  -- string: The additional request headers.
  Headers = "Content-Type: application/json\r\nX-Custom: test",
  -- string: The request body, only used Method is "POST" or "PUT".
  Body = "{\"test\": 123}",
  -- string: The pinned HTTPs server certificate as a protection for packet sniffing. If provided, the server certificate must match it or the HTTP request would fail with status "INVALID_CERTIFICATE".
  Certificate = "PINNED CERTIFICATE"
}
-- Returns the HTTP request ID if sent successfully, for querying HTTP response later.
request = "abc123"

connection = ConnectWebsocket(info)
--Connects to a remote websocket server asynchronously. The API will return immediately after the connection is initiated.
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

value = ReadMemory(module, offset, type)
--Reads a value at a specific memory offset/rva in a specific memory module.
-- module (string): The name of the memory module. nil for "Wow.exe" aka the main module.
-- offset (number): The offset/rva in the memory module to read.
-- type (number): The type of the value. Check GetValueTypesTable().
-- value (number): The result value. nil if the memory address is not found.

offset = GetMemoryOffset(module, address)
--Gets the offset of a memory address in a specific module.
-- module (string): The name of the memory module. nil for "Wow.exe" aka the main module.
-- address (number): The absolute memory address.
-- offset (number): The result offset. nil if the memory address is not found.


--New API
status[, response] = ReceiveHttpResponse(request)
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

path = GetAppStorageDirectory()
--Gets the base directory path of app storage.

isOrNot = FileExists(path)
--Checks if a file exists.

isOrNot = DirectoryExists(path)
--Checks if a directory exists.

value = SetSystemVar(name, value)
--Sets a system variable.
--The standard Lua environment gets reset after screen switch including /reload. All Lua variables get lost because of this. 
--In this way, we provide "System Variables" that allow you to persist information across different screens in the current game session. This is similar as the game "Console Variable", consisting of a name-value pair.

value = GetSystemVar(name)
--Gets the value of the system variable previously set by SetSystemVar. nil if it does not exist.

centers = GetAllSpanningCircles(radius, minWeight, points)
--Gets all spanning circles of a specific radius over certain weighted points.

success = PlaySoundFile(path)
--Plays a specific sound WAV/MP3 file once.

SetCustomScript(name, script)
--Add a custom script (indexed by name) that gets loaded side by side with the engine modules (Primary and Secondary). Notice that such script also gets loaded in GLUE screen.

ResetAfk()
--Resets the timer for AFK.

count = GetMissileCount()
--Gets the count of the flying missiles.

spellId, spellVisualId, x, y, z, sourceObject, sourceX, sourceY, sourceZ, targetObject, targetX, targetY, targetZ = GetMissileWithIndex(index)
--Gets the info of a specific missile.

success = LoadMap(mapId)
--Loads a navigation map.

success = UnloadMap(mapId)
--Unloads a navigation map.

isOrNot = IsMapLoaded(mapId)
--Checks if a navigation map is loaded.

scale = ObjectScale(object)
--Gets the scale of an object.

isOrNot = UnitIsMounted(unit)
--Gets whether a unit is mounted.

fields = GetObjectFieldsTable()
--Gets the table that contains all object field offsets.

descriptors = GetObjectDescriptorsTable()
--Gets the table that contains all object descriptor offsets.

flags = ObjectTypeFlags(object)
--Gets the type flags of an object.

count = GetNpcCount([center | x, y, z][, range][, option])
--Gets the count of specific NPCs.

npc = GetNpcWithIndex(index)
--Gets a specific NPC by its index.

count = GetPlayerCount([center | x, y, z][, range][, option])
--Gets the count of specific players.

player = GetPlayerWithIndex(index)
--Gets a specific player by its index.

count = GetGameObjectCount([center | x, y, z][, range][, option])
--Gets the count of specific game objects.

gameObject = GetGameObjectWithIndex(index)
--Gets a specific game object by its index.

count = GetDynamicObjectCount([center | x, y, z][, range][, option])
--Gets the count of specific dynamic objects.

dynamicObject = GetDynamicObjectWithIndex(index)
--Gets a specific dynamic object by its index.

count = GetAreaTriggerCount([center | x, y, z][, range][, option])
--Gets the count of specific area triggers.

areaTrigger = GetAreaTriggerWithIndex(index)
--Gets a specific area trigger by its index.

SetCameraDistanceMax([distance])
--Sets the current camera distance maximum. If nil, restore original setting.

success = SetCVarEx(name, value)
--Sets a CVar without system limitation.

SetNameplateDistanceMax([distance])
--Sets the current nameplate visible distance maximum. If nil, restore original setting.

EnableFlyingMode(enabled)
--Enable/Disable flying mode (slow mode falls) of the character. (DO NOT enable flying while falling or you would get disconnected)

isFlying = IsFlyingModeEnabled()
--Gets whether flying mode is enabled for the character.

SetNoClipModes(modes)
--Sets the current no-clip mode flags: 0: none 1: building 2: static object 4: dynamic object

modes = GetNoClipModes()
--Gets the current no-clip mode flags

encodings = GetStringEncodingsTable()
--Gets the table of supported string encodings.
encodings = {
  Base64 = 1,
  Hex = 2
}

account = GetCurrentAccount()
--Gets the name of the current WoW account. (same as the WTF subfolder)
