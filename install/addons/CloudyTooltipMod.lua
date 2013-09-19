local addonname, aegerUI = ...

function aegerUI:InstallCloudyTooltip()
	if not IsAddOnLoaded("CloudyTooltipMod") then return end
		
	_G.aegerUI_CloudyToolTip_Install = {
			
			["HideHealth"] = 1,
			["MouseAnchor"] = nil,
	}
		
for k,v in pairs(aegerUI_CloudyToolTip_Install) do
		CTipModDB[k] = v
	end
end