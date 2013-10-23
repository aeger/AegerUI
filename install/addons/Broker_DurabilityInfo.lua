local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallBrokerDurability()
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