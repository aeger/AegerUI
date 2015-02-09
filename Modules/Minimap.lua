local AUI, aui = ...
--libjostle workaround for scaling issues
local offset = MinimapBorderTop:GetHeight() * 3/5
local point, relativeTo, relativePoint, xOfs, yOfs = MinimapCluster:GetPoint(1)

function aegerUI_MiniMap:OnEnable()
-- Hiding Crap
MinimapCluster:SetScale(1.2)
MinimapCluster:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs - offset)
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapWorldMapButton:Hide()
--MinimapZoneTextButton:Hide()
MinimapBorderTop:Hide()
MiniMapTracking:UnregisterAllEvents()
MiniMapTracking:Hide()
GameTimeFrame:Hide()

-- Zone text
MinimapZoneTextButton:SetParent(Minimap)
MinimapZoneTextButton:SetPoint("TOP", Minimap, 7, 18)
MinimapZoneTextButton:SetFrameStrata("LOW")
MinimapZoneText:SetFont(GameFontNormal:GetFont(), 12, 'OUTLINE')

-- Time
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
clockFrame:Hide()
clockTime:Show()
clockTime:SetFont(GameFontNormal:GetFont(), 12, 'OUTLINE')
TimeManagerClockButton:ClearAllPoints()
TimeManagerClockButton:SetPoint('CENTER', Minimap, 'BOTTOM')

GameTimeFrame:HookScript('OnEvent', function()
	if CalendarGetNumPendingInvites() > 0 then
		clockTime:SetTextColor(0, 1, 0)
	else
		clockTime:SetTextColor(MinimapZoneText:GetTextColor())
	end
end)

-- Date
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

-- GameData
StreamingIcon:ClearAllPoints()
StreamingIcon:SetParent(Minimap)
StreamingIcon:SetPoint('TOPLEFT', Minimap, 0, -4)
StreamingIcon:SetFrameStrata("LOW")

-- Garrison Report Button Placement
GarrisonLandingPageMinimapButton:ClearAllPoints()
GarrisonLandingPageMinimapButton:SetPoint("BOTTOMLEFT", Minimap, 0, 0)
GarrisonLandingPageMinimapButton:SetScale(.7)

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

-- Blip texture
--Minimap:SetBlipTexture("Interface\\AddOns\\aegerUI\\Media\\textures\\Blip-BlizzardBig.tga")

-- Mousewheel zoom
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(_, zoom)
    if zoom > 0 then
        Minimap_ZoomIn()
    else
        Minimap_ZoomOut()
    end
end)

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

local function MinimapBtn()
end