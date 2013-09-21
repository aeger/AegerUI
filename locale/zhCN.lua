-------------------------------------------------------------------------------
--  aegerUI 5.4.2 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...
	local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonname, "zhCN")	
	if not L then return end

-- Setup -----------------------------------------------------------------------
	L["Install"] = "安装"
	L["Cancel"] = "取消"
	L["Reload"] = "刷新"