-------------------------------------------------------------------------------
--  aegerUI 5.4.2 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "deDE")
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "Installieren"
	L["Cancel"] = "stornieren"
	L["Reload"] = "Seite neu laden"