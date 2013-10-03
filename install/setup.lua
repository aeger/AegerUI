-------------------------------------------------------------------------------
--  aegerUI 5.4.5 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local _, aegerUI = ...
	aegerUI = LibStub("AceAddon-3.0"):NewAddon(aegerUI, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
	_G.aegerUI = aegerUI
	
	local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")
	
	local versionNumber  = "5.4.5";
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
    local DoSetup
    local SetupFrame
    local ApplySetup
	local aegerUI_MoveChatFrame1
	local aegerUI_InstallAddonOptions
		
--  Default DB data  -----------------------------------------------------------	
	local defaults = {
		global = {
          Placeholder = true,
		},
		profile = {
          Placeholder = true,        
		},
	}
	
	function aegerUI:OnInitialize()
	  self.db = LibStub("AceDB-3.0"):New("aegerUIdb", defaults)
	  self.db.RegisterCallback(self, "OnNewProfile", "InitializeProfile")
    end
	
	function aegerUI:InitializeProfile()
	aegerUI.db.profile.SetUpDone = false
	aegerUI.db.profile.TopMenuShow = true
	aegerUI.db.profile.NumBottomBars = 1
	aegerUI.db.profile.ShowBazBar = 1
	aegerUI.db.profile.SideBars = 1
	end
		
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
			
			if not aegerUI.db.profile.Version then
                    DoSetup()
            end
			if aegerUI.db.profile.Version ~= aegerUI_Version then
					DoSetup()
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
                    ApplySetup()
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
    function DoSetup()
            PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
            if not SetupFrame then  -- the SetupFrame hasnt been created
                    InitSetupFrame()
            end
            SetupFrame:Show()
    end
	
    function aegerUI_MoveChatFrame1()
            FCF_SetLocked(ChatFrame1, 1)
		    ChatFrame1:ClearAllPoints()
            ChatFrame1:SetHeight(160)	
            ChatFrame1:SetWidth(380)
            ChatFrame1:SetPoint('BOTTOMLEFT',UIParent,'BOTTOMLEFT',30,37)
            ChatFrame1:SetUserPlaced(true);
		    FCF_SavePositionAndDimensions(ChatFrame1)
    end
	
	function aegerUI_InstallAddonOptions()
			aegerUI_MoveChatFrame1()
			aegerUI:InstallAanye_XP()
			aegerUI:InstallBartender()
			aegerUI:BagSyncOptions()
			aegerUI:InstallBazooka()
			aegerUI:InstallBrokerDurability()
			aegerUI:InstallBrokerMicroMenu()
			aegerUI:InstallBrokerMoneyFu()
			aegerUI:InstallExtSocialUI()
			aegerUI:InstallExtVendor()
			aegerUI:InstallFarmhand()
			aegerUI:InstallGatherMate2()
			aegerUI:InstallMasque()
			aegerUI:InstallParrot()
			aegerUI:InstallPhanxBuffs()
			aegerUI:InstallPrat()
			aegerUI:InstallQuestUnTracker()
			aegerUI:InstallSocialState()
			aegerUI:InstallTinyDPS()
			aegerUI:InstallTotemTimers()
			aegerUI:ZygorsGuideViewer()
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
	
	function aegerUI_SetScaleSmall()
		UIParent:SetScale(0.64);
		SetCVar("uiscale", "0.64");
		SetCVar("useUiScale", 1);
	end
	
	function aegerUI_SetScaleNormal()
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
	
	function aegerUI_SetNumBottomBars()
		Bartender4.db:SetProfile("aegerUI")
		--if not aegerUI.db.profile.NumBottomBars then
			--aegerUI.db.profile.NumBottomBars = 1
			--Bartender4.Bar.barregistry["6"]:SetVisibilityOption("always",true)
           -- Bartender4.Bar.barregistry["5"]:SetVisibilityOption("always",true)
		--end
		if aegerUI.db.profile.NumBottomBars == 1 then
			aegerUI.db.profile.NumBottomBars = 1
		elseif aegerUI.db.profile.NumBottomBars == 2 then
			aegerUI.db.profile.NumBottomBars = 2
		end	
	end 
	
	function aegerUI_SetTopMenuVisible()
		if not aegerUI.db.profile.TopMenuShow and aegerUI.db.profile.TopMenuShow ~= false then
			aegerUI.db.profile.TopMenuShow = true
		end
		if aegerUI.db.profile.TopMenuShow == false then
				TMMenuHide()
				HideBazookaBars()
		end
	end
	
	function aegerUI_SetBazBarDisplayNum()
		if not aegerUI.db.profile.ShowBazBar then
			aegerUI.db.profile.ShowBazBar = 1
			Bazooka.db:SetProfile("BazBar1")
		end
		if aegerUI.db.profile.ShowBazBar == 1 then
			aegerUI.db.profile.ShowBazBar = 1
			Bazooka.db:SetProfile("BazBar1")
		elseif aegerUI.db.profile.ShowBazBar == 2 then
			aegerUI.db.profile.ShowBazBar = 2
			Bazooka.db:SetProfile("BazBar2")
		elseif aegerUI.db.profile.ShowBazBar == 3 then
			aegerUI.db.profile.ShowBazBar = 3
			Bazooka.db:SetProfile("BazBar3")
		elseif aegerUI.db.profile.ShowBazBar == 4 then
			aegerUI.db.profile.ShowBazBar = 4
			Bazooka.db:SetProfile("BazBar4")
		end
	end
	
	function aegerUI_SetSideBars()
		if not aegerUI.db.profile.SideBars then
			aegerUI.db.profile.SideBars = 1
		end
		if aegerUI.db.profile.SideBars == 1 then
			aegerUI.db.profile.SideBars = 1
		elseif aegerUI.db.profile.SideBars == 2 then
			aegerUI.db.profile.SideBars = 2
		elseif aegerUI.db.profile.SideBars ==3 then
			aegerUI.db.profile.SideBars = 3
		end
	end	
				
	aegerUI_Version = aegerUI_SetVersion( versionNumber );
	
	function ApplySetup()  -- the Install button calls this when clicked.
            aegerUI_SetScaleSmallOnInstall()
			aegerUI_InstallAddonOptions()
			aegerUI.db.profile.SetUpDone = true
			aegerUI_SetTopMenuVisible()
			aegerUI_SetNumBottomBars()
			aegerUI_SetBazBarDisplayNum()
			aegerUI_SetSideBars()
			aegerUI.db.profile.Version = aegerUI_Version
			print('Setup complete. Please reload UI to finish via "/rl".')
    end
		
--  Slash Commands  -----------------------------------------------------------	
    SlashCmdList.INSTALLAEGERUI = function()
            DoSetup()
    end
    SLASH_INSTALLAEGERUI1 = '/install'
	
	SlashCmdList.AEGERUISETSMALLSCALE = function()
            aegerUI_SetScaleSmall()
    end
    SLASH_AEGERUISETSMALLSCALE1 = '/auiscale1'
	
	SlashCmdList.AEGERUISETLARGESCALE = function()
            aegerUI_SetScaleNormal()
    end
    SLASH_AEGERUISETLARGESCALE1 = '/auiscale2'