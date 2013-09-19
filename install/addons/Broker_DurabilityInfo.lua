local addonname, aegerUI = ...

function aegerUI:InstallBrokerDurability()
	if not IsAddOnLoaded("Broker_DurabilityInfo") then return end
	
	local Duraprofile = "Default"
		
	_G.aegerUI_BrokerDurability_Install = {
		[Duraprofile] = {
			["repairFromGuild"] = true,
			["repairType"] = 1,
		},
	}
		
for k,v in pairs(aegerUI_BrokerDurability_Install) do
		Broker_DurabilityInfoDB.profiles[k] = v
	end
end