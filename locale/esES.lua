-------------------------------------------------------------------------------
--  aegerUI 5.4.6 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "esES")
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "instalar"
	L["Cancel"] = "cancelar"
	L["Reload"] = "recargar"
	L["Watchframe Position"] = "Watchframe Posición"
	
-- Chat buttons  ----------------------------------------------------------------
	L["Character"] = "carácter"
	L["Dungeon Journal"] = "Dungeon Diario"
	L["LFD"] = "LFD"
	L["Spell Book"] = "hechizos libro"
	L["Quest Log"] = "registro de misiones"
	L["Mounts and Pets"] = "Reittiere und Haustiere"
	L["Talents"] = "Talentos"
	L["Achievements"] = "Logros"
	L["PVP"] = "PVP"