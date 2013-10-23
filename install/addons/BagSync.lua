local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"
 
 function addon:BagSyncOptions()
	if not IsAddOnLoaded("BagSync") then return end
	
	if addon.db.global.addonProfileVersion.BagSync ~= profileVersion then
		
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
		addon.db.global.addonProfileVersion.BagSync = profileVersion
	end
	end
end