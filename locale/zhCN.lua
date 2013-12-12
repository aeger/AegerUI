-------------------------------------------------------------------------------
--  aegerUI 5.4.7 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "zhCN")	
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "安装"
	L["Cancel"] = "取消"
	L["Reload"] = "刷新"
	L["Watchframe Position"] = "Позиция Watchframe"
	L["Right"] =  "右"
	L["Left"] = "左"
	L["Changes to Watchframe position will reload your UI, are you sure?"] = "更改到Watchframe位置会重新载入你的UI，你确定吗？"
	L["Reinstall aegerUI"] = "重新安装"
	L["Frame Positions"] = "帧位置"
	L["Profile Options"] = "个人资料选项"
	L["Profiles"] = "简介"
	L["Bottom"] = "底部"
	L["Top"] = "顶部"
	
-- Chat buttons  ----------------------------------------------------------------
	L["Character"] = "字符"
	L["Dungeon Journal"] = "地牢杂志 журнале"
	L["LFD"] = "利丰经销"
	L["Spell Book"] = "魔法书 заклинаний libro"
	L["Quest Log"] = "任务日志 квестов de misiones"
	L["Mounts and Pets"] = "坐骑和宠物"
	L["Talents"] = "人才"
	L["Achievements"] = "成就"
	L["PVP"] = "PVP"