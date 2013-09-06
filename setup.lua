local aegerUI = ...
local MEDIAPATH = "Interface\\AddOns\\aegerUI\\Media\\"

local FONT = "Fonts\\FRIZQT__.ttf"

local ADDONS = {
  "Bartender4",
  }
  
local TEXT = {

  Install = "Install",
  Cancel = "Cancel",
  Intro = "aegerUI",
  
  }
 
 --Frames------------------------------------------------------------------
  
local SetupFrame = CreateFrame("Frame", "SetupFrame", UIParent)
SetupFrame:Hide()

local FirstRunFrame = CreateFrame("Frame")
FirstRunFrame:RegisterEvent("PLAYER_LOGIN")

--Events---------------------------------------------------------------------

FirstRunFrame:SetScript("OnEvent", function(self, event, ...)
self:RegisterEvent("CINEMATIC_START")
self:RegisterEvent("CINEMATIC_STOP")
if event == "CINEMATIC_START" then 
  SetupFrame:Hide()
elseif event == "CINEMATIC_STOP" then
 if FirstRun == nil then
  SetupFrame:Show()
 end
 else
 if FirstRun == nil then
  SetupFrame:Show()
  end
 end
 end)

--Functions------------------------------------------------------------------

 local function SetProfiles()
  if IsAddOnLoaded("Bartender4") then
    Bartender4.db:SetProfile("aegerUI1bar")
	Bartender4:GetModule("ActionBars"):EnableBar(10)
	Bartender4:GetModule("ActionBars"):EnableBar(9)
	Bartender4:GetModule("ActionBars"):EnableBar(3)
	Bartender4:GetModule("ActionBars"):EnableBar(4)
	Bartender4.Bar.barregistry["10"]:SetVisibilityOption("always", true)
	Bartender4.Bar.barregistry["9"]:SetVisibilityOption("always", true)
	Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always", true)
	Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always", true)
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
PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
SetupFrame:Hide()
FirstRun = 0
SetProfiles()
SetBbars1()
ReloadUI()
end

local function BigButton_OnEnter(self)
	self:GetNormalTexture():SetVertexColor(0, 1, 0)
end

local function Button_OnLeave(self)
	self:GetNormalTexture():SetVertexColor(1, 1, 1)
end

--Setup frame----------------------------------------------------------------

SetupFrame:SetScript("OnShow", function(self)
  self:SetScript("OnShow", nil)
  self:SetPoint("CENTER", UIParent, "CENTER")
  self:SetSize(453, 194)
  self:SetFrameStrata("TOOLTIP")
  self:SetFrameLevel("18")

  local Backdrop = self:CreateTexture(nil, "BACKGROUND")
    Backdrop:SetAllPoints(UIParent)
    Backdrop:SetTexture(0, 0, 0, 0.9)
    self.Backdrop = Backdrop
	
  local aegerLogo = self:CreateTexture(nil, "BORDER")
    aegerLogo:SetPoint("CENTER", SetupFrame, "CENTER")
	aegerLogo:SetSize(453, 194)
	aegerLogo:SetTexture(MEDIAPATH .. "aegerUIlogo")
	
  --------------------
--  INSTALL Button  --
--------------------

	local SetupButton = CreateFrame("Button", nil, self)
	SetupButton:SetPoint("TOP", SetupFrame, "BOTTOM")
	SetupButton:SetSize(346, 68)
	SetupButton:SetNormalTexture(MEDIAPATH .. "BigButton")
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
--  CANCEL Button  --
--------------------

	local CancelButton = CreateFrame("Button", nil, self)
	CancelButton:SetPoint("TOP", SetupButton, "BOTTOM", 0, 2)
	CancelButton:SetSize(346, 68)
	CancelButton:SetNormalTexture(MEDIAPATH .. "BigButton")
	CancelButton:SetScript("OnEnter", BigButton_OnEnter)
	CancelButton:SetScript("OnLeave", Button_OnLeave)
	CancelButton:SetScript("OnClick", function(this)
		PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
		FirstRun = nil
		SetupFrame:Hide()
		UIParent:SetAlpha(1)
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
	FirstRun = nil
	SetupFrame:Show()
end
SLASH_INSTALL1 = "/install"
