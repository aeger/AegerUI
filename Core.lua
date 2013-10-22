-------------------------------------------------------------------------------
--  aegerUI 5.4.6 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------
local FOLDER_NAME, private = ...
private.addon_name = "aegerUI"
local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
_G.aegerUI = addon

local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

--  Constants  ----------------------------------------------------------------
BINDING_HEADER_aegerUI = "aegerUI"

--  Default DB data  -----------------------------------------------------------	
	
	local defaults = {
		global = {
          WatchFrame_Position = "RIGHT",
		  MiniMapEnabled = true,
		},
		profile = {
          SetUpDone = false,
		  TopMenuShow = true,
		  NumBottomBars = 1,
		  ShowBazBar = 1,
		  SideBars = 1,
		},
	}
	 
	function addon:OnInitialize() 
		self.db = LibStub("AceDB-3.0"):New("aegerUIdb", defaults)
		local version = _G.GetAddOnMetadata("aegerUI", "Version")
		self.version = version
		self:SetupOptions()
		
	 end
	 
		
--  Reload  ----------------------------------------------------------------
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI