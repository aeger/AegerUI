local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallFarmhand()
	if not IsAddOnLoaded("Farmhand") then return end
				
	_G.aegerUI_Farmhand_Install = {
			["PlayScannerSounds"] = true,
			["ShowPortals"] = false,
			["ToolsLocked"] = false,
			["StockTipPosition"] = "BELOW",
			["Y"] = 455.3998970985413,
			["X"] = -789.0002498626709,
			["ShowStockTip"] = true,
			["ShowVeggieIconsForSeeds"] = false,
			["HideInCombat"] = true,
			["ShowVeggieIconsForBags"] = false,
			["PrintScannerMessages"] = true,
	}
		
for k,v in pairs(aegerUI_Farmhand_Install) do
		FarmhandData[k] = v
	end
end