local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallPrat()
	if not IsAddOnLoaded("Prat-3.0") then return end
	
	if addon.db.global.addonProfileVersion.Prat ~= profileVersion then
	
		_G.aegerUI_Prat_Install = {
			["showButtons"] = false,
			["showBnet"] = false,
			["showMenu"] = false,
		}
		
for k,v in pairs(aegerUI_Prat_Install) do
		Prat3DB.namespaces.Prat_Buttons.profiles.Default[k] = v
	end
		_G.aegerUI_Prat_Install2 = {
			["ChatFrame1"] = false,
		}
		
for k,v in pairs(aegerUI_Prat_Install2) do
		Prat3DB.namespaces.Prat_Fading.profiles.Default.textfade[k] = v
		addon.db.global.addonProfileVersion.Prat = profileVersion
	end
	end
end