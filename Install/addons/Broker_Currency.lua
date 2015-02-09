local AUI, aui = ...
local profileVersion = "1.1"
 
 function aui.BrokerCurrencyOptions()
	if not IsAddOnLoaded("Broker_Currency") then return end
	
	if aegerUI.db.global.addonProfileVersion.BrokerCurrency ~= profileVersion then
		
	_G.aegerUI_BROKERCURRENCY_Profile_Defaults = {
		["summary824"] = true,
		["showYesterday"] = true,
		["summary994"] = true,
		["showLastWeek"] = true,
		["summaryColorDark"] = {
			["a"] = 0,
			["r"] = 0,
			["g"] = 0,
			["b"] = 0,
		},
		["showToday"] = true,
		["iconSize"] = 16,
		["summaryColorLight"] = {
			["a"] = 0.3,
			["r"] = 1,
			["g"] = 1,
			["b"] = 1,
		},
		["iconSizeGold"] = 16,
		["summary823"] = true,
	}
		
	for k,v in pairs(aegerUI_BROKERCURRENCY_Profile_Defaults) do
		Broker_CurrencyCharDB[k] = v
		aegerUI.db.global.addonProfileVersion.BrokerCurrency = profileVersion
	end
	end
end