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
             if aegerUIdb.TMShow then
			 TMMenuDisplay()
			 ShowBazookaBar1()
			 else
			 TMMenuHide()
			 HideBazookaBar1()
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
	end
		 
	function HideBazookaBar1()
      BazookaBar_1:Hide()
	end

	function TMCombatColorOn()
	  TMMenuFrame.TMMenuBorder:SetVertexColor(1, 0, 0)
	end

	function TMCombatColorOff()
	   TMMenuFrame.TMMenuBorder:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	end 