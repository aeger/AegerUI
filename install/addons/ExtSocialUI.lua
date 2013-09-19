local addonname, aegerUI = ...

function aegerUI:InstallExtSocialUI()
	if not IsAddOnLoaded("ExtSocialUI") then return end
	
		_G.aegerUI_ExtSocialUI_Install = {
			["show_load_message"] = false,
		}
		
for k,v in pairs(aegerUI_ExtSocialUI_Install) do
		EXTSOCIALUI_DATA.config[k] = v
	end
end