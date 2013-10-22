local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallBrokerMoneyFu()
	if not IsAddOnLoaded("Broker_MoneyFu") then return end
	
	local MoneyFuprofile = "Default"
		
	_G.aegerUI_BrokerMoneyFu_Install = {
		[MoneyFuprofile] = {
			["simpleTooltip"] = true,
			["style"] = "SHORT",
			["minimap"] = {
				["hide"] = true,
			},
		},
	}
		
for k,v in pairs(aegerUI_BrokerMoneyFu_Install) do
		Broker_MoneyFuDB.profiles[k] = v
	end
end