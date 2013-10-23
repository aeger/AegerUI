local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallSocialState()
	if not IsAddOnLoaded("SocialState") then return end
				
	_G.aegerUI_SocialState_Install = {
			["RealIDSort"] = "REALID",
			["GuildSort"] = "RANKINDEX",
			["hide_LDB_labels"] = true,
			["tooltip_autohide"] = "0.25",
			["hide_LDB_totals"] = true,
	}
		
for k,v in pairs(aegerUI_SocialState_Install) do
		SocialStateDB[k] = v
	end
end