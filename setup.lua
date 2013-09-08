--Namespace------------------------------------------------------------------
local FOLDER_NAME, private_data = ...

--Constants------------------------------------------------------------------
local MEDIA_PATH = ([[Interface\AddOns\%s\Media\]]):format(FOLDER_NAME)

local FONT = "Fonts\\FRIZQT__.ttf"

local ADDON_PROFILE_ASSIGNMENTS = {
	Bartender4 = function(addon_obj)
		addon_obj.db:SetProfile("aegerUI1bar")

		local action_bars = addon_obj:GetModule("ActionBars")
		action_bars:EnableBar(10)
		action_bars:EnableBar(9)
		action_bars:EnableBar(3)
		action_bars:EnableBar(4)

		local registry = addon_obj.Bar.barregistry
		registry["10"]:SetVisibilityOption("always", true)
		registry["9"]:SetVisibilityOption("always", true)
		registry["3"]:SetVisibilityOption("always", true)
		registry["4"]:SetVisibilityOption("always", true)
	end,
}

local TEXT = {
	Install = "Install",
	Cancel = "Cancel",
}

--Frames---------------------------------------------------------------------

local SetupFrame = CreateFrame("Frame", "SetupFrame", UIParent)
SetupFrame:Hide()

local FirstRunFrame = CreateFrame("Frame")
FirstRunFrame:RegisterEvent("PLAYER_LOGIN")

--Events---------------------------------------------------------------------

FirstRunFrame:SetScript("OnEvent", function(self, event_name, ...)
	if not self[event_name] then
		if not SetupDone then
			SetupFrame:Show()
		end
		return
	end
	return self[event_name](self, event_name, ...)
end)

--Functions------------------------------------------------------------------

local function SetProfiles()
	for addon_name, profile_func in pairs(ADDON_PROFILE_ASSIGNMENTS) do
		if IsAddOnLoaded(addon_name) then
			profile_func(_G[addon_name])
		end
	end
end

local function SetBbars1()
	Bbars = 1
	TopmenuShow = 1
end

local function SetBbars2()
	Bbars = 2
	TopmenuShow = 1
end

local function DoSetup()
	PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
	SetupFrame:Hide()
	SetupDone = true
	SetProfiles()
	SetBbars1()
	ReloadUI()
end

local function BigButton_OnEnter(self)
	self:GetNormalTexture():SetVertexColor(1, 0, 0)
end

local function Button_OnLeave(self)
	self:GetNormalTexture():SetVertexColor(1, 1, 1)
end

--Setup frame----------------------------------------------------------------

SetupFrame:SetScript("OnShow", function(self)
	self:SetPoint("CENTER", UIParent, "CENTER")
	self:SetSize(453, 194)
	self:SetFrameStrata("TOOLTIP")
	self:SetFrameLevel("18")

	local Backdrop = self:CreateTexture(nil, "BACKGROUND")
	Backdrop:SetAllPoints(UIParent)
	Backdrop:SetTexture(0, 0, 0, 0.9)
	self.Backdrop = Backdrop

	local aegerLogo = self:CreateTexture(nil, "BORDER")
	aegerLogo:SetPoint("CENTER", self, "CENTER")
	aegerLogo:SetSize(453, 194)
	aegerLogo:SetTexture(MEDIA_PATH .. "aegerUIlogo")

	--------------------
	-- INSTALL Button  --
	--------------------

	local SetupButton = CreateFrame("Button", nil, self)
	SetupButton:SetPoint("TOP", self, "BOTTOM")
	SetupButton:SetPoint("LEFT", self, "LEFT")
	SetupButton:SetSize(153, 56)
	SetupButton:SetNormalTexture(MEDIA_PATH .. "setupButton")
	SetupButton:SetScript("OnEnter", BigButton_OnEnter)
	SetupButton:SetScript("OnLeave", Button_OnLeave)
	SetupButton:SetScript("OnClick", DoSetup)
	self.SetupButton = SetupButton

	local SetupText = SetupButton:CreateFontString(nil, "OVERLAY")
	SetupText:SetPoint("LEFT")
	SetupText:SetPoint("RIGHT")
	SetupText:SetFont(FONT, 32, "OUTLINE")
	SetupText:SetAlpha(0.8)
	SetupText:SetText(TEXT.Install)
	SetupButton:SetFontString(SetupText)

	--------------------
	-- CANCEL Button  --
	--------------------

	local CancelButton = CreateFrame("Button", nil, self)
	CancelButton:SetPoint("TOP", self, "BOTTOM")
	CancelButton:SetPoint("RIGHT", self, "RIGHT")
	CancelButton:SetSize(153, 56)
	CancelButton:SetNormalTexture(MEDIA_PATH .. "setupButton")
	CancelButton:SetScript("OnEnter", BigButton_OnEnter)
	CancelButton:SetScript("OnLeave", Button_OnLeave)
	CancelButton:SetScript("OnClick", function(this)
		PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
		SetupDone = nil
		self:Hide()
	end)

	self.CancelButton = CancelButton
	local CancelText = CancelButton:CreateFontString(nil, "OVERLAY")
	CancelText:SetPoint("LEFT")
	CancelText:SetPoint("RIGHT")
	CancelText:SetFont(FONT, 32, "OUTLINE")
	CancelText:SetAlpha(0.8)
	CancelText:SetText(TEXT.Cancel)
	CancelButton:SetFontString(CancelText)
end)

SlashCmdList.INSTALL = function()
	SetupDone = nil
	SetupFrame:Show()
end
SLASH_INSTALL1 = "/install"
