local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
local font = "Fonts\\FRIZQT__.ttf"
local sb = "Interface\\AddOns\\aegerUI\\media\\textures\\Skinner.tga"
local bg = "Interface\\AddOns\\aegerUI\\Media\\textures\\solid.tga"
local mframe = "Interface\\AddOns\\aegerUI\\Media\\textures\\MFrame.tga"

Minimap:ClearAllPoints()
Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -18, -18)
Minimap:SetSize(187, 187)
Minimap:SetMaskTexture('Interface\\ChatFrame\\ChatFrameBackground')
Minimap:SetFrameStrata("LOW")

local backdrop = {
	bgFile = bg,
	edgeFile = sb,
	edgeSize = 16,
	insets = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	}
}

-- Calendar	Events
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
local cal = CreateFrame("Button", nil, Minimap)
cal:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -18)
cal:SetSize(100, 20)

local calText = cal:CreateFontString(nil, "OVERLAY")
calText:SetPoint("CENTER", cal, "CENTER", 0, 0)
calText:SetFont("Fonts\\FRIZQT__.ttf", 11, "THINOUTLINE")
calText:SetText("New Event!")
calText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

cal:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")
cal:RegisterEvent("CALENDAR_ACTION_PENDING")

cal:SetScript("OnEvent", function()
	if CalendarGetNumPendingInvites() > 0 then
		cal:Show()
	else
		cal:Hide()
	end
end)

cal:SetScript("OnClick", function()
	if (not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
	Calendar_Toggle()
end)

-- Hide Blizzard Minimap Elements
---------------------
MiniMapInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:ClearAllPoints()
MinimapBorder:Hide()
MinimapBorderTop:Hide()
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapVoiceChatFrame:Hide()
MiniMapInstanceDifficulty:Hide()
GuildInstanceDifficulty:Hide()
MinimapZoneTextButton:Hide()
GameTimeFrame:Hide()
MiniMapWorldMapButton:Hide()
MiniMapWorldMapButton:Hide()
MinimapNorthTag:SetTexture(nil)
MinimapCluster:EnableMouse(false)

-- Clock
if not IsAddOnLoaded("Blizzard_TimeManager") then
	LoadAddOn("Blizzard_TimeManager")
end
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
TimeManagerClockButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 10, -7)
clockFrame:Hide()
clockTime:Show()
clockTime:SetFont("Fonts\\FRIZQT__.ttf", 11, "THINOUTLINE")
clockTime:SetJustifyH("RIGHT")
clockTime:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

-- Raid Difficulty
---------------------
local _, class = UnitClass("player")
local raidc = RAID_CLASS_COLORS[class]
local id = CreateFrame("Frame", nil, UIParent)
id:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT")
id:RegisterEvent("PLAYER_ENTERING_WORLD")
id:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")

local idtext = id:CreateFontString(nil, "OVERLAY")
idtext:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -2, -2)
idtext:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")
idtext:SetTextColor(raidc.r, raidc.g, raidc.b)

local function settxt()
	local inInstance, instancetype = IsInInstance()
	local _, _, difficultyIndex, _, maxPlayers, playerDifficulty, isDynamic = GetInstanceInfo()
	if inInstance then
		if difficultyIndex == 1 then
			idtext:SetText("5")
		elseif difficultyIndex == 2 then
			idtext:SetText("5 H")
		elseif difficultyIndex == 3 then
			idtext:SetText("10")
		elseif difficultyIndex == 4 then
			idtext:SetText("25")
		elseif difficultyIndex == 5 then
			idtext:SetText("10 H")
		elseif difficultyIndex == 6 then
			idtext:SetText("25 H")
		elseif difficultyIndex == 7 then
			idtext:SetText("RF")
		elseif difficultyIndex == 8 then
			idtext:SetText("CM")
		elseif difficultyIndex == 9 then
			idtext:SetText("40")
		else
			idtext:SetText("")
		end
	else
		idtext:SetText("")
	end
end

id:SetScript("OnEvent", settxt)

-- Tracking
---------------------
MiniMapTrackingBackground:Hide()
MiniMapTracking:Show()
MiniMapTracking:SetAlpha(1)
MiniMapTrackingButton:SetAlpha(0)
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPLEFT", Minimap, -5, 5)
MiniMapTracking:SetScale(0.8)

-- Mail
---------------------
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 4, 4)
MiniMapMailFrame:SetFrameStrata("LOW")
MiniMapMailFrame:SetAlpha(0.7)
MiniMapMailIcon:SetTexture("Interface\\Addons\\aegerUI\\Media\\textures\\mail.tga")
MiniMapMailBorder:Hide()

-- Queue Icons
---------------------
QueueStatusMinimapButton:SetParent(Minimap)
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetPoint("BOTTOMLEFT", -4, -4)
QueueStatusMinimapButtonBorder:Hide()

local function LFGedit()
	MiniMapLFGFrame:ClearAllPoints()
	MiniMapLFGFrame:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -4, -4)
	MiniMapLFGFrameBorder:Hide()
end

-- Minimap Changes
---------------------
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, minimap)
	if minimap > 0 then
		MinimapZoomIn:Click()
	elseif minimap < 0 then
		MinimapZoomOut:Click()
	end
end)
local backdrop1 = {
	bgFile = mframe,
	edgeFile = false,
}

local border = CreateFrame("frame", nil, Minimap)
border:SetPoint("CENTER", 0, 0)
border:SetSize(206, 206)
border:SetFrameLevel(1)
border:SetBackdrop(backdrop1)
--border:SetBackdropColor(1, 1, 1, 1)

-- Right Click Menu
local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local menuList = {
	{
		text = "Calendar",
		func = function()
			if (not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
			Calendar_Toggle()
		end
	},
	{ text = "Customer Support", func = function() ToggleHelpFrame() end },
	{ text = "Close", func = function() menuFrame:Hide() end },
}
Minimap:SetScript("OnMouseUp", function(self, btn)
	if btn == "RightButton" then
		EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)

	else
		Minimap_OnClick(self)
	end
end)

function aegerUI_LargeMiniMap()
	MinimapCluster:SetScale(1.5);
end

function aegerUI_NormalMiniMap()
	MinimapCluster:SetScale(1);
end

SlashCmdList.AEGERUILARGEMINIMAP = function()
            aegerUI_LargeMiniMap()
    end
    SLASH_AEGERUILARGEMINIMAP1 = '/auilarge'
	
	SlashCmdList.AEGERUINORMALMINIMAP = function()
            aegerUI_NormalMiniMap()
    end
    SLASH_AEGERUINORMALMINIMAP1 = '/auismall'
