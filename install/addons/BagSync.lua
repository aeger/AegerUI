 local addonname, aegerUI = ...
 
 function aegerUI:BagSyncOptions()
	if not IsAddOnLoaded("BagSync") then return end
		
	_G.aegerUI_BS_Profile_Defaults = {
				["enableAuction"] = true,
				["showGuildNames"] = true,
				["tooltipOnlySearch"] = false,
				["enableTooltips"] = true,
				["enableMailbox"] = true,
				["enableFaction"] = true,
				["enableGuild"] = true,
				["showTotal"] = true,
				["enableTooltipSeperator"] = true,
				["enableUnitClass"] = true,
				["enableMinimap"] = false,
	}

	for k,v in pairs(aegerUI_BS_Profile_Defaults) do
		BagSyncOpt[k] = v
	end
end