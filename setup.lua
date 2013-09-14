	

    -- WARNING: name your saved variable and slash command something unique. I changed it to MYMOD_SetupDone, and INSTALLMYMOD
    -- If it's a generic name, another addon could end up overwriting it and breaking things.
     
     
    --Namespace------------------------------------------------------------------
    local FOLDER_NAME, private_data = ...
     
     
    --Constants------------------------------------------------------------------
    local MEDIA_PATH = ([[Interface\AddOns\%s\Media\]]):format(FOLDER_NAME)
    local MASQUE = LibStub("Masque", true)
	local buttongroup
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
			
			Bagnon = function(addon_obj1)
			         addon_obj1.SavedFrameSettings:SetItemFrameColumns(10)
			        --local num_columns = addon_obj1.BagnonFrameSettings
					--num_columns:itemFrameColumns(10)
					
			end,
			
			--MASQUE = function(addon_obj1)
			        --addon_obj1.buttongroup:Group("CleanUI")
					--end,
    }
     
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
            aegerLogo:SetTexture(MEDIA_PATH .. "aegerUIlogo")
			
			--------------------
            -- RELOAD Button  --
            --------------------
			
			local ReloadButton = CreateFrame("Button", nil, SetupFrame)
			ReloadButton:SetPoint("TOP", SetupFrame, "BOTTOM")
            ReloadButton:SetPoint("LEFT", SetupFrame, "LEFT")
            ReloadButton:SetSize(153, 56)
            ReloadButton:SetNormalTexture(MEDIA_PATH .. "reloadbtn")
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
            SetupButton:SetNormalTexture(MEDIA_PATH .. "setupButton")
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
            CancelButton:SetNormalTexture(MEDIA_PATH .. "setupButton")
            CancelButton:SetScript("OnEnter", BigButton_OnEnter)
            CancelButton:SetScript("OnLeave", Button_OnLeave)
            CancelButton:SetScript("OnClick", function(this)
                    PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
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
    local function SetProfiles()
            for addon_name, profile_func in pairs(ADDON_PROFILE_ASSIGNMENTS) do
                    if IsAddOnLoaded(addon_name) then
                            profile_func(_G[addon_name])
                    end
            end
    end
     
    function DoSetup()
            PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
            if not SetupFrame then  -- the SetupFrame hasnt been created
                    InitSetupFrame()
            end
            SetupFrame:Show()
    end
     
    function ApplySetup()  -- the OK button calls this when clicked.
            SetProfiles()
            aegerUI_Bbars = 1
			aegerUI_TMShow = true
			aegerUI_SetupDone = true  -- Your saved variable. ONLY set this true here, when you KNOW setup has been successfully performed.
            print('Setup complete. Please reload UI to finish via "/rl".')  -- Never force a reload on a user.
    end
     
    SlashCmdList.INSTALLAEGERUI = function()
            DoSetup()
    end
    SLASH_INSTALLAEGERUI1 = '/install'

