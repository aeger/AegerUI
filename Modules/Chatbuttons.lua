--Namespace--------------------------------------------------------------

local FOLDER_NAME, private_data = ...

--Constants
local MEDIA_PATH = ([[Interface\AddOns\%s\Media\]]):format(FOLDER_NAME)
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
local FONT = "Fonts\\FRIZQT__.ttf"

--Define locals and local functions
local ChatButtonsFrame

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
		
		 local Chat1texture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 12)
	     Chat1texture:SetPoint("LEFT", UIParent, "LEFT", -5, 0)
	     Chat1texture:SetSize(370, 270)
	     Chat1texture:SetTexture(MEDIA_PATH .. "chat-b")		
	     Chat1texture:SetVertexColor(0, 0, 0, 0.5)
		 Chat1Frame.Chat1texture = Chat1texture
		 
		 local Chat1midtexture = CreateFrame("Button", nil, Chat1Frame)
		 Chat1midtexture:SetPoint("CENTER", Chat1texture, "CENTER")
	     Chat1midtexture:SetPoint("LEFT", Chat1texture, "LEFT")
	     Chat1midtexture:SetSize(30, 110)
	     Chat1midtexture:SetNormalTexture(MEDIA_PATH .. "QSB")
		 Chat1midtexture:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	     Chat1midtexture:SetScript("OnEnter", Button_OnEnter)
		 Chat1midtexture:SetScript("OnLeave", Button_OnLeave)
		 Chat1midtexture:RegisterForClicks('AnyUp')
		 Chat1midtexture:SetScript("OnClick", function(self, button)
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
		 
		 Chat1Frame.Chat1midtexture = Chat1midtexture
		 
		 local Chat1LBtexture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1LBtexture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	     Chat1LBtexture:SetPoint("LEFT", UIParent, "LEFT", 23, 0)
	     Chat1LBtexture:SetSize(130, 26)
	     Chat1LBtexture:SetTexture(MEDIA_PATH .. "LB-B")		
	     Chat1LBtexture:SetVertexColor(0, 0, 0, 0.5)
		 Chat1Frame.Chat1LBtexture = Chat1LBtexture
		 
		 local Chat1MBtexture = Chat1Frame:CreateTexture(nil, "BACKGROUND")
		 Chat1MBtexture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	     Chat1MBtexture:SetPoint("LEFT", Chat1LBtexture, "RIGHT")
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


