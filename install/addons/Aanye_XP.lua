local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"

function aegerUI:InstallAanye_XP()
	if not IsAddOnLoaded("Aanye_XP") then return end
	
	if aegerUI.db.global.addonProfileVersion.Aanye_XP ~= profileVersion then
	
		_G.aegerUI_AanyeXP_Install = {
			["display_format"] = 2,
		}
		
	for k,v in pairs(aegerUI_AanyeXP_Install) do
		Aanye_XP_DB.global[k] = v
		aegerUI.db.global.addonProfileVersion.Aanye_XP = profileVersion
	end
	end
end