local AUI, aui = ...
local profileVersion = "1.2"
 
 function aui.BrokerGarrisonOptions()
	if not IsAddOnLoaded("Broker_Garrison") then return end
	
	if aegerUI.db.global.addonProfileVersion.BrokerGarrison ~= profileVersion then
		
	_G.aegerUI_BROKERGARRISON_Profile_Defaults = {
		["Default"] = {
			["notification"] = {
				["shipment"] = {
					["toastEnabled"] = false,
				},
				["building"] = {
					["toastEnabled"] = false,
				},
				["mission"] = {
					["toastEnabled"] = false,
				},
			},
			["general"] = {
				["building"] = {
					["compactTooltip"] = true,
					["ldbTemplate"] = "custom",
					["ldbLabelText"] = "",
					["ldbText"] = "%csr%",
				},
				["mission"] = {
					["showRewardsAmount"] = true,
					["ldbLabelText"] = "",
					["showRewardsXP"] = true,
					["collapseOtherCharsOnLogin"] = true,
					["showOnlyCurrentRealm"] = true,
					["compactTooltip"] = true,
					["ldbTemplate"] = "custom",
					["ldbText"] = "%cmc% %resicon% %res% %sotficon% %sotf%",
				},
			},
		},
	}
		
	for k,v in pairs(aegerUI_BROKERGARRISON_Profile_Defaults) do
		Broker_GarrisonDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.BrokerGarrison = profileVersion
	end
	end
end