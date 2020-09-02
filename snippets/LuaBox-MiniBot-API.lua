-- Converted API
if not wmbapi then -- Use wmbapi variable to detect whether MiniBot's API is fully loaded
	return
end
__LB__ = wmbapi
lb = wmbapi
CancelPendingSpells = CancelPendingSpell 
ClickPosition = ClickPosition
CreateDirectory = CreateDirectory
DirectoryExists = DirectoryExists
FileExists = FileExists
GetBaseDirectory = GetAppDirectory
GetCameraPosition = GetCameraPosition
GetDirectories = GetDirectoryFolders
GetFiles = GetDirectoryFiles
GetGameDirectory = GetWoWDirectory
GetKeyState = GetKeyState
GetMapId = GetCurrentMapInfo
GetObjects = function()
	local objects = {}
	for i=1,wmbapi.GetObjectCount() do
		tinsert(objects,wmbapi.GetObjectWithIndex(i))
	end
	return objects
end
GetPlayerCorpsePosition = GetCorpsePosition
GetWindowSize = function()
	return GetScreenWidth(), GetScreenHeight()
end
NavMgr_GetPath = FindPath
IsAoEPending = IsAoEPending
MoveTo = MoveTo
ObjectCreator = UnitCreator
ObjectDynamicFlags = ObjectDynamicFlags
ObjectExists = ObjectExists
ObjectFacing = ObjectFacing
ObjectId = function(...) return ... and tonumber(string.match(UnitGUID(...), "-(%d+)-%x+$"), 10) end
ObjectInteract = InteractUnit
ObjectPitch = UnitPitch
ObjectPointer = function(...)
	if not UnitIsVisible(...) then
		return
	end
	local pointer = nil
	for i=1,wmbapi.GetObjectCount() do
		pointer = wmbapi.GetObjectWithIndex(i)
		if UnitIsVisible(pointer) and UnitIsUnit(pointer,...) then
			return pointer
		end	
	end
end
ObjectPosition = ObjectPosition
Raycast = TraceLine
ReadFile = ReadFile
SetPlayerAngles = FaceDirection
UnitBoundingRadius = UnitBoundingRadius
UnitCastingInfo = function(...) return select(7,GetSpellInfo(UnitCastingInfo(...))), wmbapi.UnitCastingTarget end
UnitChannelInfo = function(...) return select(7,GetSpellInfo(UnitChannelInfo(...))), wmbapi.UnitCastingTarget end
UnitCombatReach = UnitCombatReach
UnitFlags = UnitFlags
UnitIsLootable = UnitIsLootable
UnitMovementFlags = GetUnitMovementFlagsTable
UnitTarget = UnitTarget
UpdateAFK = ResetAfk
WriteFile = WriteFile


-- Missing API
UpdatePlayerMovement = nil
Unlock = nil
UnitTagHandler = nil
UnitNpcFlags = nil
UnitHasMovementFlag = nil
UnitHasNpcFlag = nil
UnitHasFlag = nil
UnitHasFlag2 = nil
UnitFlags2 = nil
UnitAuras = nil
SetDevMode = nil
SetCameraAngles = nil
RunString = nil
PlayerSpecializationId = nil
ObjectRawFacing = nil
ObjectLocked = nil
ObjectHasDynamicFlag = nil
GameObjectHasLockType = nil
GameObjectLockTypes = nil
GameObjectType = nil
GetCameraAngles = nil
GetClientType = nil
GetClockTime = nil
GetDevMode = nil
GetGameAccountName = nil
GetDistance3D = nil
GetLastWorldClickPosition = nil
Navigator.GetDestination = nil
Navigator.MoveTo = nil
Navigator.Stop = nil
NavMgr_GetClosestPointOnMesh = nil
NavMgr_GetClosestPointInCubes = nil
NavMgr_GetMeshState = nil
NavMgr_GetNavConnection = nil
NavMgr_GetPathIndex = nil
NavMgr_GetRandomPoint = nil
NavMgr_GetRandomPointInCircle = nil
NavMgr_GetThresholds = nil
NavMgr_IsPositionOnMesh = nil
NavMgr_IsReachable = nil
NavMgr_IsUIVisible = nil
NavMgr_MoveTo = nil
NavMgr_SetPathIndex = nil
NavMgr_Stop = nil
NavMgr_ToggleUI = nil


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

object = GetObjectWithGUID(guid)
--Gets the object by its GUID.

distance = GetDistanceBetweenObjects(object1, object2)
--Gets the distance between two objects in 3D.

facing, pitch = GetAnglesBetweenObjects(object1, object2)
--Gets the angles (facing & pitch) between two objects.

isOrNot = ObjectIsFacing(object1, object2[, tolerance = PI/2])
--Checks if an object is facing another object.

isOrNot = ObjectIsBehind(object1, object2)
--Checks if an object is behind another object.

transport = UnitTransport(unit)
--Gets the transport object of a unit.

path = GetAppStorageDirectory()
--Gets the base directory path of app storage.

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

fields = GetObjectFieldsTable()
--Gets the table that contains all object field offsets.

value = ObjectField(object, offset, type)
--Gets a field value of an object.

descriptors = GetObjectDescriptorsTable()
--Gets the table that contains all object descriptor offsets.

value = ObjectDescriptor(object, offset, type)
--Gets a descriptor value of an object.

flags = ObjectTypeFlags(object)
--Gets the type flags of an object.

isOrNot = ObjectIsType(object, type)
--Checks if an object is of specific type.

value = UnitMovementField(unit, offset, type)
--Gets the field value of a unit's movement struct.

isOrNot = UnitIsMounted(unit)
--Gets whether a unit is mounted.

isOrNot = UnitIsSkinnable(unit)
--Gets whether a unit is skinnable.

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

SetClimbAngle([angle])
--Sets the engine allowed climb angle, in radian. If nil, restore original setting.

isOnScreen, x, y = WorldToScreen(object | x, y, z)
--Projects a world position to the screen NDC position.

x, y, z[, object] = ScreenToWorld(x, y)
--Projects a screen NDC position to a world object or a terrain position.

success = SetCVarEx(name, value)
--Sets a CVar without system limitation.

StopFalling()
--Stops the current falling of the character right now.

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

--ObjectTypes
wmbapi.GetObjectTypeFlagsTable().Object
wmbapi.GetObjectTypeFlagsTable().Item
wmbapi.GetObjectTypeFlagsTable().Container
wmbapi.GetObjectTypeFlagsTable().AzeriteEmpoweredItem
wmbapi.GetObjectTypeFlagsTable().AzeriteItem
wmbapi.GetObjectTypeFlagsTable().Unit
wmbapi.GetObjectTypeFlagsTable().Player
wmbapi.GetObjectTypeFlagsTable().ActivePlayer
wmbapi.GetObjectTypeFlagsTable().GameObject
wmbapi.GetObjectTypeFlagsTable().DynamicObject
wmbapi.GetObjectTypeFlagsTable().Corpse
wmbapi.GetObjectTypeFlagsTable().AreaTrigger
wmbapi.GetObjectTypeFlagsTable().SceneObject
wmbapi.GetObjectTypeFlagsTable().Conversation

--MovementFlags
wmbapi.GetUnitMovementFlagsTable().Forward
wmbapi.GetUnitMovementFlagsTable().Backward
wmbapi.GetUnitMovementFlagsTable().StrafeLeft
wmbapi.GetUnitMovementFlagsTable().StrafeRight
wmbapi.GetUnitMovementFlagsTable().TurnLeft
wmbapi.GetUnitMovementFlagsTable().TurnRight
wmbapi.GetUnitMovementFlagsTable().PitchUp
wmbapi.GetUnitMovementFlagsTable().PitchDown
wmbapi.GetUnitMovementFlagsTable().Walking
wmbapi.GetUnitMovementFlagsTable().Immobilized
wmbapi.GetUnitMovementFlagsTable().Falling
wmbapi.GetUnitMovementFlagsTable().FallingFar
wmbapi.GetUnitMovementFlagsTable().Swimming
wmbapi.GetUnitMovementFlagsTable().Ascending
wmbapi.GetUnitMovementFlagsTable().Descending
wmbapi.GetUnitMovementFlagsTable().CanFly
wmbapi.GetUnitMovementFlagsTable().Flying

--Types
wmbapi.GetValueTypesTable().Bool
wmbapi.GetValueTypesTable().Char
wmbapi.GetValueTypesTable().Byte
wmbapi.GetValueTypesTable().Short
wmbapi.GetValueTypesTable().UShort
wmbapi.GetValueTypesTable().Int
wmbapi.GetValueTypesTable().UInt
wmbapi.GetValueTypesTable().Long
wmbapi.GetValueTypesTable().ULong
wmbapi.GetValueTypesTable().Float
wmbapi.GetValueTypesTable().Double
wmbapi.GetValueTypesTable().String
wmbapi.GetValueTypesTable().GUID

--HitFlags
M2Collision = 0x1
M2Render = 0x2
WMOCollision = 0x10
WMORender = 0x20
Terrain = 0x100
WaterWalkableLiquid = 0x10000
Liquid = 0x20000
EntityCollision = 0x100000
