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
Offsets = {
	["cgunitdata__animtier"] = "CGUnitData__animTier",
	["cgunitdata__boundingradius"] = "CGUnitData__boundingRadius",
	["cgunitdata__combatreach"] = "CGUnitData__combatReach",
	["cgunitdata__flags"] = "CGUnitData__flags",
	["cgunitdata__target"] = "CGUnitData__target",
	["cgplayerdata__currentspecid"] = "CGPlayerData__currentSpecID",
	["cgunitdata__createdby"] = "CGUnitData__createdBy",
	["cgareatriggerdata__m_spelid"] = "CGAreaTriggerData__m_spellID",
	["cgobjectdata__m_guid"] = "CGObjectData__m_guid",
	["cggameobjectData__m_createdby"] = "CGGameObjectData__m_createdBy",
	["cgunitdata__flags3"] = "CGUnitData__flags3",
	["cgunitdata__flags2"] = "CGUnitData__flags2",
	["cgunitdata__mountdisplayid"] = "CGUnitData__mountDisplayID",
	["cgunitdata__summonedby"] = "CGUnitData__summonedBy",
	["cgunitdata__demoncreator"] = "CGUnitData__demonCreator",
	["cgobjectdata__m_scale"] = "CGObjectData__m_scale",
	["cgobjectdata__m_dynamicflags"] = "CGObjectData__m_dynamicFlags",
	["cgareatriggerdata__m_caster"] = "CGAreaTriggerData__m_caster"
}

StopFalling = wmbapi.StopFalling
FaceDirection = wmbapi.FaceDirection
ObjectTypeFlags = wmbapi.ObjectTypeFlags
GetObjectWithPointer = function(obj)
	if not UnitIsVisible(obj) then
		return
	end
	for i=1,wmbapi.GetObjectCount() do
		local pointer = wmbapi.GetObjectWithIndex(i)
		if UnitIsVisible(pointer) and UnitIsUnit(pointer,obj) then
			return pointer
		end	
	end
end
ObjectExists = wmbapi.ObjectExists
ObjectIsVisible = UnitIsVisible
ObjectPosition = wmbapi.ObjectPosition
ObjectFacing = wmbapi.ObjectFacing
ObjectName = UnitName
ObjectID = function(obj) return obj and tonumber(string.match(UnitGUID(obj), "-(%d+)-%x+$"), 10) end
ObjectIsUnit = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Unit) end
ObjectIsPlayer = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Player) end
ObjectIsGameObject = function(obj) return obj and ObjectIsType(obj,ObjectTypes.GameObject) end
ObjectIsAreaTrigger = function(obj) return obj and ObjectIsType(obj,ObjectTypes.AreaTrigger) end
GetDistanceBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2)) end
GetDistanceBetweenObjects = wmbapi.GetDistanceBetweenObjects
GetPositionBetweenObjects = function(obj1,obj2,dist) 
	local X1,Y1,Z1 = ObjectPosition(obj1)
	local X2,Y2,Z2 = ObjectPosition(obj2)
	local AngleXY, AngleXYZ = math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
	return math.cos(AngleXY) * dist + X1, math.sin(AngleXY) * dist + Y1, math.sin(AngleXYZ) * dist + Z1
end
GetPositionFromPosition = function(X, Y, Z, dist, angle) return math.cos(angle) * dist + X, math.sin(angle) * dist + Y, math.sin(0) * dist + Z end
GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi end
GetPositionBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2, DistanceFromPosition1) local AngleXY, AngleXYZ = GetAnglesBetweenPositions(X1, Y1, Z1, X2, Y2, Z2) return GetPositionFromPosition(X1, Y1, Z1, DistanceFromPosition1, AngleXY, AngleXYZ) end
ObjectIsFacing = wmbapi.ObjectIsFacing
ObjectInteract = InteractUnit
GetObjectCount = wmbapi.GetObjectCount
GetObjectWithIndex = wmbapi.GetObjectWithIndex
GetObjectWithGUID = wmbapi.GetObjectWithGUID
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitTarget = wmbapi.UnitTarget
UnitCastID = function(unit) return select(7,GetSpellInfo(UnitCastingInfo(unit))), select(7,GetSpellInfo(UnitChannelInfo(unit))), wmbapi.UnitCastingTarget, wmbapi.UnitCastingTarget end
TraceLine = wmbapi.TraceLine
GetCameraPosition = wmbapi.GetCameraPosition
CancelPendingSpell = wmbapi.CancelPendingSpell
ClickPosition = wmbapi.ClickPosition
IsAoEPending = wmbapi.IsAoEPending
GetTargetingSpell = function()
	while true do
		local spellName,_,_,_,_,_,spellID = GetSpellInfo(i,"spell")
		if not spellName then
			break
		elseif IsCurrentSpell(i,"spell") then
			return spellID
		end
	end
end
WorldToScreen = wmbapi.WorldToScreen
ScreenToWorld = wmbapi.ScreenToWorld
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
	return GetScreenWidth(), GetScreenHeight()
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
	if IsMoving() then
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
ObjectIsBehind = wmbapi.ObjectIsBehind
ObjectDescriptor = wmbapi.ObjectDescriptor
ObjectTypeFlags = wmbapi.ObjectTypeFlags
ObjectField = wmbapi.ObjectField
GetActivePlayer = function() return "player" end
UnitIsFacing = ObjectIsFacing
UnitIsFalling = function(unit) return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Falling end
UnitMovementFlags = wmbapi.UnitMovementFlags
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitFlags = wmbapi.UnitFlags
PlayerFlags = function() wmbapi.UnitFlags("player") end
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
GetTargetingSpell = nil
WorldToScreenRaw = nil 
WorldPreload = nil
IsInFront = nil
GetMousePosition = nil
GetAuctionTimers = nil
IsHackEnabled = nil
SetHackEnabled = nil
LoadScript = nil
GetScriptName = nil
AddLuaString = nil
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
Draw2DLine = nil
SetDrawColor = nil
Draw2DText = nil


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

RunScript(name, script)
--Runs a Lua script with a name by engine.


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
