local addonname, aegerUI = ...

function aegerUI:InstallPrat()
	if not IsAddOnLoaded("Prat-3.0") then return end
	
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
	end
end