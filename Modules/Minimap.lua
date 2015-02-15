local AUI, aui = ...

function aegerUI_MiniMap:OnEnable()
local hideDurability = false
local mapScale = 1.3
local mapStyle = "spike"
local pingAnnounce = UIErrorsFrame
local questHeight = 1
local questScale = 1.1 --0.8 for the old size
local showDate = true
local PetBattleHide	= true
local hidegarrison = false
local hidetime = false
local hidezone = false

local DoNothing = function() end

local function GetPercent(value)
	value = tonumber(value) or 1
	return value <= 0.1 and 0.1 or value >= 2 and 2 or value
end

local function HideFrame(frame)
  frame.Show = DoNothing
  frame:Hide()
end

HideFrame(GameTimeFrame)
HideFrame(MiniMapVoiceChatFrame)
HideFrame(MinimapCluster)
HideFrame(MiniMapTracking)
HideFrame(MinimapZoomIn)
HideFrame(MinimapZoomOut)
HideFrame(MiniMapWorldMapButton)
HideFrame(MinimapBorderTop)
HideFrame(MinimapCompassTexture)
HideFrame(MinimapNorthTag)

Minimap:SetParent(UIParent)
Minimap:SetFrameStrata('BACKGROUND')
Minimap:SetScale(GetPercent(mapScale))
MinimapBorder:SetParent(Minimap)
Minimap:SetPoint('TOPRIGHT', UIParent, -20, -20)

VehicleSeatIndicator:ClearAllPoints()
VehicleSeatIndicator:SetPoint('TOPRIGHT', Minimap, 'BOTTOMRIGHT', -35, -26)

--[[-----------------------------------------------------------------------------
Map style
-------------------------------------------------------------------------------]]
local shape = ({
	arrow	= 'ROUND',
	gloss	= 'SQUARE',
	gold	= 'ROUND',
	tec	= 'SQUARE',
	blankr	= 'ROUND',
	ship	= 'ROUND',
	spike	= 'ROUND',
	ring	= 'ROUND',
	cpass	= 'ROUND',
	crossh	= 'ROUND',
	blanks	= 'SQUARE',
	alliancer = 'ROUND',
	alliances = 'SQUARE',
})[mapStyle]

MinimapBorder:ClearAllPoints()

if shape then
	MinimapBorder:SetTexture([[Interface\AddOns\aegerUI\Media\Minimap\]] .. mapStyle)
	MinimapBorder:SetTexCoord(0, 1, 0, 1)
	if shape == 'SQUARE' then
		MinimapBorder:SetPoint('TOPLEFT', -3, 3)
		MinimapBorder:SetPoint('BOTTOMRIGHT', 3, -3)
		Minimap:SetMaskTexture([[Interface\BUTTONS\WHITE8X8]])
	else
		MinimapBorder:SetPoint('TOPLEFT', -12, 12)
		MinimapBorder:SetPoint('BOTTOMRIGHT', 12, -12)
		Minimap:SetMaskTexture([[Textures\MinimapMask]])
	end
else
	MinimapBorder:SetTexCoord(94/256, 244/256, 32/256, 182/256)
	MinimapBorder:SetPoint('TOPLEFT', -4, 4)
	MinimapBorder:SetPoint('BOTTOMRIGHT', 5, -7)
	Minimap:SetMaskTexture([[Textures\MinimapMask]])
	MinimapCompassTexture:SetParent(Minimap)
	MinimapNorthTag:SetParent(Minimap)
	shape = 'ROUND'
end

function GetMinimapShape()
	return shape
end

--[[-----------------------------------------------------------------------------
Tweaks
-------------------------------------------------------------------------------]]
-- Zone text
if hidezone then
HideFrame(MinimapZoneTextButton)
else
MinimapZoneTextButton:SetParent(Minimap)
MinimapZoneTextButton:SetPoint("TOP", Minimap, 0, 18)
MinimapZoneTextButton:SetFrameStrata("LOW")
MinimapZoneText:SetFont(GameFontNormal:GetFont(), 12, 'OUTLINE')
end

-- Time

LoadAddOn('Blizzard_TimeManager')
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
clockFrame:Hide()
clockTime:Show()
clockTime:SetFont(GameFontNormal:GetFont(), 12, 'OUTLINE')
TimeManagerClockButton:ClearAllPoints()
TimeManagerClockButton:SetPoint('CENTER', Minimap, 'BOTTOM')

if hidetime then
HideFrame(clockTime)
else
GameTimeFrame:HookScript('OnEvent', function()
	if CalendarGetNumPendingInvites() > 0 then
		clockTime:SetTextColor(0, 1, 0)
	else
		clockTime:SetTextColor(MinimapZoneText:GetTextColor())
	end
end)
end

-- Date
if showDate then
	local text = TimeManagerClockButton:CreateFontString(nil, 'BACKGROUND')
	text:SetFont([[FONTS\FRIZQT__.ttf]], 8, 'OUTLINE')
	text:SetTextColor(MinimapZoneText:GetTextColor())
	text:SetPoint('TOP', clockTime, 'BOTTOM')
	text:SetText(date("%a %b %d"))

	local group = WorldFrame:CreateAnimationGroup()
	local timer = group:CreateAnimation('Animation')
	timer:SetScript('OnFinished', function()
		text:SetText(date("%a %b %d"))
	end)
	timer:SetDuration(30)
	group:SetLooping('REPEAT')
	group:Play()
end

-- GameData
StreamingIcon:ClearAllPoints()
StreamingIcon:SetParent(Minimap)
StreamingIcon:SetPoint('TOPLEFT', Minimap, 0, -4)
StreamingIcon:SetFrameStrata("LOW")

-- Garrison Report Button Placement
if hidegarrison then
HideFrame(GarrisonLandingPageMinimapButton)
else
GarrisonLandingPageMinimapButton:ClearAllPoints()
GarrisonLandingPageMinimapButton:SetPoint("BOTTOMLEFT", Minimap, 0, 0)
GarrisonLandingPageMinimapButton:SetScale(.7)
end

-- Challenge Mode Instance Difficulty Button Placement
MiniMapChallengeMode:ClearAllPoints()
MiniMapChallengeMode:SetPoint("TOPRIGHT", Minimap, 0, -35)
MiniMapChallengeMode:SetScale(1)

-- Instance Difficulty Button Placement
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetParent(Minimap)
MiniMapInstanceDifficulty:SetPoint('TOPRIGHT', Minimap, 0, -4)
MiniMapInstanceDifficulty:SetFrameStrata("LOW")

-- Guild Instance Difficulty Button Placement
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetParent(Minimap)
GuildInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, 0, -4)
GuildInstanceDifficulty:SetFrameStrata("LOW")

-- LFG / Battleground Button Placement
function UpdateLFG()
	MiniMapLFGFrame:ClearAllPoints()
	MiniMapLFGFrame:SetPoint('BOTTOMRIGHT', Minimap, 3, -3)
    QueueStatusMinimaputton:ClearAllPoints()
    QueueStatusMinimaputton:SetPoint('TOPRIGHT', MiniMapLFGFrame, 'TOPLEFT')
    QueueStatusMinimaputton:SetClampedToScreen(true)
end
QueueStatusMinimapButton:SetParent(Minimap)
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButtonBorder:SetAlpha(0)
QueueStatusMinimapButton:SetPoint("BOTTOMRIGHT", Minimap, 0, 0)
QueueStatusMinimapButton:SetScale(.8)
QueueStatusMinimapButton:SetFrameStrata("HIGH")

-- Mail
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint('BOTTOM', Minimap, 0, 18)
MiniMapMailFrame:SetHeight(10)
MiniMapMailBorder:Hide()
MiniMapMailFrame:SetFrameStrata("LOW")
MiniMapMailIcon:SetTexture([[Interface\AddOns\aegerUI\Media\Minimap\mail]])

-- Zoom
Minimap:SetScript('OnMouseWheel', function(self, direction)
	local zoom, maxZoom = self:GetZoom() + direction, self:GetZoomLevels()
	self:SetZoom(zoom >= maxZoom and maxZoom or zoom <= 0 and 0 or zoom)
end)
Minimap:EnableMouseWheel(true)
Minimap:UnregisterEvent('MINIMAP_UPDATE_ZOOM')

-- Ping
if type(pingAnnounce) == 'table' and type(pingAnnounce.AddMessage) == 'function' then
	Minimap:HookScript('OnEvent', function(self, event, unit)
		if event == 'MINIMAP_PING' and unit ~= 'player' then
			local _, class = UnitClass(unit)
			local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
			pingAnnounce:AddMessage(("Pinged by: |cff%02x%02x%02x%s"):format(color.r * 255, color.g * 255, color.b * 255, UnitName(unit)))
		end
	end)
end

--[[-----------------------------------------------------------------------------
Durability
-------------------------------------------------------------------------------]]
if hideDurability then
	HideFrame(DurabilityFrame)
else
	DurabilityFrame:ClearAllPoints()
	DurabilityFrame:SetPoint('TOPRIGHT', Minimap, 'BOTTOMRIGHT', 0, -26)
--	movers[#movers + 1] = CreateMoverFrame("Durability", DurabilityFrame)
end

--[[-----------------------------------------------------------------------------
Pet Battle Hide
-------------------------------------------------------------------------------]]
if PetBattleHide then
local PetBattle = CreateFrame('Frame')

local function OnEvent(self, event, ...)

    if ( event =="PET_BATTLE_OPENING_START") then
			Minimap:Hide()
		end
	if ( event =="PET_BATTLE_CLOSE") then
			Minimap:Show()
		end
end

PetBattle:SetScript('OnEvent', OnEvent)
PetBattle:RegisterEvent("PET_BATTLE_OPENING_START")
PetBattle:RegisterEvent("PET_BATTLE_CLOSE")
end

--[[-----------------------------------------------------------------------------
Finish
-------------------------------------------------------------------------------]]
Minimap:SetScript('OnMouseUp', function(self, button)
	if button == 'RightButton' then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, 'cursor')
	elseif button == 'MiddleButton' then
		ToggleCalendar()
	else
		Minimap_OnClick(self)
	end
end)
DropDownList1:SetClampedToScreen(true)


end