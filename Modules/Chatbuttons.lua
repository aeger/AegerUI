--Namespace--------------------------------------------------------------

local FOLDER_NAME, private_data = ...

--Constants
local MEDIA_PATH = ([[Interface\AddOns\%s\Media\]]):format(FOLDER_NAME)
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
local FONT = "Fonts\\FRIZQT__.ttf"

--Define locals and local functions
local ChatButtonsFrame
local Chat1LBtext

--Event logic--------------------------------------------------------------
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
	
--Events---------------------------------------------------------------------=
function ChatButtonsEvent:PLAYER_LOGIN()
  Chat1Display()       
end

function ChatButtonsFrame()  
	     Chat1Frame = CreateFrame('Frame', nil, UIParent)
	     Chat1Frame:SetPoint("BOTTOM", UIParent, "BOTTOM", -4, 3)
		 Chat1Frame:SetPoint("LEFT", UIParent, "LEFT")
		 Chat1Frame:SetSize(370, 290)
		 
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
		  
		  local function textDark_OnEnter(self)
            self:SetTextColor(1,1,1)
          end
		
		local function textCC_OnLeave(self)
            self:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
          end
		
		 local Chat1texture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 12)
	     Chat1texture:SetPoint("LEFT", UIParent, "LEFT", -5, 0)
	     Chat1texture:SetSize(370, 270)
	     Chat1texture:SetTexture(MEDIA_PATH .. "chat-b")		
	     Chat1texture:SetVertexColor(0, 0, 0, 0.5)
		 Chat1Frame.Chat1texture = Chat1texture
		 
		 local Chat1midButton = CreateFrame("Button", nil, Chat1Frame)
		 Chat1midButton:SetPoint("CENTER", Chat1texture, "CENTER")
	     Chat1midButton:SetPoint("LEFT", Chat1texture, "LEFT")
	     Chat1midButton:SetSize(30, 110)
	     Chat1midButton:SetNormalTexture(MEDIA_PATH .. "QSB")
		 Chat1midButton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	     Chat1midButton:SetScript("OnEnter", Button_OnEnter)
		 Chat1midButton:SetScript("OnLeave", Button_OnLeave)
		 Chat1midButton:RegisterForClicks('AnyUp')
		 Chat1midButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
                if TMMenuFrame:IsVisible() then
                        TMMenuHide()
                        HideBazookaBar1()
                        aegerUI_TMShow = nil
                        PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
                else
                        TMMenuDisplay()
                        ShowBazookaBar1()
                        aegerUI_TMShow = true
                        PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
                end
        elseif button == "RightButton" then
                if aegerUI_Bbars == 1 then
                        Bartender4.db:SetProfile("aegerUI2bar")
                        aegerUI_Bbars = 2
                        PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
                        Bbar2Display()
                        Bbar1Hide()
                elseif aegerUI_Bbars == 2 then
                        Bartender4.db:SetProfile("aegerUI1bar")
                        aegerUI_Bbars = 1
                        PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
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
	     Chat1LBbutton:SetNormalTexture(MEDIA_PATH .. "LB-B")
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
		 
		 local Chat1MBtexture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1MBtexture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	     Chat1MBtexture:SetPoint("LEFT", Chat1LBbutton, "RIGHT")
	     Chat1MBtexture:SetSize(130, 26)
	     Chat1MBtexture:SetTexture(MEDIA_PATH .. "MB")		
	     Chat1MBtexture:SetVertexColor(0, 0, 0, 0.5)
		 Chat1Frame.Chat1MBtexture = Chat1MBtexture
		 
		 local Chat1RBtexture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1RBtexture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	     Chat1RBtexture:SetPoint("LEFT", Chat1MBtexture, "RIGHT")
	     Chat1RBtexture:SetSize(130, 26)
	     Chat1RBtexture:SetTexture(MEDIA_PATH .. "RB-B")		
	     Chat1RBtexture:SetVertexColor(0, 0, 0, 0.5)
		 Chat1Frame.Chat1RBtexture = Chat1RBtexture
end

-- Core logic ------------------------------------------------------------------------
function Chat1Display()
	  if not Chat1Frame then
	    ChatButtonsFrame() 
	  end
	  Chat1Frame:Show()
end


