local aegerUI = ...
local MEDIAPATH = "Interface\\AddOns\\aegerUI\\media\\"
local CLICK = "Interface\\AddOns\\aegerUI\\media\\sound\\click.mp3"
local FONT = "Fonts\\FRIZQT__.ttf"
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]

------------------------------------------------------------------------
-- Core Objects and Functions
------------------------------------------------------------------------
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

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self, event, ...)

	if SIDEBARS == 1 then
		Expand_Bar3:Show()
	elseif SIDEBARS == 2 then
		MBar3:Show()
		Retract_Bar3:Show()
		Expand_Bar4:Show()
	elseif SIDEBARS == 3 then
		MBar4:Show()
		Retract_Bar4:Show()
	else
		SIDEBARS = 1
		Expand_Bar3:Show()
	end
end)

local function ExpandOne()
	SIDEBARS = 2
	Expand_Bar3:Hide()
	MBar3:Show()
	WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 80, -20)
end

local function ExpandTwo()
	SIDEBARS = 3
	MBar3:Hide()
	MBar4:Show()
	WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 40, -20)
end

local function RetractOne()
	SIDEBARS = 2
	MBar4:Hide()
	MBar3:Show()
	WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 80, -20)
end

local function RetractTwo()
	SIDEBARS = 1
	Expand_Bar3:Show()
	MBar3:Hide()
	WatchFrame:SetPoint("TOPRIGHT", "Minimap", "BOTTOMLEFT", 120, -20)
end


------------------------------------------------------------------------
-- OnShow Events
------------------------------------------------------------------------
MBar3:SetScript("OnShow", function(self)
	self:SetScript("OnShow", nil)
	self:SetPoint("TOPLEFT", "BT4Bar3", "TOPLEFT", -1, 15)
	self:SetSize(42, 480)
	Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", false)
	Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", true)
	local Right1Bar = self:CreateTexture(nil, "BORDER")
	Right1Bar:SetPoint("RIGHT", 0, 0)
	Right1Bar:SetSize(42, 480)
	Right1Bar:SetTexture(MEDIAPATH .. "textures\\Right1Bar")
	self.Right1Bar = Right1Bar

	local Expand_Bar4 = CreateFrame("Button", nil, self)
	Expand_Bar4:SetPoint("RIGHT", Right1Bar, "LEFT", 0, 100)
	Expand_Bar4:SetSize(14, 120)
	Expand_Bar4:SetNormalTexture(MEDIAPATH .. "textures\\RightBarButton")
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
	Retract_Bar3:SetNormalTexture(MEDIAPATH .. "textures\\RightBarButton")
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
			if Bartender4.db:GetCurrentProfile() == "aegerUI1bar" or "aegerUI2bar" then
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
			if Bartender4.db:GetCurrentProfile() == "aegerUI1bar" or "aegerUI2bar" then
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
	Right2Bars:SetTexture(MEDIAPATH .. "textures\\Right2Bars")
	self.Right2Bars = Right2Bars

	local Retract_Bar4 = CreateFrame("Button", nil, self)
	Retract_Bar4:SetPoint("RIGHT", Right2Bars, "LEFT", 0, 0)
	Retract_Bar4:SetSize(14, 120)
	Retract_Bar4:SetNormalTexture(MEDIAPATH .. "textures\\RightBarButton")
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
			if Bartender4.db:GetCurrentProfile() == "aegerUI1bar" or "aegerUI2bar" then
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
	self:SetNormalTexture(MEDIAPATH .. "textures\\RightBarButton")
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
			if Bartender4.db:GetCurrentProfile() == "aegerUI1bar" or "aegerUI2bar" then
				Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", false)
			else
				print("|cff00ccffaegerUI: |cffff0000Bartender Action Bars will not expand while there is a custom profile in use!")
			end
		end
		ExpandOne()
	end)
end)
