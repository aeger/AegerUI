local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallExtSocialUI()
	if not IsAddOnLoaded("ExtSocialUI") then return end
	
	if addon.db.global.addonProfileVersion.ExtSocialUI ~= profileVersion then
	
		_G.aegerUI_ExtSocialUI_Install = {
			["show_load_message"] = false,
		}
		
for k,v in pairs(aegerUI_ExtSocialUI_Install) do
		EXTSOCIALUI_DATA.config[k] = v
		addon.db.global.addonProfileVersion.ExtSocialUI = profileVersion
	end
	end
end