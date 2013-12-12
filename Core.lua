-------------------------------------------------------------------------------
--  aegerUI 5.4.8 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------
local aegerUI = ...
local LibStub = _G.LibStub
local aegerUI = LibStub("AceAddon-3.0"):NewAddon("aegerUI", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
_G.aegerUI = aegerUI
local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

local AceConfig 	= LibStub("AceConfig-3.0")
local AceConfigReg 	= LibStub("AceConfigRegistry-3.0")
local AceConfigDialog 	= LibStub("AceConfigDialog-3.0")

--  Constants  ----------------------------------------------------------------
BINDING_HEADER_aegerUI = "aegerUI"

--  Default DB data  ----------------------------------------------------------	
	
	local defaults = {
		global = {
          ChatFrame_Position = "BOTTOM",
		  WatchFrame_Position = "RIGHT",
		  MiniMapEnabled = true,
		  addonProfileVersion = {},
		  WatchFrame_Height = 600, -- Sets the height of the Quest Tracker
		  MoveCompactManager = true, -- Whether to move the Compact Raid Frame Manager away from Top Left Chat Box. While true, you cannot open or close the Compact Raid Frame Manager while in Combat.
		  DisableChatFade = true,
		  EnableChatMods = true,
		  HideChatbuttons = true,
		  EnableChatClassColors = true,
		  DisableStartUpMessage = false,
		},
		profile = {
          SetUpDone = false,
		  TopMenuShow = true,
		  NumBottomBars = 1,
		  ShowBazBar = 1,
		  SideBars = 1,
		  addonProfileVersionPC = {},
		},
	}
	
	local function GetOptions(uiTypes, uiName, appName)
		if appName == "aegerUI-General" then
		local options = {
			type = "group",
			name = GetAddOnMetadata("aegerUI", "Title"),
			args = {
				auidesc = {
					type = "description",
					order = 0,
					name = _G.GAME_VERSION_LABEL .. ": " .. aegerUI.version .. "\n",
				},
				global = {
					name = "Global",
					type = "group",
					order = 1,
					args = {
						globaldesc = {
							order = 2,
							type = "description",
							name = "Set global options for aegerUI" .. "\n",
						},
						ChatFrame_Position = {
							order = 3,
							name = "ChatFrame Position",
							type = "select",
							get = function()
								return aegerUI.db.global.ChatFrame_Position
							end,
							set = function(info, value)
								aegerUI.db.global.ChatFrame_Position = value
								aegerUI:ChatFrameInstall()
							end,
							values = { 
								BOTTOM = L["Bottom"],
								TOP = L["Top"],
							},
							style = "dropdown",
						},
						WatchFrame_Position = {
							order = 4,
							name = L["Watchframe Position"],
							type = "select",
							get = function()
								return aegerUI.db.global.WatchFrame_Position
							end,
							set = function(info, value)
								aegerUI.db.global.WatchFrame_Position = value
							end,
							values = { 
								RIGHT = L["Right"],
								LEFT = L["Left"],
							},
							style = "dropdown",
						},
						disableminimap = {
							order = 5,
							name = "Minimap enabled",
							type = "toggle",
							get = function()
								return aegerUI.db.global.MiniMapEnabled
							end,
							set = function(info, value)
								aegerUI.db.global.MiniMapEnabled = value
							end,
						},
						disablestartupmessage = {
							order = 6,
							name = "Disable Startup message",
							type = "toggle",
							get = function()
								return aegerUI.db.global.DisableStartUpMessage
							end,
							set = function(info, value)
								aegerUI.db.global.DisableStartUpMessage = value
							end,
						},
						globalheader = {
							order = 7,
							type = "header",
							name = "Keybindings",
						},
						keybindtopmenu = {
							order = 8,
							name = "Toggle TopMenu",
							type = "keybinding",
							get = function()
								 return GetBindingKey("Toggle TopMenu")
							end,
							set = function(key1, value)
								key1 = GetBindingKey("Toggle TopMenu")
								if key1 ~= nil then
								SetBinding(key1)
								end
								SetBinding(value, "Toggle TopMenu")
								SaveBindings(GetCurrentBindingSet())
							end,
						},
						keybindbottombars = {
							order = 9,
							name = " Toggle Bottom Bars",
							type = "keybinding",
							get = function()
								return GetBindingKey("Toggle Bottom Bars")
							end,
							set = function(key1, value)
								key1 = GetBindingKey("Toggle Bottom Bars")
								if key1 ~= nil then
								SetBinding(key1)
								end
								SetBinding(value, "Toggle Bottom Bars")
								SaveBindings(GetCurrentBindingSet())
							end,
						},
						globalspacer = {
							order = 9.1,
							type = "description",
							width = "full",
							name = "\n\n",
						},
						globalreload = {
							order = 9.2,
							name = "Reload UI to set options",
							type = "execute",
							func = function()
								ReloadUI()
							end,
						},
					},
				},
				percharacter = {
					name = "Character Specific",
					type = "group",
					order = 10,
					args = {
						perchar_desc = {
							order = 11,
							type = "description",
							name = "Set Character specific options for aegerUI" .. "\n",
						},
					},
				},
				chatoptions = {
					name = "Chat Options",
					type = "group",
					order = 20,
					args = {
						chatoptionsdesc = {
							order = 21,
							type = "description",
							name = "Set Chat options for aegerUI" .. "\n",
						},
						enablechatmods = {
							order = 22,
							name = "Enable Chat Mods",
							type = "toggle",
							get = function()
								return aegerUI.db.global.EnableChatMods
							end,
							set = function(info, value)
								aegerUI.db.global.EnableChatMods = value
							end,
						},
						chatspacer = {
							order = 23,
							type = "description",
							width = "full",
							name = "\n",
						},
						chatheader = {
							order = 24,
							type = "header",
							name = "Chat Options",
						},
						hidechatbuttons = {
							order = 25,
							name = "Hide Chat Buttons",
							type = "toggle",
							get = function()
								return aegerUI.db.global.HideChatbuttons
							end,
							set = function(info, value)
								aegerUI.db.global.HideChatbuttons = value
							end,
						},
						disablechatfade = {
							order = 26,
							name = "Disable text fade",
							type = "toggle",
							get = function()
								return aegerUI.db.global.DisableChatFade
							end,
							set = function(info, value)
								aegerUI.db.global.DisableChatFade = value
							end,
						},
						enablechatcolors = {
							order = 27,
							name = "Class color names",
							type = "toggle",
							get = function()
								return aegerUI.db.global.EnableChatClassColors
							end,
							set = function(info, value)
								aegerUI.db.global.EnableChatClassColors = value
							end,
						},
						chatpacer2 = {
							order = 28,
							type = "description",
							width = "full",
							name = "\n\n",
						},
						chatreload = {
							order = 29,
							name = "Reload UI to set options",
							type = "execute",
							func = function()
								ReloadUI()
							end,
						},
					},
				},
				reinstall = {
					name = "Reinstall",
					type = "group",
					order = 30,
					args = {
						reisntalldesc = {
							order = 31,
							type = "description",
							name = "Reinstall aegerUI, this will overwrite any changes made to saved variables." .. "\n",
						},
						reinstall = {
							type = "execute",
							name = L["Reinstall aegerUI"],
							order = 32,
							func = function()
								aegerUI.db.global.addonProfileVersion = {}
								aegerUI.db.profile.addonProfileVersionPC = {}
								aegerUI:DoSetup()
							end,
						},
					},
				},
				scalesmall = {
					type = "execute",
					name = "Set UI scale to 0.64",
					hidden = true,
					order = 99,
					func = function()
						aegerUI:SetScaleSmall()
					end,
				},
				scalenormal = {
					type = "execute",
					name = "Set UI scale to 1",
					hidden = true,
					order = 99,
					func = function()
						aegerUI:SetScaleNormal()
					end,
				},
				install = {
					type = "execute",
					name = L["Reinstall aegerUI"],
					hidden = true,
					order = 60,
					func = function()
						aegerUI:DoSetup()
					end,
				},
			},
		}
		options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(aegerUI.db)
		return options
	end
	end
	
	function aegerUI:ChatCommands(input)
		if InCombatLockdown() then
			self:Print(L["Cannot access options during combat."])
		return end
		if not input or input:trim() == "" then
			AceConfigDialog:Open("aegerUI-General")
		else
		 LibStub("AceConfigCmd-3.0").HandleCommand(aegerUI, "aui", "aegerUI-General", input)
		end
	end
	 
	function aegerUI:OnInitialize() 
		self.db = LibStub("AceDB-3.0"):New("aegerUIdb", defaults)
		local version = _G.GetAddOnMetadata("aegerUI", "Version")
		self.version = version
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("aegerUI-General", GetOptions)
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions("aegerUI-General", "aegerUI")
		aegerUI:RegisterChatCommand( "aui", "ChatCommands")
		aegerUI:RegisterChatCommand( "aegerUI", "ChatCommands")
		LibStub("LibAboutPanel").new("aegerUI", "aegerUI")
	 end
	 
		
--  Reload  -------------------------------------------------------------------
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

-- eAlign:

SLASH_EA1 = "/align"

local f

SlashCmdList["EA"] = function()
	if f then
		f:Hide()
		f = nil		
	else
		f = CreateFrame('Frame', nil, UIParent) 
		f:SetAllPoints(UIParent)
		local w = GetScreenWidth() / 64
		local h = GetScreenHeight() / 36
		for i = 0, 64 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 32 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', i * w - 1, 0)
			t:SetPoint('BOTTOMRIGHT', f, 'BOTTOMLEFT', i * w + 1, 0)
		end
		for i = 0, 36 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 18 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', 0, -i * h + 1)
			t:SetPoint('BOTTOMRIGHT', f, 'TOPRIGHT', 0, -i * h - 1)
		end	
	end
end