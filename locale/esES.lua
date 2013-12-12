-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
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
	L["Right"] =  "bien"
	L["Left"] = "Izquierda"
	L["Changes to Watchframe position will reload your UI, are you sure?"] = "Los cambios en la posición Watchframe se vuelva a cargar la interfaz de usuario, ¿estás seguro?"
	L["Reinstall aegerUI"] = "reinstalar"
	L["Frame Positions"] = "Posiciones Frame"
	L["Profile Options"] = "Opciones de Perfil"
	L["Profiles"] = "perfiles"
	L["Bottom"] = "fondo"
	L["Top"] = "superior"
	
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