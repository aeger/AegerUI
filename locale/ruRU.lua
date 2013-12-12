-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
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
	L["Right"] =  "право"
	L["Left"] = "Слева"
	L["Changes to Watchframe position will reload your UI, are you sure?"] = "Изменения в позиции Watchframe перезагрузит ваш пользовательский интерфейс, вы уверены?"
	L["Reinstall aegerUI"] = "Установите"
	L["Frame Positions"] = "Рамка позиции"
	L["Profile Options"] = "Опции профиля"
	L["Profiles"] = "Профили"
	L["Bottom"] = "нижний"
	L["Top"] = "верхний"
	
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