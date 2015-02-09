local AUI, aui = ...
local profileVersion = "1.1"

function aui:InstallSocialState()
	if not IsAddOnLoaded("broker_GG_SocialState") then return end
	
	if aegerUI.db.global.addonProfileVersion.SocialState ~= profileVersion then
				
	_G.aegerUI_SocialState_Install = {
		["RealIDSort"] = "REALID",
		["GuildSort"] = "RANKINDEX",
		["hide_LDB_labels"] = true,
		["tooltip_autohide"] = "0.25",
		["hide_LDB_totals"] = true,
	}
		
for k,v in pairs(aegerUI_SocialState_Install) do
		GGSocialStateDB[k] = v
		aegerUI.db.global.addonProfileVersion.SocialState = profileVersion
	end
	end
end