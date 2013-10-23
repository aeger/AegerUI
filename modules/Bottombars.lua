-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
    local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
			
--  Constants  ----------------------------------------------------------------
    local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
    local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
    local FONT = "Fonts\\FRIZQT__.ttf"

-- Define locals and local functions up here so they're in scope for the whole file
	local BottomBarFrame1
    local BottomBarFrame2
    local CombatColorOn
    local CombatColorOff
		
--  Event logic  ---------------------------------------------------------------
    local DisplayBars = CreateFrame('Frame')

    DisplayBars:RegisterEvent('PLAYER_LOGIN')
    DisplayBars:RegisterEvent('UNIT_ENTERED_VEHICLE')
    DisplayBars:RegisterEvent('UNIT_EXITED_VEHICLE')
    DisplayBars:RegisterEvent('PLAYER_REGEN_ENABLED')
    DisplayBars:RegisterEvent('PLAYER_REGEN_DISABLED')
	DisplayBars:RegisterEvent('PET_BATTLE_OPENING_START')
	DisplayBars:RegisterEvent('PET_BATTLE_CLOSE')

    DisplayBars:SetScript('OnEvent',function(self, event_name, ...)
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
    function DisplayBars:PLAYER_LOGIN()
            if addon.db.profile.NumBottomBars == 1 then
		      Bbar1Display()
			  aegerUI_1Bar() else
		    if addon.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
			  aegerUI_2Bar()
            end
	    end
    end

    function DisplayBars:UNIT_ENTERED_VEHICLE()
            if UnitHasVehicleUI("player") then
		    if addon.db.profile.NumBottomBars == 1 then
		      Bbar1Hide() elseif
		    addon.db.profile.NumBottomBars == 2 then
		      Bbar2Hide()
		    end
	    end
    end

    function DisplayBars:UNIT_EXITED_VEHICLE()
            if not UnitHasVehicleUI("player") then
		    if addon.db.profile.NumBottomBars == 1 then
		      Bbar1Display() elseif
		    addon.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
		    end
	    end 
    end


    function DisplayBars:PLAYER_REGEN_ENABLED()
            CombatColorOff()
    end

    function DisplayBars:PLAYER_REGEN_DISABLED()
            CombatColorOn()
    end
	
	function DisplayBars:PET_BATTLE_OPENING_START()
            if addon.db.profile.NumBottomBars == 1 then
		      Bbar1Hide() elseif
		    addon.db.profile.NumBottomBars == 2 then
		      Bbar2Hide()
		    end
    end
	
	function DisplayBars:PET_BATTLE_CLOSE()
            if addon.db.profile.NumBottomBars == 1 then
		      Bbar1Display() elseif
		    addon.db.profile.NumBottomBars == 2 then
		      Bbar2Display()
		    end
    end
	
--  Bottom bar frames  ---------------------------------------------------------

    function BottomBarFrame1()  
	     Bar1Frame = CreateFrame('Frame', "Bar1Frame", UIParent)
	     Bar1Frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
		 Bar1Frame:SetPoint("CENTER", UIParent, "CENTER")
		 Bar1Frame:SetSize(947, 50)
		
		 local Bar1texture = Bar1Frame:CreateTexture(nil, "BACKGROUND")
		 Bar1texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	     Bar1texture:SetPoint("CENTER", UIParent, "CENTER")
	     Bar1texture:SetSize(943, 43)
	     Bar1texture:SetTexture(MEDIA_PATH .. "textures\\btrounded")		
	     Bar1texture:SetVertexColor(0, 0, 0, .5)
		 Bar1Frame.Bar1texture = Bar1texture
		
		 local Bar1border = Bar1Frame:CreateTexture(nil, "BORDER")
		 Bar1border:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -6)
	     Bar1border:SetPoint("CENTER", UIParent, "CENTER")
		 Bar1border:SetSize(950, 50)
		 Bar1border:SetTexture(MEDIA_PATH .. "textures\\btroundedborder")
		 Bar1border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 Bar1Frame.Bar1border = Bar1border
    end


    function BottomBarFrame2()  
	     Bar2Frame = CreateFrame('Frame', "Bar2Frame", UIParent)
	     Bar2Frame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
		 Bar2Frame:SetPoint("CENTER", UIParent, "CENTER")
		 Bar2Frame:SetSize(950, 94)
		
		 local Bar2texture = Bar2Frame:CreateTexture(nil, "BACKGROUND")
		 Bar2texture:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	     Bar2texture:SetPoint("CENTER", UIParent, "CENTER")
	     Bar2texture:SetSize(943, 84)
	     Bar2texture:SetTexture(MEDIA_PATH .. "textures\\btrounded")		
	     Bar2texture:SetVertexColor(0, 0, 0, .5)
		 Bar2Frame.Bar2texture = Bar2texture
		
		 local Bar2border = Bar2Frame:CreateTexture(nil, "BORDER")
		 Bar2border:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -8)
	     Bar2border:SetPoint("CENTER", UIParent, "CENTER")
		 Bar2border:SetSize(950, 94)
		 Bar2border:SetTexture(MEDIA_PATH .. "textures\\btroundedborder")
		 Bar2border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		 Bar2Frame.Bar2border = Bar2border
    end

--  Core logic  ---------------------------------------------------------------
    function Bbar1Display()
	  if not Bar1Frame then
	    BottomBarFrame1()
	  end
	  Bar1Frame:Show()
    end

    function Bbar2Display()
	  if not Bar2Frame then
	    BottomBarFrame2()
	  end
	  Bar2Frame:Show()
    end

    function Bbar1Hide()
	  if not Bar1Frame then
	    BottomBarFrame1()
	  end
	  Bar1Frame:Hide()
    end

    function Bbar2Hide()
	  if not Bar2Frame then
	    BottomBarFrame2()
	  end
	  Bar2Frame:Hide()
    end

    function CombatColorOn()
	       if addon.db.profile.NumBottomBars == 1 then
		     Bar1Frame.Bar1border:SetVertexColor(1, 0, 0)
		   else
		   if addon.db.profile.NumBottomBars == 2 then
		     Bar2Frame.Bar2border:SetVertexColor(1, 0, 0)
	       end 
	    end
    end

    function CombatColorOff()
	       if addon.db.profile.NumBottomBars == 1 then
		     Bar1Frame.Bar1border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
		   else
		   if addon.db.profile.NumBottomBars == 2 then
		     Bar2Frame.Bar2border:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	       end
	    end 
    end