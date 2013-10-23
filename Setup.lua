-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
		
	local versionNumber  = "5.4.7";
	
	local aegerUI_PersonalProfiles = true
	
	AUI_Beta = false;
				
--  Constants  ----------------------------------------------------------------
    local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
    local FONT = "Fonts\\FRIZQT__.ttf"
	     
    local TEXT = {
            Install = L["Install"],
            Cancel = L["Cancel"],
			Reload = L["Reload"],
    }

-- Define locals and local functions up here so they're in scope for the whole file
    local InitSetupFrame
    local SetupFrame
    local aegerUI_MoveChatFrame1
	local aegerUI_InstallAddonOptions
			
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
			if addon.db.profile.SetUpDone == false then
                    addon:DoSetup()
            end
			if addon.db.profile.Version ~= aegerUI_Version then
					addon:DoSetup()
			end
    end
		
--  Setup frame  ------------------------------------------------------------------
    function InitSetupFrame()  -- This is local. See "constants".
            -- The SetupFrame isn't created at all until it's needed.
            -- This function is called elsewhere to initiate the setup process.
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
            aegerLogo:SetTexture(MEDIA_PATH .. "textures\\aegerUIlogo")
			
			--------------------
            -- RELOAD Button  --
            --------------------
			
			local ReloadButton = CreateFrame("Button", nil, SetupFrame)
			ReloadButton:SetPoint("TOP", SetupFrame, "BOTTOM")
            ReloadButton:SetPoint("LEFT", SetupFrame, "LEFT")
            ReloadButton:SetSize(153, 56)
            ReloadButton:SetNormalTexture(MEDIA_PATH .. "textures\\reloadbtn")
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
            ReloadText:SetText(TEXT.Reload)
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
            SetupButton:SetNormalTexture(MEDIA_PATH .. "textures\\setupButton")
            SetupButton:SetScript("OnEnter", BigButton_OnEnter)
            SetupButton:SetScript("OnLeave", Button_OnLeave)
            SetupButton:SetScript("OnClick", function(self)
                    addon:ApplySetup()
                    self:Hide()
					ReloadButton:Show()
            end)
            SetupFrame.SetupButton = SetupButton
     
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
     
            local CancelButton = CreateFrame("Button", nil, SetupFrame)
            CancelButton:SetPoint("TOP", SetupFrame, "BOTTOM")
            CancelButton:SetPoint("RIGHT", SetupFrame, "RIGHT")
            CancelButton:SetSize(153, 56)
            CancelButton:SetNormalTexture(MEDIA_PATH .. "textures\\setupButton")
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
            CancelText:SetText(TEXT.Cancel)
            CancelButton:SetFontString(CancelText)
	end
         
--  Core logic  ---------------------------------------------------------------
    function addon:DoSetup()
            PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
            if not SetupFrame then  -- the SetupFrame hasnt been created
                    InitSetupFrame()
            end
            SetupFrame:Show()
    end
	
    function addon:MoveChatFrame1Bottom()
            FCF_SetLocked(ChatFrame1, 1)
		    ChatFrame1:ClearAllPoints()
            ChatFrame1:SetHeight(160)	
            ChatFrame1:SetWidth(380)
            ChatFrame1:SetPoint('BOTTOMLEFT',UIParent,'BOTTOMLEFT',30,37)
            ChatFrame1:SetUserPlaced(true);
		    FCF_SavePositionAndDimensions(ChatFrame1)
    end
	
	function addon:MoveChatFrame1Top()
            FCF_SetLocked(ChatFrame1, 1)
		    ChatFrame1:ClearAllPoints()
            ChatFrame1:SetHeight(160)	
            ChatFrame1:SetWidth(380)
            ChatFrame1:SetPoint('TOPLEFT',UIParent,'TOPLEFT',30, -50)
            ChatFrame1:SetUserPlaced(true);
		    FCF_SavePositionAndDimensions(ChatFrame1)
    end
	
	function addon:ChatFrameInstall()
		if addon.db.global.ChatFrame_Position == "BOTTOM" then
			addon:MoveChatFrame1Bottom()
		elseif
		addon.db.global.ChatFrame_Position == "TOP" then
			addon:MoveChatFrame1Top()
		end
	end
	
	function aegerUI_InstallAddonOptions()
			addon:ChatFrameInstall()
			addon:InstallAanye_XP()
			addon:InstallBartender()
			addon:BagSyncOptions()
			addon:InstallBazooka()
			addon:InstallBrokerDurability()
			addon:InstallBrokerMicroMenu()
			addon:InstallBrokerMoneyFu()
			addon:InstallCombuctor()
			addon:InstallExtSocialUI()
			addon:InstallExtVendor()
			addon:InstallFarmhand()
			addon:InstallGatherMate2()
			addon:InstallHandyNotes()
			addon:InstallMapster()
			addon:InstallMasque()
			addon:InstalloUF_Phanx()
			addon:InstallParrot()
			addon:InstallPrat()
			addon:InstallQuestUnTracker()
			addon:InstallSocialState()
			addon:InstallTinyDPS()
			addon:InstallTipTac()
			addon:InstallTotemTimers()
			addon:ZygorsGuideViewer()
	end
	
	function aegerUI_SetScaleSmallOnInstall()
		local index = GetCurrentResolution();
		local resolution = select(index, GetScreenResolutions());
			if resolution ~= "1920x1080" then
				UIParent:SetScale(0.64);
				SetCVar("uiscale", "0.64");
				SetCVar("useUiScale", 1)
			end
	end
	
	function addon:SetScaleSmall()
		UIParent:SetScale(0.64);
		SetCVar("uiscale", "0.64");
		SetCVar("useUiScale", 1);
	end
	
	function addon:SetScaleNormal()
		UIParent:SetScale(1.0);
		SetCVar("uiscale", "1.0");
		SetCVar("useUiScale", 0);
	end
	
	function aegerUI_SetVersion( version )
		if AUI_Beta then return version.." (Beta)";
			else
		return version.." (Release)";
		end
	end
			
	function aegerUI_SetCVARSINSTALL()
		SetCVar("enableCombatText", 0)
		SetCVar("CombatDamage", 0)
		SetCVar("CombatHealing", 0)
	end
	
	function aegerUI_LoadPersonalAddonProfiles()
		if not aegerUI_PersonalProfiles then end
			aegerUI:InstallMounty()
	end
						
	aegerUI_Version = aegerUI_SetVersion( versionNumber );
	
	function addon:ApplySetup()  -- the Install button calls this when clicked.
            aegerUI_SetScaleSmallOnInstall()
			aegerUI_InstallAddonOptions()
			aegerUI_LoadPersonalAddonProfiles()
			addon.db.profile.SetUpDone = true
			aegerUI_SetCVARSINSTALL()
			addon.db.profile.Version = aegerUI_Version
			print('Setup complete. Please reload UI to finish via "/rl".')
    end