-- Register the Reload UI Slash Command before anything can fail
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

local addonname, aegerUI = ...

BINDING_HEADER_aegerUI = "aegerUI"

aegerUI.Lib = _G.LibStub

aegerUI.Lib("AceAddon-3.0"):NewAddon(aegerUI, addonname, "AceComm-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
-- aegerUI.L = aegerUI.Lib("AceLocale-3.0"):GetLocale(addonname)