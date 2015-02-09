local AUI, aui = ...
local profileVersion = "1.1"

function aui.InstallBrokerMoneyFu()
	if not IsAddOnLoaded("Broker_MoneyFu") then return end
	
	if aegerUI.db.global.addonProfileVersion.Broker_MoneyFu ~= profileVersion then
	
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
		aegerUI.db.global.addonProfileVersion.Broker_MoneyFu = profileVersion
	end
	end
end