local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
local FONT = "Fonts\\FRIZQT__.ttf"
	
	local ChatButtonsFrame
	local Chat1LBtext
	local Chat1MBtext
	local Chat1RBtext
	
function aegerUI_BottomButtons:OnEnable()
Chat1Frame = CreateFrame('Frame', nil, UIParent)
	     		 
		 local function Button_OnEnter(self)
			local _, class = UnitClass("player");
				if class == "PRIEST" then
					self:GetNormalTexture():SetVertexColor(0, 1, 0)
				else
					self:GetNormalTexture():SetVertexColor(1, 1, 1)
				end
		   
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
	      Chat1texture:SetSize(370, 220)
	      Chat1texture:SetTexture(MEDIA_PATH .. "BottomButtons\\chat-b")		
	      Chat1texture:SetVertexColor(0, 0, 0, 0.5)
		  Chat1Frame.Chat1texture = Chat1texture
		 
		  local Chat1midButton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1midButton:SetPoint("CENTER", Chat1texture, "CENTER")
	      Chat1midButton:SetPoint("LEFT", Chat1texture, "LEFT")
	      Chat1midButton:SetSize(30, 110)
	      Chat1midButton:SetNormalTexture(MEDIA_PATH .. "BottomButtons\\QSB")
		  Chat1midButton:GetNormalTexture():SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	      Chat1midButton:SetScript("OnEnter", Button_OnEnter)
		  Chat1midButton:SetScript("OnLeave", Button_OnLeave)
		  Chat1midButton:RegisterForClicks('AnyUp')
		  Chat1midButton:SetScript("OnClick", function(self, button)
            if button == "LeftButton" then
                if InCombatLockdown() then
					print("Cannot toggle TopMenu during combat.")
					return
				end
				if TMMenuFrame:IsVisible() then
                        TMMenuHide()
                        HideBazookaBars()
                        aegerUI.db.profile.TopMenuShow = false
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                else
                        TMMenuDisplay()
                        if aegerUI.db.profile.ShowBazBar == 1 then
							ShowBazookaBar1()
						elseif
						aegerUI.db.profile.ShowBazBar == 2 then
							ShowBazookaBar2()
						elseif
						aegerUI.db.profile.ShowBazBar == 3 then
							ShowBazookaBar3()
						elseif
						aegerUI.db.profile.ShowBazBar == 4 then
							ShowBazookaBar4()
						end
                        aegerUI.db.profile.TopMenuShow = true
                        PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
                end
            end
			end)
		 
		  Chat1Frame.Chat1midButton = Chat1midButton
		 
		  local Chat1LBbutton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1LBbutton:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	      Chat1LBbutton:SetPoint("LEFT", UIParent, "LEFT", 23, 0)
	      Chat1LBbutton:SetSize(130, 26)
	      Chat1LBbutton:SetNormalTexture(MEDIA_PATH .. "BottomButtons\\LB")
          Chat1LBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
         
		  Chat1LBbutton:RegisterForClicks('AnyUp')
		  Chat1LBbutton:SetScript("OnClick", function(self, button)
		    if InCombatLockdown() then
				print("Cannot toggle Menu's during combat.")
				return
			end
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
	      Chat1MBbutton:SetNormalTexture(MEDIA_PATH .. "BottomButtons\\MB")		
	      Chat1MBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1MBbutton:RegisterForClicks('AnyUp')
		  Chat1MBbutton:SetScript("OnClick", function(self, button)
		    if InCombatLockdown() then
				print("Cannot toggle Menu's during combat.")
				return
			end
			if IsControlKeyDown() and not IsShiftKeyDown() and not IsAltKeyDown() then
                ToggleFrame(QuestLogFrame)
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
                ToggleFrame(SpellBookFrame)
            else
                TogglePetJournal()
            end
          end)
		 
		  Chat1Frame.Chat1MBbutton = Chat1MBbutton
		 
		  local Chat1MBtext = Chat1MBbutton:CreateFontString(nil, "OVERLAY")
		  Chat1MBtext:SetPoint("LEFT")
		  Chat1MBtext:SetPoint("RIGHT")
		  Chat1MBtext:SetFont(FONT, 10, "OUTLINE")
		  Chat1MBtext:SetTextColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		  Chat1MBtext:SetText("Mounts and Pets")
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
              Chat1MBtext:SetText("QuestLog")
            elseif IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
              Chat1MBtext:SetText("Spell Book")
            else
              Chat1MBtext:SetText("Mounts and Pets")
            end
		  end)
		  Chat1MBbutton:SetFontString(Chat1MBtext)
		 
		  local Chat1RBbutton = CreateFrame("Button", nil, Chat1Frame)
		  Chat1RBbutton:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -5)
	      Chat1RBbutton:SetPoint("LEFT", Chat1MBbutton, "RIGHT")
	      Chat1RBbutton:SetSize(130, 26)
	      Chat1RBbutton:SetNormalTexture(MEDIA_PATH .. "BottomButtons\\RB")		
	      Chat1RBbutton:GetNormalTexture():SetVertexColor(0, 0, 0, 0.5)
		  Chat1RBbutton:RegisterForClicks('AnyUp')
		  Chat1RBbutton:SetScript("OnClick", function(self, button)
		    if InCombatLockdown() then
				print("Cannot toggle Menu's during combat.")
				return
			end
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