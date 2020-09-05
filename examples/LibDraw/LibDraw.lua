if not MBLibDraw then
	MBLibDraw = {
	line = {r = 0, g = 1, b = 0, a = 1, w = 1},
	callbacks = {},
	canvas = CreateFrame("Frame", WorldFrame),
	lines = {},
	lines_used = {}
	}
	MBLibDraw.canvas:SetAllPoints(WorldFrame)
	local WorldToScreen_Original = WorldToScreen
end
local function WorldToScreen(wX, wY, wZ)
	local sX, sY = WorldToScreen_Original(wX, wY, wZ)
	local a = 1365;
	local b = 768;
	if sX and sY then
		return sX*a, -(WorldFrame:GetTop() - sY*b)
	elseif sX then
		return sX*a, sY;
	elseif sY then
		return sX, sY*b;
	else
		return sX, sY;
	end
end
function Draw2DLine(sx, sy, ex, ey, width)
	if not ey then
		width = ex
		sx, sy = WorldToScreen(ObjectPosition(sx))
		ex, ey = WorldToScreen(ObjectPosition(sy))
	end
	local L = tremove(MBLibDraw.lines) or nil
	if not L then
		L = CreateFrame("Frame", MBLibDraw.canvas)
		L.line = L:CreateLine()
		L.line:SetDrawLayer("BACKGROUND")
	end
	tinsert(MBLibDraw.lines_used, L)
	L:ClearAllPoints()
	if (sx > ex and sy > ey) or (sx < ex and sy < ey) then
		L:SetPoint("TOPRIGHT", MBLibDraw.canvas, "TOPLEFT", sx, sy)
		L:SetPoint("BOTTOMLEFT", MBLibDraw.canvas, "TOPLEFT", ex, ey)
		L.line:SetStartPoint('TOPRIGHT')
		L.line:SetEndPoint('BOTTOMLEFT')
	elseif sx < ex and sy > ey then
		L:SetPoint("TOPLEFT", MBLibDraw.canvas, "TOPLEFT", sx, sy)
		L:SetPoint("BOTTOMRIGHT", MBLibDraw.canvas, "TOPLEFT", ex, ey)
		L.line:SetStartPoint('TOPLEFT')
		L.line:SetEndPoint('BOTTOMRIGHT')
	elseif sx > ex and sy < ey then
		L:SetPoint("TOPRIGHT", MBLibDraw.canvas, "TOPLEFT", sx, sy)
		L:SetPoint("BOTTOMLEFT", MBLibDraw.canvas, "TOPLEFT", ex, ey)
		L.line:SetStartPoint('TOPLEFT')
		L.line:SetEndPoint('BOTTOMRIGHT')
	else
		L:SetPoint("TOPLEFT", MBLibDraw.canvas, "TOPLEFT", sx, sy)
		L:SetPoint("BOTTOMLEFT", MBLibDraw.canvas, "TOPLEFT", sx, ey)
		L.line:SetStartPoint('TOPLEFT')
		L.line:SetEndPoint('BOTTOMLEFT')
	end
	L.line:SetThickness(width or MBLibDraw.line.w)
	L.line:SetColorTexture(MBLibDraw.line.r, MBLibDraw.line.g, MBLibDraw.line.b, MBLibDraw.line.a)
	L:Show()
end
function Draw2DText(x,y,text,font)
	if x and y then
		local F = tremove(MBLibDraw.fontstrings) or MBLibDraw.canvas:CreateFontString(nil, "BACKGROUND")
		if font then
			F:SetFontObject(font)
		end
		F:SetText(text)
		F:SetTextColor(MBLibDraw.line.r, MBLibDraw.line.g, MBLibDraw.line.b, MBLibDraw.line.a)
		if p then
			local width = F:GetStringWidth() - 4
			local offsetX = width*0.5
			local offsetY = F:GetStringHeight() + 3.5
			local pwidth = width*p*0.01
			FHAugment.drawLine(x-offsetX, y-offsetY, (x+offsetX), y-offsetY, 4, r, g, b, 0.25)
			FHAugment.drawLine(x-offsetX, y-offsetY, (x+offsetX)-(width-pwidth), y-offsetY, 4, r, g, b, 1)
		end
		F:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x-(F:GetStringWidth()*0.5), y)
		F:Show()
		tinsert(MBLibDraw.fontstrings_used, F)
	end
end
function SetDrawColor(r, g, b, a) 
	MBLibDraw.line.r = r * 0.00390625	
	MBLibDraw.line.g = g * 0.00390625	
	MBLibDraw.line.b = b * 0.00390625
	if a then
		MBLibDraw.line.a = a * 0.01
	else
		MBLibDraw.line.a = 1
	end
	MBLibDraw.line.w = 5
end
local function Sync(callback)
	tinsert(MBLibDraw.callbacks, callback)
end
local function clearCanvas()
	for i = #MBLibDraw.lines_used, 1, -1 do
		MBLibDraw.lines_used[i]:Hide()
		tinsert(MBLibDraw.lines, tremove(MBLibDraw.lines_used))
	end
	for i = #MBLibDraw.fontstrings_used, 1, -1 do
		MBLibDraw.fontstrings_used[i]:Hide()
		tinsert(MBLibDraw.fontstrings, tremove(MBLibDraw.fontstrings_used))
	end
end
local function OnDrawUpdate()
	if MBLibDraw and IsPlayerInWorld() then
		clearCanvas()
		for _, callback in ipairs(MBLibDraw.callbacks) do
			callback()
		end
	end
end
local function Enable(interval)
	return C_Timer.NewTicker(interval, OnDrawUpdate)
end
