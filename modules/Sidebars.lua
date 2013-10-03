-------------------------------------------------------------------------------
--  aegerUI 5.4.4 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
    	
--  Constants  ----------------------------------------------------------------
	local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]    
	local FONT = "Fonts\\FRIZQT__.ttf"
	local CLICK = "Interface\\AddOns\\aegerUI\\media\\sound\\click.mp3"
	
-- Define locals and local functions up here so they're in scope for the whole file
	local SideBarLoad
	local ExpandOne
	local ExpandTwo
	local RetractOne
	local RetractTwo
	
--  Event logic  --------------------------------------------------------------
    local EventFrame = CreateFrame('Frame')
     
    EventFrame:RegisterEvent('PLAYER_LOGIN')
     
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
		SideBarLoad()
	end

--  Frames  ---------------------------------------------------------------------
	local MBar3 = CreateFrame("Frame", "MBar3", UIParent)
	MBar3:Hide()

	local MBar4 = CreateFrame("Frame", "MBar4", UIParent)
	MBar4:Hide()

	local Expand_Bar3 = CreateFrame("Button", "Expand_Bar3", UIParent)
	Expand_Bar3:Hide()

	local Expand_Bar4 = CreateFrame("Button", "Expand_Bar4", MBar3)
	Expand_Bar4:Hide()

	local Retract_Bar3 = CreateFrame("Button", "Retract_Bar3", MBar3)
	Retract_Bar3:Hide()

	local Retract_Bar4 = CreateFrame("Button", "Retract_Bar4", MBar4)
	Retract_Bar4:Hide()
		
--  OnShow events  --------------------------------------------------------------
MBar3:SetScript("OnShow", function(self)
	self:SetScript("OnShow", nil)
	self:SetPoint("TOPLEFT", "BT4Bar3", "TOPLEFT", -1, 15)
	self:SetSize(42, 480)
	Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", false)
	Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", true)
	local Right1Bar = self:CreateTexture(nil, "BORDER")
	Right1Bar:SetPoint("RIGHT", 0, 0)
	Right1Bar:SetSize(42, 480)
	Right1Bar:SetTexture(MEDIA_PATH .. "textures\\Right1Bar")
	Right1Bar:SetVertexColor(0, 0, 0, 0.5)
	self.Right1Bar = Right1Bar

	local Expand_Bar4 = CreateFrame("Button", nil, self)
	Expand_Bar4:SetPoint("RIGHT", Right1Bar, "LEFT", 0, 100)
	Expand_Bar4:SetSize(14, 120)
	Expand_Bar4:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Expand_Bar4:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
	self.Expand_Bar4 = Expand_Bar4

	local OutE4 = Expand_Bar4:CreateFontString(nil, "HIGH")
	OutE4:SetPoint("CENTER")
	OutE4:SetFont(FONT, 14)
	OutE4:SetText("<")
	OutE4:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

	Expand_Bar4:SetScript("OnEnter", function()
		local _, class = UnitClass("player");
		if class == "PRIEST" then
			OutE4:SetTextColor(0, 1, 0)
		else
			OutE4:SetTextColor(1, 1, 1)
		end
	end)

	Expand_Bar4:SetScript("OnLeave", function()
		OutE4:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	local Retract_Bar3 = CreateFrame("Button", nil, self)
	Retract_Bar3:SetPoint("RIGHT", Right1Bar, "LEFT", 0, -100)
	Retract_Bar3:SetSize(14, 120)
	Retract_Bar3:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Retract_Bar3:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
	self.Retract_Bar3 = Retract_Bar3

	local OutR3 = Retract_Bar3:CreateFontString(nil, "HIGH")
	OutR3:SetPoint("CENTER")
	OutR3:SetFont(FONT, 14)
	OutR3:SetText(">")
	OutR3:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

	Retract_Bar3:SetScript("OnEnter", function()
		local _, class = UnitClass("player");
		if class == "PRIEST" then
			OutR3:SetTextColor(1, 0, 0)
		else
			OutR3:SetTextColor(1, 1, 1)
		end
	end)

	Retract_Bar3:SetScript("OnLeave", function()
		OutR3:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	Expand_Bar4:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		if IsAddOnLoaded("Bartender4") then
			if Bartender4.db:GetCurrentProfile() == "aegerUI" then
				Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", false)
			else
				print("|cff00ccffaegerUI: |cffff0000Bartender Action Bars will not expand while there is a custom profile in use!")
			end
		end
		ExpandTwo()
	end)

	Retract_Bar3:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		if IsAddOnLoaded("Bartender4") then
			if Bartender4.db:GetCurrentProfile() == "aegerUI" then
				Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", true)
			else
				print("|cff00ccffaegerUI: |cffff0000Bartender Action Bars will not retract while there is a custom profile in use!")
			end
		end
		RetractTwo()
	end)
end)

MBar4:SetScript("OnShow", function(self)
	self:SetScript("OnShow", nil)
	self:SetPoint("TOPLEFT", "BT4Bar4", "TOPLEFT", 0, 15)
	self:SetSize(76, 480)
	Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", false)
	Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", false)

	local Right2Bars = self:CreateTexture(nil, "BORDER")
	Right2Bars:SetPoint("RIGHT", 0, 0)
	Right2Bars:SetSize(76, 480)
	Right2Bars:SetTexture(MEDIA_PATH .. "textures\\Right2Bars")
	Right2Bars:SetVertexColor(0, 0, 0, 0.5)
	self.Right2Bars = Right2Bars

	local Retract_Bar4 = CreateFrame("Button", nil, self)
	Retract_Bar4:SetPoint("RIGHT", Right2Bars, "LEFT", 0, 0)
	Retract_Bar4:SetSize(14, 120)
	Retract_Bar4:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Retract_Bar4:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
	self.Retract_Bar4 = Retract_Bar4

	local OutR4 = Retract_Bar4:CreateFontString(nil, "HIGH")
	OutR4:SetPoint("CENTER")
	OutR4:SetFont(FONT, 14)
	OutR4:SetText(">")
	OutR4:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

	Retract_Bar4:SetScript("OnEnter", function()
		local _, class = UnitClass("player");
		if class == "PRIEST" then
			OutR4:SetTextColor(1, 0, 0)
		else
			OutR4:SetTextColor(1, 1, 1)
		end
	end)

	Retract_Bar4:SetScript("OnLeave", function()
		OutR4:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	Retract_Bar4:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		if IsAddOnLoaded("Bartender4") then
			if Bartender4.db:GetCurrentProfile() == "aegerUI" then
				Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", true)
			else
				print("|cff00ccffaegerUI: |cffff0000Bartender Action Bars will not retract while there is a custom profile in use!")
			end
		end
		RetractOne()
	end)
end)

Expand_Bar3:SetScript("OnShow", function(self)
	self:SetPoint("RIGHT", UIParent, 0, 63)
	self:SetSize(14, 120)
	Expand_Bar3:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Expand_Bar3:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
	Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", true)
	Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", true)

	local OutE3 = self:CreateFontString(nil, "HIGH")
	OutE3:SetPoint("CENTER")
	OutE3:SetFont(FONT, 14)
	OutE3:SetText("<")
	OutE3:SetTextColor(classcolor.r, classcolor.g, classcolor.b)

	Expand_Bar3:SetScript("OnEnter", function()
		local _, class = UnitClass("player");
		if class == "PRIEST" then
			OutE3:SetTextColor(0, 1, 0)
		else
			OutE3:SetTextColor(1, 1, 1)
		end
	end)

	Expand_Bar3:SetScript("OnLeave", function()
		OutE3:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	Expand_Bar3:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		if IsAddOnLoaded("Bartender4") then
			if Bartender4.db:GetCurrentProfile() == "aegerUI" then
				Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", false)
			else
				print("|cff00ccffaegerUI: |cffff0000Bartender Action Bars will not expand while there is a custom profile in use!")
			end
		end
		ExpandOne()
	end)
end)

--  Core logic  -----------------------------------------------------------------	
	function SideBarLoad()
		if aegerUI.db.profile.SideBars == 1 then
			Expand_Bar3:Show()
		elseif aegerUI.db.profile.SideBars == 2 then
			MBar3:Show()
			Retract_Bar3:Show()
			Expand_Bar4:Show()
		elseif aegerUI.db.profile.SideBars == 3 then
			MBar4:Show()
			Retract_Bar4:Show()
		else
			aegerUI.db.profile.SideBars = 1
			Expand_Bar3:Show()
		end
	end
	
	function ExpandOne()
		aegerUI.db.profile.SideBars = 2
		Expand_Bar3:Hide()
		MBar3:Show()
		WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 80, -20)
	end
	
	function ExpandTwo()
		aegerUI.db.profile.SideBars = 3
		MBar3:Hide()
		MBar4:Show()
		WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 40, -20)
	end

	function RetractOne()
		aegerUI.db.profile.SideBars = 2
		MBar4:Hide()
		MBar3:Show()
		WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 80, -20)
	end

	function RetractTwo()
		aegerUI.db.profile.SideBars = 1
		Expand_Bar3:Show()
		MBar3:Hide()
		WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 120, -20)
	end
	
	