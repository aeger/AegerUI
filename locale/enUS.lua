-------------------------------------------------------------------------------
--  aegerUI 5.4.9 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local silent = false
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "enUS", true, silent)	
	
-- Setup -----------------------------------------------------------------------
	L["Install"] = true
	L["Cancel"] = true
	L["Reload"] = true
	L["Watchframe Position"] = true
	L["Right"] = true 
	L["Left"] = true
	L["Changes to Watchframe position will reload your UI, are you sure?"] = true
	L["Reinstall aegerUI"] = true
	L["Frame Positions"] = true
	L["Profile Options"] = true
	L["Profiles"] = true
	L["Bottom"] = true
	L["Top"] = true
	
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