local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallBrokerMicroMenu()
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