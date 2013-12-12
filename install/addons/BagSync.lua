local aegerUI = ...

local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local profileVersion = "1.0"
 
 function aegerUI:BagSyncOptions()
	if not IsAddOnLoaded("BagSync") then return end
	
	if aegerUI.db.global.addonProfileVersion.BagSync ~= profileVersion then
		
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
		aegerUI.db.global.addonProfileVersion.BagSync = profileVersion
	end
	end
end