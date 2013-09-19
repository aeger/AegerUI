local addonname, aegerUI = ...

function aegerUI:InstallAanye_XP()
	if not IsAddOnLoaded("Aanye_XP") then return end
	
		_G.aegerUI_AanyeXP_Install = {
			["display_format"] = 2,
		}
		
for k,v in pairs(aegerUI_AanyeXP_Install) do
		Aanye_XP_DB.global[k] = v
	end
end