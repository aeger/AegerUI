-------------------------------------------------------------------------------
--  aegerUI 5.4.2 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------
local addonname, aegerUI = ...
aegerUI.Lib = _G.LibStub
aegerUI.Lib("AceAddon-3.0"):NewAddon(aegerUI, addonname, "AceComm-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
aegerUI.L = aegerUI.Lib("AceLocale-3.0"):GetLocale(addonname)

--  Constants  ----------------------------------------------------------------
BINDING_HEADER_aegerUI = "aegerUI"

--  Reload  ----------------------------------------------------------------
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI