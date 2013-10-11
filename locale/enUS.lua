-------------------------------------------------------------------------------
--  aegerUI 5.4.6 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local silent = false
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "enUS", true, silent)	
	
-- Setup -----------------------------------------------------------------------
	L["Install"] = true
	L["Cancel"] = true
	L["Reload"] = true
	
-- Chat buttons  ----------------------------------------------------------------
	L["Character"] = true
	L["Dungeon Journal"] = true
	L["LFD"] = true
	L["Spell Book"] = true
	L["Quest Log"] = true
	L["Mounts and Pets"] = true
	L["Talents"] = true
	L["Achievements"] = true
	L["PVP"] = true