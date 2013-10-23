local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallAanye_XP()
	if not IsAddOnLoaded("Aanye_XP") then return end
	
	if addon.db.global.addonProfileVersion.Aanye_XP ~= profileVersion then
	
		_G.aegerUI_AanyeXP_Install = {
			["display_format"] = 2,
		}
		
	for k,v in pairs(aegerUI_AanyeXP_Install) do
		Aanye_XP_DB.global[k] = v
		addon.db.global.addonProfileVersion.Aanye_XP = profileVersion
	end
	end
end