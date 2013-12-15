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

-- Define locals and local functions up here so they're in scope for the whole file
	local BottomBarFrame1
    local BottomBarFrame2
    local CombatColorOn
    local CombatColorOff
	local AUI_CompactRaidFrame
		
--  Event logic  ---------------------------------------------------------------
    local DisplayBars = CreateFrame('Frame')

    DisplayBars:RegisterEvent('PLAYER_LOGIN')
    DisplayBars:RegisterEvent('UNIT_ENTERED_VEHICLE')
    DisplayBars:RegisterEvent('UNIT_EXITED_VEHICLE')
    DisplayBars:RegisterEvent('PLAYER_REGEN_ENABLED')
    DisplayBars:RegisterEvent('PLAYER_REGEN_DISABLED')
	DisplayBars:RegisterEvent('PET_BATTLE_OPENING_START')
	DisplayBars:RegisterEvent('PET_BATTLE_CLOSE')
	DisplayBars:RegisterEvent('GROUP_ROSTER_UPDATE')

    DisplayBars:SetScript('OnEvent',function(self, event_name, ...)
            local func = self[event_name]
            if func then
                    func(self, ...) 
            else
                    -- If you don't have a function EventFrame:EVENT_NAME() then it errors to
                    -- let you know you forgot to define it (see below, "events").
                    error(('could not find function for `%s`: forgot to define?'):format(event_name))
            end
    end)
	
--  Events  ---------------------------------------------------------------------
    function DisplayBars:PLAYER_LOGIN()
            AUI_CompactRaidFrame()
			if aegerUI.db.profile.NumBottomBars == 1 then
		      Bbar1Display()
			  aegerUI_1Bar() else
		    if aegerUI.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
			  aegerUI_2Bar()
            end
	    end
    end

    function DisplayBars:UNIT_ENTERED_VEHICLE()
            if UnitHasVehicleUI("player") then
		    if aegerUI.db.profile.NumBottomBars == 1 then
		      Bbar1Hide() elseif
		    aegerUI.db.profile.NumBottomBars == 2 then
		      Bbar2Hide()
		    end
	    end
    end

    function DisplayBars:UNIT_EXITED_VEHICLE()
            if not UnitHasVehicleUI("player") then
		    if aegerUI.db.profile.NumBottomBars == 1 then
		      Bbar1Display() elseif
		    aegerUI.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
		    end
	    end 
    end


    function DisplayBars:PLAYER_REGEN_ENABLED()
            CombatColorOff()
    end

    function DisplayBars:PLAYER_REGEN_DISABLED()
            CombatColorOn()
    end
	
	function DisplayBars:PET_BATTLE_OPENING_START()
            if aegerUI.db.profile.NumBottomBars == 1 then
		      Bbar1Hide() elseif
		    aegerUI.db.profile.NumBottomBars == 2 then
		      Bbar2Hide()
		    end
    end
	
	function DisplayBars:PET_BATTLE_CLOSE()
            if aegerUI.db.profile.NumBottomBars == 1 then
		      Bbar1Display() elseif
		    aegerUI.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
		    end
    end
	
	function DisplayBars:GROUP_ROSTER_UPDATE()
		if aegerUI.db.global.MoveCompactManager and aegerUI.db.global.ChatFrame_Position == 'TOP' then
			AUI_GROUP_ROSTER_UPDATE()
		end
	end
	
--  Bottom bar frames  ---------------------------------------------------------

    function BottomBarFrame1()  
	     Bar1Frame = CreateFrame('Frame', "Bar1Frame", UIParent)
	     Bar1Frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
		 Bar1Frame:SetPoint("CENTER", UIParent, "CENTER")
		 Bar1Frame:SetSize(947, 50)
		
		 local Bar1texture = Bar1Frame:CreateTexture(nil, "BACKGROUND")
		 Bar1texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	     Bar1texture:SetPoint("CENTER", UIParent, "CENTER")
	     Bar1texture:SetSize(943, 43)
	     Bar1texture:SetTexture(MEDIA_PATH .. "textures\\btrounded")		
	     Bar1texture:SetVertexColor(0, 0, 0, .5)
		 Bar1Frame.Bar1texture = Bar1texture
		
		 local Bar1border = Bar1Frame:CreateTexture(nil, "BORDER")
		 Bar1border:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -6)
	     Bar1border:SetPoint("CENTER", UIParent, "CENTER")
		 Bar1border:SetSize(950, 50)
		 Bar1border:SetTexture(MEDIA_PATH .. "textures\\btroundedborder")
		 Bar1border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 Bar1Frame.Bar1border = Bar1border
    end


    function BottomBarFrame2()  
	     Bar2Frame = CreateFrame('Frame', "Bar2Frame", UIParent)
	     Bar2Frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
		 Bar2Frame:SetPoint("CENTER", UIParent, "CENTER")
		 Bar2Frame:SetSize(950, 94)
		
		 local Bar2texture = Bar2Frame:CreateTexture(nil, "BACKGROUND")
		 Bar2texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	     Bar2texture:SetPoint("CENTER", UIParent, "CENTER")
	     Bar2texture:SetSize(943, 84)
	     Bar2texture:SetTexture(MEDIA_PATH .. "textures\\btrounded")		
	     Bar2texture:SetVertexColor(0, 0, 0, .5)
		 Bar2Frame.Bar2texture = Bar2texture
		
		 local Bar2border = Bar2Frame:CreateTexture(nil, "BORDER")
		 Bar2border:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -8)
	     Bar2border:SetPoint("CENTER", UIParent, "CENTER")
		 Bar2border:SetSize(950, 94)
		 Bar2border:SetTexture(MEDIA_PATH .. "textures\\btroundedborder")
		 Bar2border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 Bar2Frame.Bar2border = Bar2border
    end
	
	function AUI_CompactRaidFrame()
		local CompactBackdrop = CreateFrame("Frame")
		CompactBackdrop:SetSize(14, 120)
		CompactBackdrop:SetBackdrop( { 
			bgFile = "Interface\\AddOns\\aegerUI\\Media\\textures\\Solid.tga", 
			edgeFile = MEDIA_PATH .. "textures\\Skinner.tga", tile = false, tileSize = 0, edgeSize = 15, 
			insets = { left = 4, right = 4, top = 4, bottom = 4}
		})
		CompactBackdrop:SetBackdropBorderColor(0,0,0)
		CompactBackdrop:SetBackdropColor(0.1,0.1,0.1,0.9)
		CompactBackdrop:SetAllPoints(CompactRaidFrameManager)
		CompactBackdrop:SetPoint("TOPLEFT", CompactRaidFrameManager, "TOPLEFT", -4,0)
		CompactBackdrop:SetParent(CompactRaidFrameManager)
		
		
		if not aegerUI.db.global.MoveCompactManager or aegerUI.db.global.ChatFrame_Position == 'BOTTOM' then
			local AUI_CompactButton = CreateFrame("Frame")
			AUI_CompactButton:SetSize(14, 120)
			AUI_CompactButton:SetAllPoints(CompactRaidFrameManagerToggleButton)
			AUI_CompactButton:SetParent(CompactRaidFrameManagerToggleButton)
			AUI_CompactButton.text = AUI_CompactButton:CreateTexture(nil, "BACKGROUND")
			AUI_CompactButton.text:SetTexture(MEDIA_PATH .. "textures\\RightBarButton")
			AUI_CompactButton.text:SetAllPoints(AUI_CompactButton)
			AUI_CompactButton.text:SetTexCoord(1, 0, 0, 1)
			AUI_CompactButton.text:SetPoint("TOPLEFT", 0,6)
			AUI_CompactButton.text:SetPoint("BOTTOMRIGHT", 0,-6)
			AUI_CompactButton.text:SetPoint("RIGHT", 2,0)
			AUI_CompactButton.text:SetPoint("LEFT", 2,0)
			AUI_CompactButton:EnableMouse(false)
		
			AUI_CompactButton.font = AUI_CompactButton:CreateFontString()
			AUI_CompactButton.font:SetPoint("CENTER", 2, 0)
			AUI_CompactButton.font:SetFont(FONT, 14)
			AUI_CompactButton.font:SetText(">")
			AUI_CompactButton.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
		
			if IsAddOnLoaded("Blizzard_CompactRaidFrames") then
				local point, relativeTo, relativePoint, xOfs, yOfs = CompactRaidFrameManagerToggleButton:GetPoint()
				CompactRaidFrameManagerToggleButton:SetPoint(point, relativeTo, relativePoint, 12, yOfs)
				local origHeight = CompactRaidFrameManagerToggleButton:GetHeight()
				CompactRaidFrameManagerToggleButton:SetHeight(origHeight+40)
			end
		
			CompactRaidFrameManagerToggleButton:HookScript("OnEnter", function() 
				local _, class = UnitClass("player")
				if class == "PRIEST" then
					AUI_CompactButton.font:SetTextColor(0,1,0)
				else
					AUI_CompactButton.font:SetTextColor(1,1,1)
				end
			end)
			
			CompactRaidFrameManagerToggleButton:HookScript("OnLeave", function() 
				AUI_CompactButton.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
			end)
			
			CompactRaidFrameManagerToggleButton:HookScript("OnClick", function() 
				if CompactHidden then
					AUI_CompactButton.font:SetText("<")
					CompactHidden = false
				else
					AUI_CompactButton.font:SetText(">")
					CompactHidden = true
				end
			end)
		end
		
		if aegerUI.db.global.MoveCompactManager and aegerUI.db.global.ChatFrame_Position == 'TOP' then
			-- Compact Raid Frame
			AUI_ToggleCompact = CreateFrame("Button", "AUI_ToggleCompact")
			AUI_ToggleCompact:SetPoint("TOPLEFT", UIParent, "LEFT", 0, 150)
			AUI_ToggleCompact:SetParent(UIParent)
			AUI_ToggleCompact:SetSize(14, 120)
			toggleTexture = AUI_ToggleCompact:CreateTexture(nil, "BACKGROUND")
			toggleTexture:SetTexture(MEDIA_PATH .. "textures\\RightBarButton")
			toggleTexture:SetAllPoints(AUI_ToggleCompact)
			toggleTexture:SetTexCoord(1, 0, 0, 1)
		
			AUI_ToggleCompact.text = AUI_ToggleCompact:CreateFontString()
			AUI_ToggleCompact.text:SetPoint("CENTER")
			AUI_ToggleCompact.text:SetFont(FONT, 14)
			AUI_ToggleCompact.text:SetText(">")
			AUI_ToggleCompact.text:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
		
			AUI_ToggleCompact:SetScript("OnEnter", function() 
				local _, class = UnitClass("player")
				if class == "PRIEST" then
					AUI_ToggleCompact.text:SetTextColor(0,1,0)
				else
					AUI_ToggleCompact.text:SetTextColor(1,1,1)
				end 
			end)
		
			AUI_ToggleCompact:SetScript("OnLeave", function() 
				AUI_ToggleCompact.text:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
			end)
		
			if IsAddOnLoaded("Blizzard_CompactRaidFrames") then
				CompactRaidFrameManager:SetParent(AUI_ToggleCompact)
				CompactRaidFrameManager:ClearAllPoints()
				CompactRaidFrameManager:SetPoint("RIGHT", AUI_ToggleCompact, "LEFT", 3, 0)
				CompactRaidFrameManager:SetFrameStrata("DIALOG")
				CompactRaidFrameManagerToggleButton:Hide()
			end
		
			AUI_ToggleCompact:SetScript("OnClick", function(self)
			if InCombatLockdown() then return end
				if CompactHidden then
					CompactRaidFrameManager:Show()
					CompactRaidFrameManager:SetPoint("RIGHT", AUI_ToggleCompact, "LEFT", 3, 0)
					local width, _ = CompactRaidFrameManager:GetSize()
					CompactRaidFrameManagerDisplayFrame:Show()
					AUI_ToggleCompact:SetPoint("TOPLEFT", UIParent, "LEFT", width-4, 150)
					AUI_ToggleCompact.text:SetText("<")
					CompactHidden = false
				else
					CompactRaidFrameManager:Hide()
					CompactRaidFrameManagerDisplayFrame:Hide()
					AUI_ToggleCompact:SetPoint("TOPLEFT", UIParent, "LEFT", 0, 150)
					AUI_ToggleCompact.text:SetText(">")
					CompactHidden = true
				end
			end)
				
			if IsInGroup() then
				AUI_ToggleCompact:Show()
			else
				AUI_ToggleCompact:Hide()
				CompactHidden = true
			end
		
			function AUI_GROUP_ROSTER_UPDATE()
				if IsInGroup() then
					AUI_ToggleCompact:Show()
				else
					AUI_ToggleCompact:Hide()
					CompactHidden = true
				end
			end
		end
	end

--  Core logic  ---------------------------------------------------------------
    function Bbar1Display()
	  if not Bar1Frame then
	    BottomBarFrame1()
	  end
	  Bar1Frame:Show()
    end

    function Bbar2Display()
	  if not Bar2Frame then
	    BottomBarFrame2()
	  end
	  Bar2Frame:Show()
    end

    function Bbar1Hide()
	  if not Bar1Frame then
	    BottomBarFrame1()
	  end
	  Bar1Frame:Hide()
    end

    function Bbar2Hide()
	  if not Bar2Frame then
	    BottomBarFrame2()
	  end
	  Bar2Frame:Hide()
    end

    function CombatColorOn()
	       if aegerUI.db.profile.NumBottomBars == 1 then
		     Bar1Frame.Bar1border:SetVertexColor(1, 0, 0)
		   else
		   if aegerUI.db.profile.NumBottomBars == 2 then
		     Bar2Frame.Bar2border:SetVertexColor(1, 0, 0)
	       end 
	    end
    end

    function CombatColorOff()
	       if aegerUI.db.profile.NumBottomBars == 1 then
		     Bar1Frame.Bar1border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		   else
		   if aegerUI.db.profile.NumBottomBars == 2 then
		     Bar2Frame.Bar2border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	       end
	    end 
    end