-------------------------------------------------------------------------------
--  aegerUI 5.4.2 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
    local addonname, aegerUI = ...

--  Constants  ----------------------------------------------------------------
    local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
    local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
    local FONT = "Fonts\\FRIZQT__.ttf"

-- Define locals and local functions up here so they're in scope for the whole file
    local ChatButtonsFrame
	local Chat1LBtext
	local Chat1MBtext
	local Chat1RBtext

--  Event logic  --------------------------------------------------------------
	local ChatButtonsEvent = CreateFrame('Frame')

	ChatButtonsEvent:RegisterEvent('PLAYER_LOGIN')

	ChatButtonsEvent:SetScript('OnEvent',function(self, event_name, ...)
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
	function ChatButtonsEvent:PLAYER_LOGIN()
	  Chat1Display()       
	end
	
--  Chat buttons frame  ----------------------------------------------------------------

	function ChatButtonsFrame()  
	     Chat1Frame = CreateFrame('Frame', nil, UIParent)
	     		 
		 local function Button_OnEnter(self)
           self:GetNormalTexture():SetVertexColor(1, 1, 1)
         end
     
          local function Button_OnLeave(self)
            self:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
          end
		  
		  local function Button1_OnEnter(self)
            self:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  end
		  
		  local function Button1_OnLeave(self)
            self:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  end
		  		  		
		  local Chat1texture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		  Chat1texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 12)
	      Chat1texture:SetPoint("LEFT", UIParent, "LEFT", -5, 0)
	      Chat1texture:SetSize(370, 270)
	      Chat1texture:SetTexture(MEDIA_PATH .. "textures\\chat-b")		
	      Chat1texture:SetVertexColor(0, 0, 0, 0.5)
		  Chat1Frame.Chat1texture = Chat1texture
		 
		  local Chat1midButton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1midButton:SetPoint("CENTER", Chat1texture, "CENTER")
	      Chat1midButton:SetPoint("LEFT", Chat1texture, "LEFT")
	      Chat1midButton:SetSize(30, 110)
	      Chat1midButton:SetNormalTexture(MEDIA_PATH .. "textures\\QSB")
		  Chat1midButton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	      Chat1midButton:SetScript("OnEnter", Button_OnEnter)
		  Chat1midButton:SetScript("OnLeave", Button_OnLeave)
		  Chat1midButton:RegisterForClicks('AnyUp')
		  Chat1midButton:SetScript("OnClick", function(self, button)
            if button == "LeftButton" then
                if TMMenuFrame:IsVisible() then
                        TMMenuHide()
                        HideBazookaBar1()
                        aegerUIdb.TMShow = nil
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                else
                        TMMenuDisplay()
                        ShowBazookaBar1()
                        aegerUIdb.TMShow = true
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                end
            elseif button == "RightButton" then
                if aegerUIdb.BottomBars == 1 then
                        Bartender4.db:SetProfile("aegerUI2bar")
                        aegerUIdb.BottomBars = 2
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                        Bbar2Display()
                        Bbar1Hide()
                elseif aegerUIdb.BottomBars == 2 then
                        Bartender4.db:SetProfile("aegerUI1bar")
                        aegerUIdb.BottomBars = 1
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                        Bbar1Display()
                        Bbar2Hide()
                    end
                end
             end)
		 
		  Chat1Frame.Chat1midButton = Chat1midButton
		 
		  local Chat1LBbutton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1LBbutton:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	      Chat1LBbutton:SetPoint("LEFT", UIParent, "LEFT", 23, 0)
	      Chat1LBbutton:SetSize(130, 26)
	      Chat1LBbutton:SetNormalTexture(MEDIA_PATH .. "textures\\LB")
          Chat1LBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
         
		  Chat1LBbutton:RegisterForClicks('AnyUp')
		  Chat1LBbutton:SetScript("OnClick", function(self, button)
		    if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
              ToggleEncounterJournal()
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
              PVEFrame_ToggleFrame()
            else
              ToggleCharacter("PaperDollFrame")
            end
		  end)
		 
		  Chat1Frame.Chat1LBbutton = Chat1LBbutton	
		 		 
		  local Chat1LBtext = Chat1LBbutton:CreateFontString(nil, "OVERLAY")
		  Chat1LBtext:SetPoint("LEFT")
		  Chat1LBtext:SetPoint("RIGHT")
		  Chat1LBtext:SetFont(FONT, 10, "OUTLINE")
		  Chat1LBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1LBtext:SetText("Character")
		  Chat1LBbutton:SetScript("OnEnter", function(self, button)
		  Chat1LBbutton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1LBtext:SetTextColor(1,1,1)
		  end)
		  Chat1LBbutton:SetScript("OnLeave", function(self, button)
		  Chat1LBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1LBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  end)
		 
		  Chat1LBbutton:SetScript("OnUpdate", function(self)
		   if InCombatLockdown() then return end
           if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
             Chat1LBtext:SetText("Dungeon Journal")
           elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
             Chat1LBtext:SetText("LFD")
           else
             Chat1LBtext:SetText("Character")
            end 
		  end)
		  Chat1LBbutton:SetFontString(Chat1LBtext)
		 
		  local Chat1MBbutton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1MBbutton:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	      Chat1MBbutton:SetPoint("LEFT", Chat1LBbutton, "RIGHT")
	      Chat1MBbutton:SetSize(130, 26)
	      Chat1MBbutton:SetNormalTexture(MEDIA_PATH .. "textures\\MB")		
	      Chat1MBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1MBbutton:RegisterForClicks('AnyUp')
		  Chat1MBbutton:SetScript("OnClick", function(self, button)
		    if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
                ToggleFrame(QuestLogFrame)
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
                TogglePetJournal()
            else
                ToggleFrame(SpellBookFrame)
            end
          end)
		 
		  Chat1Frame.Chat1MBbutton = Chat1MBbutton
		 
		  local Chat1MBtext = Chat1MBbutton:CreateFontString(nil, "OVERLAY")
		  Chat1MBtext:SetPoint("LEFT")
		  Chat1MBtext:SetPoint("RIGHT")
		  Chat1MBtext:SetFont(FONT, 10, "OUTLINE")
		  Chat1MBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1MBtext:SetText("Spell Book")
		  Chat1MBbutton:SetScript("OnEnter", function(self, button)
		  Chat1MBbutton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1MBtext:SetTextColor(1,1,1)
		  end)
		  Chat1MBbutton:SetScript("OnLeave", function(self, button)
		  Chat1MBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1MBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  end)
		 
		  Chat1MBbutton:SetScript("OnUpdate", function(self)
		    if InCombatLockdown() then return end
            if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
              Chat1MBtext:SetText("Quest Log")
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
              Chat1MBtext:SetText("Mounts and Pets")
            else
              Chat1MBtext:SetText("Spell Book")
            end
		  end)
		  Chat1MBbutton:SetFontString(Chat1MBtext)
		 
		  local Chat1RBbutton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1RBbutton:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	      Chat1RBbutton:SetPoint("LEFT", Chat1MBbutton, "RIGHT")
	      Chat1RBbutton:SetSize(130, 26)
	      Chat1RBbutton:SetNormalTexture(MEDIA_PATH .. "textures\\RB")		
	      Chat1RBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1RBbutton:RegisterForClicks('AnyUp')
		  Chat1RBbutton:SetScript("OnClick", function(self, button)
		    if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
              ToggleAchievementFrame()
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
            if not IsAddOnLoaded("Blizzard_PVPUI") then
              LoadAddOn("Blizzard_PVPUI")
            end
              PVPUIFrame_ToggleFrame()
            else
              ToggleTalentFrame()
             end
		  end)
		  Chat1Frame.Chat1RBbutton = Chat1RBbutton
		 
		  local Chat1RBtext = Chat1RBbutton:CreateFontString(nil, "OVERLAY")
		  Chat1RBtext:SetPoint("LEFT")
		  Chat1RBtext:SetPoint("RIGHT")
		  Chat1RBtext:SetFont(FONT, 10, "OUTLINE")
		  Chat1RBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1RBtext:SetText("Talents")
		  Chat1RBbutton:SetScript("OnEnter", function(self, button)
		  Chat1RBbutton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1RBtext:SetTextColor(1,1,1)
		  end)
		  Chat1RBbutton:SetScript("OnLeave", function(self, button)
		  Chat1RBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1RBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  end)
		  Chat1RBbutton:SetScript("OnUpdate", function(self)
		    if InCombatLockdown() then return end
            if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
              Chat1RBtext:SetText("Achievements")
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
              Chat1RBtext:SetText("PVP")
            else
              Chat1RBtext:SetText("Talents")
            end
		  end)
		 Chat1RBbutton:SetFontString(Chat1RBtext)
         end

--  Core logic  ---------------------------------------------------------------
    function Chat1Display()
	  if not Chat1Frame then
	    ChatButtonsFrame() 
	  end
	    Chat1Frame:Show()
    end