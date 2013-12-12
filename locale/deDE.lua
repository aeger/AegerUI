-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "deDE")
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "Installieren"
	L["Cancel"] = "stornieren"
	L["Reload"] = "Seite neu laden"
	L["Watchframe Position"] = "Watchframe Position"
	L["Right"] = "richtig"
	L["Left"] = "Linke"
	L["Changes to Watchframe position will reload your UI, are you sure?"] = "Änderungen Watchframe Position wird Ihre UI neu zu laden, sind Sie sicher?"
	L["Reinstall aegerUI"] = "Installieren"
	L["Frame Positions"] = "Rahmen Positionen"
	L["Profile Options"] = "Profil-Optionen"
	L["Profiles"] = "Profile"
	L["Bottom"] = "Unterseite"
	L["Top"] = "Spitze"
	
-- Chat buttons  ----------------------------------------------------------------
	L["Character"] = "Zeichen"
	L["Dungeon Journal"] = "Dungeon Journal"
	L["LFD"] = "LFD"
	L["Spell Book"] = "Zauberbuch"
	L["Quest Log"] = "Questbuch"
	L["Mounts and Pets"] = "Reittiere und Haustiere"
	L["Talents"] = "Talente"
	L["Achievements"] = "Erreichung"
	L["PVP"] = "PVP"