local AUI, aui = ...

local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
local FONT = "Fonts\\FRIZQT__.ttf"

function aegerUI_SetupUI:OnEnable()	
local InitSetupFrame
local SetupFrame
local CharName = UnitName("player")
		
--  Setup frame  ------------------------------------------------------------------
function InitSetupFrame()  -- This is local
    SetupFrame = CreateFrame('Frame', nil, UIParent)
    SetupFrame:SetPoint("CENTER", UIParent, "CENTER")
    SetupFrame:SetSize(453, 194)
    SetupFrame:SetFrameStrata("TOOLTIP")
    SetupFrame:SetFrameLevel("18")
     
    local Backdrop = SetupFrame:CreateTexture(nil, "BACKGROUND")
    Backdrop:SetAllPoints(UIParent)
    Backdrop:SetTexture(0, 0, 0, 0.9)
    SetupFrame.Backdrop = Backdrop
     
    local aegerLogo = SetupFrame:CreateTexture(nil, "BORDER")
    aegerLogo:SetPoint("CENTER", SetupFrame, "CENTER")
    aegerLogo:SetSize(453, 194)
    aegerLogo:SetTexture(MEDIA_PATH .. "Setup\\aegerUIlogo")
	
	--------------------
    -- RELOAD Button  --
    --------------------
	
	ReloadButton = CreateFrame("Button", nil, SetupFrame)
	ReloadButton:SetPoint("TOP", SetupFrame, "BOTTOM")
    ReloadButton:SetPoint("LEFT", SetupFrame, "LEFT")
    ReloadButton:SetSize(153, 56)
    ReloadButton:SetNormalTexture(MEDIA_PATH .. "Setup\\reloadbtn")
	ReloadButton:SetScript("OnEnter", BigButton_OnEnter)
    ReloadButton:SetScript("OnLeave", Button_OnLeave)
    ReloadButton:SetScript("OnClick", function(self)
            ReloadUI()
    end)
    SetupFrame.ReloadButton = ReloadButton
	ReloadButton:Hide()
     
    local ReloadText = ReloadButton:CreateFontString(nil, "OVERLAY")
    ReloadText:SetPoint("LEFT")
    ReloadText:SetPoint("RIGHT")
    ReloadText:SetFont(FONT, 32, "OUTLINE")
    ReloadText:SetAlpha(0.8)
    ReloadText:SetText("Reload")
    ReloadButton:SetFontString(ReloadText)
    
    --------------------
    -- INSTALL Button  --
    --------------------
    
    local function BigButton_OnEnter(self)
            self:GetNormalTexture():SetVertexColor(1, 0, 0)
    end
    
    local function Button_OnLeave(self)
            self:GetNormalTexture():SetVertexColor(1, 1, 1)
    end
    
    local SetupButton = CreateFrame("Button", nil, SetupFrame)
    SetupButton:SetPoint("TOP", SetupFrame, "BOTTOM")
    SetupButton:SetPoint("LEFT", SetupFrame, "LEFT")
    SetupButton:SetSize(153, 56)
    SetupButton:SetNormalTexture(MEDIA_PATH .. "Setup\\setupButton")
    SetupButton:SetScript("OnEnter", BigButton_OnEnter)
    SetupButton:SetScript("OnLeave", Button_OnLeave)
    SetupButton:SetScript("OnClick", function(self)
            aui.ApplySetup()
            self:Hide()
	ReloadButton:Show()
    end)
    SetupFrame.SetupButton = SetupButton
     
    local SetupText = SetupButton:CreateFontString(nil, "OVERLAY")
    SetupText:SetPoint("LEFT")
    SetupText:SetPoint("RIGHT")
    SetupText:SetFont(FONT, 32, "OUTLINE")
    SetupText:SetAlpha(0.8)
    SetupText:SetText("Install")
    SetupButton:SetFontString(SetupText)
    
    --------------------
    -- CANCEL Button  --
    --------------------
    
    local CancelButton = CreateFrame("Button", nil, SetupFrame)
    CancelButton:SetPoint("TOP", SetupFrame, "BOTTOM")
    CancelButton:SetPoint("RIGHT", SetupFrame, "RIGHT")
    CancelButton:SetSize(153, 56)
    CancelButton:SetNormalTexture(MEDIA_PATH .. "Setup\\setupButton")
    CancelButton:SetScript("OnEnter", BigButton_OnEnter)
    CancelButton:SetScript("OnLeave", Button_OnLeave)
    CancelButton:SetScript("OnClick", function(this)
            PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
            SetupFrame:Hide()
    end)
    
    SetupFrame.CancelButton = CancelButton
    local CancelText = CancelButton:CreateFontString(nil, "OVERLAY")
    CancelText:SetPoint("LEFT")
    CancelText:SetPoint("RIGHT")
    CancelText:SetFont(FONT, 32, "OUTLINE")
    CancelText:SetAlpha(0.8)
    CancelText:SetText("Cancel")
    CancelButton:SetFontString(CancelText)
end

-- Setup functions	
function aui.DoSetup() --Called in options panel
	PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
		if not SetupFrame then  -- the SetupFrame hasnt been created
			InitSetupFrame()
        end
			SetupFrame:Show()
end
	
local function MoveChatFrame()
	FCF_SetLocked(ChatFrame1, 1)
	ChatFrame1:ClearAllPoints()
    ChatFrame1:SetHeight(160)	
    ChatFrame1:SetWidth(380)
    ChatFrame1:SetPoint('BOTTOMLEFT',UIParent,'BOTTOMLEFT',30,37)
    ChatFrame1:SetUserPlaced(true);
	FCF_SavePositionAndDimensions(ChatFrame1)
end
		
local function InstallAddonOptions()
	MoveChatFrame()
	aui.InstallAtlasLoot()
	aui.BagSyncOptions()
	aui.InstallBazooka()
	aui.PetTrackerOptions()
	aui.BrokerGarrisonOptions()
	aui.BrokerCurrencyOptions()
	aui.InstallBrokerMoneyFu()
	aui.InstallHandyNotes()
	aui.InstallMapster()
	aui:InstallSocialState()
	aui.InstallTinyDPS()
	aui.InstallZygorsGuideViewer()
end
	
local function SetScaleSmallOnInstall()
	local index = GetCurrentResolution();
	local resolution = select(index, GetScreenResolutions());
	if resolution ~= "1920x1080" then
		UIParent:SetScale(0.64);
		SetCVar("uiscale", "0.64");
		SetCVar("useUiScale", 1)
	end
end
			
local function SetCVARSINSTALL()
	SetCVar("enableCombatText", 1)
	SetCVar("CombatDamage", 1)
	SetCVar("CombatHealing", 1)
	SetCVar("alwaysShowActionBars", "1")
	SetCVar("alwaysCompareItems", "1")
	SetCVar("profanityFilter", "0")
	SetCVar("cameraSmoothStyle", "0")
	SetCVar("showNPETutorials", "0")
	SetCVar("fctSpellMechanics", "1")
	-- Sound
	SetCVar("Sound_EnableErrorSpeech", 0)
	-- Nameplates
	SetCVar("bloatTest", 0)
	SetCVar("bloatnameplates", 0)
	SetCVar("bloatthreat", 0)
	-- Screenshots
	SetCVar("screenshotFormat", "jpg")				-- JPG format
	SetCVar("screenshotQuality", "10")				-- Highest quality
	-- Help
	SetCVar("showGameTips", 0)						-- Turn off Loading Screen Tips
	SetCVar("showTutorials", 0)						-- Turn off Tutorials
	SetCVar("UberTooltips", 1)						-- Turn on Enhanced Tooltips
	SetCVar("scriptErrors", 0)						-- Turn on Display Lua Errors
	-- Controls
	SetCVar("deselectOnClick", 1)					-- Turn off Sticky Targeting (inverted)
	-- Combat
	SetCVar("displaySpellActivationOverlays", 1)	-- Turn on Spell Alerts
	SetCVar("spellActivationOverlayOpacity", 0.75)	-- Spell Alert Opacity
	-- Display
	SetCVar("emphasizeMySpellEffects", 0)			-- Turn off Emphasize My Spell Effects
	SetCVar("SpellTooltip_DisplayAvgValues", 0)		-- Turn off Display Points As Average
	-- Social
	SetCVar("chatBubbles", 0)						-- Turn off Chat Bubbles
	SetCVar("chatBubblesParty", 0)					-- Turn off Party Chat Bubbles
	SetCVar("chatStyle", "classic")					-- Chat Style = "Classic"
	SetCVar("conversationMode", "inline")			-- Conversation Mode = "In-line"
	-- Quests
	SetCVar("autoQuestWatch", 1)					-- Auto Track Quests
	-- Names
	SetCVar("UnitNameNPC", 1)						-- Turn on NPC Names
	SetCVar("UnitNamePlayerPVPTitle", 0)			-- Turn off PvP Player Titles
	SetCVar("UnitNameEnemyGuardianName", 1)			-- Turn on Enemy Pet Names
	SetCVar("UnitNameEnemyTotemName", 1)			-- Turn on Enemy Totem Names
	SetCVar("nameplateMotion", 1)					-- Stacking Nameplates
	-- Camera
	SetCVar("cameraYawSmoothSpeed", 210)
	SetCVar("cameraView", 1)						-- Camera Stlye
	SetCVar("cameraDistanceMax", 50)				-- Camera Max Distance
	SetCVar("cameraDistanceMaxFactor", 2)			-- Camera Follow Speed
	-- Quality of Life
	SetCVar("guildShowOffline", 0)					-- Hide Offline Guild Members
	SetCVar("profanityFilter", 0)					-- Turn off Profanity Filter
	-- Combat Text
	if IsAddOnLoaded("MikScrollingBattleText") then
		SetCVar("enableCombatText", 0)				-- Turn off Combat Text
		SetCVar("CombatDamage", 0)					-- Turn off Combat Text - Damage
		SetCVar("CombatHealing", 0)					-- Turn off Combat Text - Healing
	end
end
	
function aui.ApplySetup()  -- the Install button calls this when clicked.
    SetScaleSmallOnInstall()
	InstallAddonOptions()
	aegerUI.db.profile.SetUpDone = true
	SetCVARSINSTALL()
	aegerUI.db.profile.Version = aegerUI_Version
	aui.Print('Install complete. Please reload UI to finish via "/rl".')
end
end