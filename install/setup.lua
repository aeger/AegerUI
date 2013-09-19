	--Namespace------------------------------------------------------------------
    local addonname, aegerUI = ...
	
	local AceAddon = LibStub("AceAddon-3.0")
		
	_G.aegerUI = aegerUI
         
    --Constants------------------------------------------------------------------
    local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
    local FONT = "Fonts\\FRIZQT__.ttf"
	     
    local TEXT = {
            Install = "Install",
            Cancel = "Cancel",
			Reload = "Reload",
    }
     
    -- Define locals and local functions up here so they're in scope for the whole file
    local InitSetupFrame
    local DoSetup
    local SetupFrame
    local ApplySetup
	local aegerUI_MoveChatFrame1
     
     
    --Event logic-------
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
     
     
    -- Events---------
    function EventFrame:PLAYER_LOGIN()
            if not aegerUI_SetupDone then
                    DoSetup()
            end
    end
     
     
    -- Setup frame
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
         
    -- Core logic
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
	
	function ApplySetup()  -- the Install button calls this when clicked.
            aegerUI_MoveChatFrame1()
			aegerUI:InstallAanye_XP()
			aegerUI:InstallBartender1()
			aegerUI:InstallBartender2()
			aegerUI:BagSyncOptions()
			aegerUI:InstallBazooka()
			aegerUI:InstallBrokerDurability()
			aegerUI:InstallBrokerMicroMenu()
			aegerUI:InstallBrokerMoneyFu()
			aegerUI:InstallCloudyTooltip()
			aegerUI:InstallExtSocialUI()
			aegerUI:InstallExtVendor()
			aegerUI:InstallFarmhand()
			aegerUI:InstallGatherMate2()
			aegerUI:InstallLeatrix_Plus()
			aegerUI:InstallMasque()
			aegerUI:InstallParrot()
			aegerUI:InstallPhanxBuffs()
			aegerUI:InstallPrat()
			aegerUI:InstallSocialState()
			aegerUI:InstallTinyDPS()
			aegerUI:InstallTotemTimers()
			aegerUI:ZygorsGuideViewer()
			aegerUI_Bbars = 1
			aegerUI_TMShow = true
			aegerUI_SetupDone = true  
            print('Setup complete. Please reload UI to finish via "/rl".')
    end
     
    SlashCmdList.INSTALLAEGERUI = function()
            DoSetup()
    end
    SLASH_INSTALLAEGERUI1 = '/install'