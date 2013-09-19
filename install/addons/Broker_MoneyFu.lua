local addonname, aegerUI = ...

function aegerUI:InstallBrokerMoneyFu()
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