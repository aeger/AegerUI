local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallExtSocialUI()
	if not IsAddOnLoaded("ExtSocialUI") then return end
	
		_G.aegerUI_ExtSocialUI_Install = {
			["show_load_message"] = false,
		}
		
for k,v in pairs(aegerUI_ExtSocialUI_Install) do
		EXTSOCIALUI_DATA.config[k] = v
	end
end