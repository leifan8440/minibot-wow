if not MBLibDraw then
	MBLibDraw = {
	line = {r = 0, g = 1, b = 0, a = 1, w = 1},
	canvas = CreateFrame("Frame", WorldFrame),
	lines = {},
	fontstrings = {},
	}
	MBLibDraw.canvas:SetAllPoints(WorldFrame)
end
local function MBWorldToScreen(wX, wY, wZ)
	local _, sX, sY = wmbapi.WorldToScreen(wX, wY, wZ)
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
		ex, ey = MBWorldToScreen(wmbapi.ObjectPosition(sy))
		sx, sy = MBWorldToScreen(wmbapi.ObjectPosition(sx))
	end
	local L = tremove(MBLibDraw.lines) or nil
	if not L then
		L = CreateFrame("Frame", MBLibDraw.canvas)
		L.line = L:CreateLine()
		L.line:SetDrawLayer("BACKGROUND")
	end
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
	local F = tremove(MBLibDraw.fontstrings) or MBLibDraw.canvas:CreateFontString(nil, "BACKGROUND")
	F:SetFont("Fonts\\FRIZQT__.TTF",font or 12)
	F:SetText(text)
	F:SetTextColor(MBLibDraw.line.r, MBLibDraw.line.g, MBLibDraw.line.b, MBLibDraw.line.a)
	F:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x-(F:GetStringWidth()*0.5), y)
	F:Show()
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
