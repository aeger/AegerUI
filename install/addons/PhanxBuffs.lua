local addonname, aegerUI = ...

function aegerUI:InstallPhanxBuffs()
	if not IsAddOnLoaded("PhanxBuffs") then return end
				
	_G.aegerUI_PhanxBuffs_Install = {
		["debuffSpacing"] = 3,
		["fontFace"] = "Friz Quadrata TT",
		["debuffSize"] = 48,
		["buffSize"] = 36,
		["fontOutline"] = "OUTLINE",
		["buffAnchorV"] = "TOP",
		["debuffPoint"] = "TOPRIGHT",
		["debuffX"] = -254,
		["showBuffSources"] = true,
		["buffSpacing"] = 3,
		["debuffAnchorV"] = "TOP",
		["buffColumns"] = 20,
		["debuffColumns"] = 10,
		["showTempEnchantSources"] = true,
		["debuffAnchorH"] = "RIGHT",
		["buffAnchorH"] = "RIGHT",
		["maxTimer"] = 30,
		["debuffY"] = -147,
		["fontScale"] = 1,
	}
		
for k,v in pairs(aegerUI_PhanxBuffs_Install) do
		PhanxBuffsDB[k] = v
	end
end