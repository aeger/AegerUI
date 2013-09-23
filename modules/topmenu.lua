-------------------------------------------------------------------------------
--  aegerUI 5.4.3 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
    	
--  Constants  ----------------------------------------------------------------
	local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]    
	local FONT = "Fonts\\FRIZQT__.ttf"

-- Define locals and local functions up here so they're in scope for the whole file
	local InitTMMenuFrame
	local TMCombatColorOn
	local TMCombatColorOff
	local flip

--  Event logic  --------------------------------------------------------------
	local TMEventFrame = CreateFrame('Frame')

	TMEventFrame:RegisterEvent('PLAYER_LOGIN')
	TMEventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
	TMEventFrame:RegisterEvent('PLAYER_REGEN_DISABLED')

	TMEventFrame:SetScript('OnEvent',function(self, event_name, ...)
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
    function TMEventFrame:PLAYER_LOGIN()
             if aegerUI.db.profile.TopMenuShow then
			 if aegerUI.db.profile.ShowBazBar == 1 then
					TMMenuDisplay()
					ShowBazookaBar1()
			 elseif
			    aegerUI.db.profile.ShowBazBar == 3 then
					TMMenuDisplay()
					ShowBazookaBar3()
			 elseif
				aegerUI.db.profile.ShowBazBar == 4 then
					TMMenuDisplay()
					ShowBazookaBar4()
			 end
			 else
				TMMenuHide()
				HideBazookaBars()
			 end
	end	
	
	function TMEventFrame:PLAYER_REGEN_ENABLED()
             TMCombatColorOff()
    end
	
	function TMEventFrame:PLAYER_REGEN_DISABLED()
             TMCombatColorOn()
    end
	
--  Top Menu frame  --------------------------------------------------------------

	function InitTMMenuFrame()
         TMMenuFrame = CreateFrame('Frame', nil, UIParent)
		 TMMenuFrame:SetPoint("TOP", UIParent, "TOP", 0, 10)
		 TMMenuFrame:SetPoint("CENTER", UIParent, "CENTER")
		 TMMenuFrame:SetSize(502, 46)
		 
		 local TMMenuTexture = TMMenuFrame:CreateTexture(nil, "BACKGROUND")
		 TMMenuTexture:SetPoint("TOP", UIParent, "TOP", 0, 10)
		 TMMenuTexture:SetPoint("CENTER", UIParent, "CENTER")
		 TMMenuTexture:SetSize(500, 36)
		 TMMenuTexture:SetTexture(MEDIA_PATH .. "textures\\topmenu")
		 TMMenuTexture:SetVertexColor(0, 0, 0, .5)
		 TMMenuFrame.TMMenuTexture = TMMenuTexture
		 flip(TMMenuTexture, false)
		 
		 local TMMenuBorder = TMMenuFrame:CreateTexture(nil, "BORDER")
		 TMMenuBorder:SetPoint("TOP", UIParent, "TOP", 0, 17)
		 TMMenuBorder:SetPoint("CENTER", UIParent, "CENTER")
		 TMMenuBorder:SetSize(502, 46)
		 TMMenuBorder:SetTexture(MEDIA_PATH .. "textures\\topmenuborder")
		 TMMenuBorder:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 TMMenuFrame.TMMenuBorder = TMMenuBorder
		 flip(TMMenuBorder, false)
	
		 local TMMenuPageR = CreateFrame("Button", nil, TMMenuFrame)
		 TMMenuPageR:SetPoint("TOP", UIParent, "TOP", 2, -1)
	     TMMenuPageR:SetPoint("LEFT", TMMenuTexture, "RIGHT")
		 TMMenuPageR:SetSize(22, 22)
		 TMMenuPageR:SetNormalTexture(MEDIA_PATH .. "textures\\arrow")
		 TMMenuPageR:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		 TMMenuPageR:RegisterForClicks('AnyUp')
		 TMMenuPageR:SetScript("OnEnter", function(self)
			if InCombatLockdown() then return end
				TMMenuPageR:GetNormalTexture():SetVertexColor(0, 1, 0, 1)
			end)
		TMMenuPageR:SetScript("OnLeave", function(self)
			if InCombatLockdown() then return end
				TMMenuPageR:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		end)
		TMMenuPageR:SetScript("OnClick", function(self, button)
			if button == "LeftButton" then
			if InCombatLockdown() then
				print("Cannot toggle TopMenu during combat.")
				return
			end
			if aegerUI.db.profile.ShowBazBar == 1 then
				ShowBazookaBar3()
				aegerUI.db.profile.ShowBazBar = 3
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				aegerUI.db.profile.ShowBazBar == 3 then
				ShowBazookaBar4()
				aegerUI.db.profile.ShowBazBar = 4
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				aegerUI.db.profile.ShowBazBar == 4 then
				ShowBazookaBar1()
				aegerUI.db.profile.ShowBazBar = 1
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				end
			end
		end)		  
		TMMenuFrame.TMMenuPageR = TMMenuPageR
		
		 local TMMenuPageL = CreateFrame("Button", nil, TMMenuFrame)
		 TMMenuPageL:SetPoint("TOP", UIParent, "TOP", -2, -1)
	     TMMenuPageL:SetPoint("RIGHT", TMMenuTexture, "LEFT")
		 TMMenuPageL:SetSize(22, 22)
		 TMMenuPageL:SetNormalTexture(MEDIA_PATH .. "textures\\arrowf")
		 TMMenuPageL:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		 TMMenuPageL:RegisterForClicks('AnyUp')
		 TMMenuPageL:SetScript("OnEnter", function(self)
			if InCombatLockdown() then return end
				TMMenuPageL:GetNormalTexture():SetVertexColor(0, 1, 0, 1)
			end)
		TMMenuPageL:SetScript("OnLeave", function(self)
			if InCombatLockdown() then return end
				TMMenuPageL:GetNormalTexture():SetVertexColor(0, 0, 0, 0)
		end)
		TMMenuPageL:SetScript("OnClick", function(self, button)
			if button == "LeftButton" then
			if InCombatLockdown() then
				print("Cannot toggle TopMenu during combat.")
				return
			end
			if aegerUI.db.profile.ShowBazBar == 1 then
				ShowBazookaBar4()
				aegerUI.db.profile.ShowBazBar = 4
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				aegerUI.db.profile.ShowBazBar == 4 then
				ShowBazookaBar3()
				aegerUI.db.profile.ShowBazBar = 3
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			elseif
				aegerUI.db.profile.ShowBazBar == 3 then
				ShowBazookaBar1()
				aegerUI.db.profile.ShowBazBar = 1
				PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
				end
			end
		end)		  
		TMMenuFrame.TMMenuPageL = TMMenuPageL
	end
	
--  Core logic  ---------------------------------------------------------------		 
	function flip(texture, horizontal)
	  local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy = texture:GetTexCoord()
	    if horizontal then
		  texture:SetTexCoord(URx, URy, LRx, LRy, ULx, ULy, LLx, LLy)
	    else
		  texture:SetTexCoord(LLx, LLy, ULx, ULy, LRx, LRy, URx, URy)
	   end
	end
	
	function TMMenuDisplay()
      if not TMMenuFrame then
	    InitTMMenuFrame()
	  end
	  TMMenuFrame:Show()
	end

	function TMMenuHide()
      if not TMMenuFrame then
	    InitTMMenuFrame()
	  end
	  TMMenuFrame:Hide()
	end

	function ShowBazookaBar1()
      BazookaBar_1:Show()
	  if aegerUI.db.profile.SetUpDone
	  then
	  BazookaBar_3:Hide()
	  BazookaBar_4:Hide()
	end
	end
	
	function ShowBazookaBar3()
      BazookaBar_3:Show()
	  BazookaBar_1:Hide()
	  BazookaBar_4:Hide()
	end
	
	function ShowBazookaBar4()
      BazookaBar_4:Show()
	  BazookaBar_1:Hide()
	  BazookaBar_3:Hide()
	end
		 
	function HideBazookaBars()
      BazookaBar_1:Hide()
	  BazookaBar_3:Hide()
	  BazookaBar_4:Hide()
	end

	function TMCombatColorOn()
	  TMMenuFrame.TMMenuBorder:SetVertexColor(1, 0, 0)
	end

	function TMCombatColorOff()
	   TMMenuFrame.TMMenuBorder:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	end