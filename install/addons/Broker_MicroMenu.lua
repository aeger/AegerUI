local addonname, aegerUI = ...

function aegerUI:InstallBrokerMicroMenu()
	if not IsAddOnLoaded("Broker_MicroMenu") then return end
	
	local Microprofile = "Default"
		
	_G.aegerUI_BrokerMicroMenu_Install = {
		[Microprofile] = {
			["showHomeLatency"] = false,
			["fpsFirst"] = true,
			["disableColoring"] = false,
		},
	}
		
for k,v in pairs(aegerUI_BrokerMicroMenu_Install) do
		Broker_MicroMenuDB.profiles[k] = v
	end
end