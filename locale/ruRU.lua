-------------------------------------------------------------------------------
--  aegerUI 5.4.6 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "ruRU")	
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "устанавливать"
	L["Cancel"] = "отменить"
	L["Reload"] = "перезагружать neu laden"
	L["Watchframe Position"] = "Позиция Watchframe"
	
-- Chat buttons  ----------------------------------------------------------------
	L["Character"] = "персонаж"
	L["Dungeon Journal"] = "Подземелья журнале"
	L["LFD"] = "LFD"
	L["Spell Book"] = "книгу заклинаний libro"
	L["Quest Log"] = "журнал квестов de misiones"
	L["Mounts and Pets"] = "Кронштейны и домашних животных und Haustiere"
	L["Talents"] = "Таланты"
	L["Achievements"] = "Достижения"
	L["PVP"] = "PVP"