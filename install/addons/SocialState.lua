local addonname, aegerUI = ...

function aegerUI:InstallSocialState()
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