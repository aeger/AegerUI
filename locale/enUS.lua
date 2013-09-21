-------------------------------------------------------------------------------
--  aegerUI 5.4.2 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local silent = false
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "enUS", true, silent)	
	
-- Setup -----------------------------------------------------------------------
	L["Install"] = true
	L["Cancel"] = true
	L["Reload"] = true