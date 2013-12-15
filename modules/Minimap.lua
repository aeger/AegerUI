-------------------------------------------------------------------------------
--  aegerUI 5.4.9 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local aegerUI = ...

	local LibStub = _G.LibStub
	local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
	local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")
    	
--  Constants  ----------------------------------------------------------------
	local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]    
	local FONT = "Fonts\\FRIZQT__.ttf"
	local CalendarDisplay
		
--  Event logic  --------------------------------------------------------------
	local EventFrame = CreateFrame('Frame')

	EventFrame:RegisterEvent('PLAYER_LOGIN')
	EventFrame:RegisterEvent('CALENDAR_UPDATE_PENDING_INVITES')
	EventFrame:RegisterEvent('CALENDAR_ACTION_PENDING')
	
	EventFrame:SetScript('OnEvent',function(self, event_name, ...)
            local func = self[event_name]
            if func then
                    func(self, ...)  -- I don't think you need the event_name -- you already know what it is -- it's the name of the function!
            else
                    -- If you don't have a function EventFrame:EVENT_NAME() then it errors to
                    -- let you know you forgot to define it (see below, "events").
                    error(('could not find function for `%s`: forgot to define?'):format(event_name))
            end
    end)

--  Events  ---------------------------------------------------------------------
    function EventFrame:PLAYER_LOGIN()
		if not aegerUI.db.global.MiniMapEnabled then return end
			aegerUI:InitializeMiniMap()
	end

	function EventFrame:CALENDAR_UPDATE_PENDING_INVITES()
		aegerUI:CalDisplay()
    end	
	
	function EventFrame:CALENDAR_ACTION_PENDING()
		aegerUI:CalDisplay()
    end	

function aegerUI:MiniMapDisplay()
	Minimap:ClearAllPoints()
	Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -18, -18)
	Minimap:SetSize(187, 187)
	Minimap:SetMaskTexture('Interface\\ChatFrame\\ChatFrameBackground')
	Minimap:SetFrameStrata("LOW")
	
	local backdrop = {
		bgFile = "Interface\\AddOns\\aegerUI\\Media\\textures\\solid.tga",
		edgeFile = "Interface\\AddOns\\aegerUI\\media\\textures\\Skinner.tga",
		edgeSize = 16,
		insets = {
			left = 2,
			right = 2,
			top = 2,
			bottom = 2,
		}
	}
end

function aegerUI:HideBlizzardMM()
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
end	

function CalendarDisplay()
	aegerUIcal = CreateFrame("Button", nil, Minimap)
	aegerUIcal:SetPoint("BOTTOM", Minimap, "TOP", 0, 0)
	aegerUIcal:SetSize(100, 20)

	aegerUIcalcalText = aegerUIcal:CreateFontString(nil, "OVERLAY")
	aegerUIcalcalText:SetPoint("CENTER", aegerUIcal, "CENTER", 0, 0)
	aegerUIcalcalText:SetFont("Fonts\\FRIZQT__.ttf", 11, "THINOUTLINE")
	aegerUIcalcalText:SetText("New Event!")
	aegerUIcalcalText:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	
	aegerUIcal:SetScript("OnClick", function()
		if (not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
		Calendar_Toggle()
	end)
end

function aegerUI:MMClockDisplay()
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
end

function aegerUI:MMRaidDificulty()
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
end

function aegerUI:MMTracking()
	MiniMapTrackingBackground:Hide()
	MiniMapTracking:Show()
	MiniMapTracking:SetAlpha(1)
	MiniMapTrackingButton:SetAlpha(0)
	MiniMapTracking:ClearAllPoints()
	MiniMapTracking:SetPoint("TOPLEFT", Minimap, -5, 5)
	MiniMapTracking:SetScale(0.8)
end

function aegerUI:MinimapMailIcon()
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 4, 4)
	MiniMapMailFrame:SetFrameStrata("LOW")
	MiniMapMailFrame:SetAlpha(0.7)
	MiniMapMailIcon:SetTexture("Interface\\Addons\\aegerUI\\Media\\textures\\mail.tga")
	MiniMapMailBorder:Hide()
end

function aegerUI:MiniMapQueueIcons()
	QueueStatusMinimapButton:SetParent(Minimap)
	QueueStatusMinimapButton:ClearAllPoints()
	QueueStatusMinimapButton:SetPoint("BOTTOMLEFT", -4, -4)
	QueueStatusMinimapButtonBorder:Hide()

	local function LFGedit()
		MiniMapLFGFrame:ClearAllPoints()
		MiniMapLFGFrame:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -4, -4)
		MiniMapLFGFrameBorder:Hide()
	end
end

function aegerUI:MiniMapChanges()
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(self, minimap)
		if minimap > 0 then
			MinimapZoomIn:Click()
		elseif minimap < 0 then
			MinimapZoomOut:Click()
		end
	end)

	local backdrop1 = {
		bgFile = "Interface\\AddOns\\aegerUI\\Media\\textures\\MFrame.tga",
		edgeFile = false,
	}

	local border = CreateFrame("frame", nil, Minimap)
	border:SetPoint("CENTER", 0, 0)
	border:SetSize(206, 206)
	border:SetFrameLevel(1)
	border:SetBackdrop(backdrop1)
	--border:SetBackdropColor(1, 1, 1, 1)
end

function aegerUI:MiniMapRightClickMenu()
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
	
	local menuList2 = {
		{
			text = "Calendar",
			func = function()
				if (not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
				Calendar_Toggle()
			end
		},
		{ text = "Group Calendar", func = function() GroupCalendar.UI.Window:Show() end },
		{ text = "Customer Support", func = function() ToggleHelpFrame() end },
		{ text = "Close", func = function() menuFrame:Hide() end },
	}
	
	Minimap:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" then
		if not IsAddOnLoaded("GroupCalendar5") then
			EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)
		elseif IsAddOnLoaded("GroupCalendar5") then
			EasyMenu(menuList2, menuFrame, "cursor", 0, 0, "MENU", 2)
		end
		else
			Minimap_OnClick(self)
		end
	end)
	
end

function aegerUI:CalDisplay()
	if not aegerUI.db.global.MiniMapEnabled then return end
	if not aegerUIcal then
		CalendarDisplay()
	end
	if CalendarGetNumPendingInvites() > 0 then
			aegerUIcal:Show()
		else
			aegerUIcal:Hide()
		end
end

function aegerUI:InitializeMiniMap()
	aegerUI:MiniMapDisplay()
	aegerUI:HideBlizzardMM()
	aegerUI:MMClockDisplay()
	aegerUI:MMRaidDificulty()
	aegerUI:MMTracking()
	aegerUI:MinimapMailIcon()
	aegerUI:MiniMapQueueIcons()
	aegerUI:MiniMapChanges()
	aegerUI:MiniMapRightClickMenu()
end