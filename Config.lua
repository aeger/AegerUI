local AUI, aui = ...
local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")

-- Adjust scale via slash cmds
local function SetScaleSmall() --Called in options panel
	UIParent:SetScale(0.64);
	SetCVar("uiscale", "0.64");
	SetCVar("useUiScale", 1);
end
	
local function SetScaleNormal() --Called in options panel
	UIParent:SetScale(1.0);
	SetCVar("uiscale", "1.0");
	SetCVar("useUiScale", 0);
end

-- Options panel	
local function GetOptions()
	local options = {
		name = GetAddOnMetadata("aegerUI", "Title"),
		type = "group",
		childGroups = "tab",
		args = {
			auidesc = {
				type = "description",
				order = 1,
				name = _G.GAME_VERSION_LABEL .. ": " .. aegerUI.version .. "\n",
				cmdHidden = true,
			},
			general = {
				order = 100,
				type = "group",
				name = "General",
				cmdHidden = false,
				args = {
					startupmessage = {
						order = 100,
						name = "Startup message",
						type = "toggle",
						get = function() return aegerUI.db.global.StartUpMessage end,
						set = function(info, value) aegerUI.db.global.StartUpMessage = value
						end,
					},
					miniMapBtn = {
						order = 110,
						name = "Minimap Button",
						type = "toggle",
						get = function() return aegerUI.db.global.ShowMinimapIcon end,
						set = function(info, value) aegerUI.db.global.ShowMinimapIcon = value
						end,
					},
					automation = {
						order = 200,
						type = "group",
						name = "Automation",
						cmdHidden = false,
						args = {
							autoHeader = {
								order = 100,
								type = "header",
								name = "Automation options",
								cmdHidden = true,
							},
							autoDesc = {
								order = 101,
								type = "description",
								name = "Most automatic functions can be temp disabled by holding down a modifier key like shift while clicking \n" .. "\n",
							},
							autoRepair = {
								order = 110,
								name = "Auto Repair",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.AutoRepair end,
								set = function(info, value) aegerUI.db.global.Automation.AutoRepair = value
								end,
							},
							autoGuild = {
								order = 120,
								name = "Use Guild funds",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.GuildRepair end,
								set = function(info, value) aegerUI.db.global.Automation.GuildRepair = value
								end,
							},
							autoDeposit = {
								order = 130,
								name = "Auto Deposit Reagents",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.AutoDepositRegs end,
								set = function(info, value) aegerUI.db.global.Automation.AutoDepositRegs = value
								end,
							},
							autoSell = {
								order = 140,
								name = "Auto Sell Grey Items",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.AutoSell end,
								set = function(info, value) aegerUI.db.global.Automation.AutoSell = value
								end,
							},
							autoAcceptParty = {
								order = 150,
								name = "Auto accept friend party invites",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.AcceptInvites 	end,
								set = function(info, value) aegerUI.db.global.Automation.AcceptInvites = value
								end,
							},
							autoAcceptWhisper = {
								order = 160,
								name = "Auto accept whisper party invites",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.InviteFromWhisper 	end,
								set = function(info, value) aegerUI.db.global.Automation.InviteFromWhisper = value
								end,
							},
							autoWhisperkey = {
								order = 170,
								name = "Set whisper invite key",
								width = "full",
								type = "input",
								get = function() return aegerUI.db.global.Automation.WhisperKeyWord end,
								set = function(info, value) aegerUI.db.global.Automation.WhisperKeyWord = value
								end,
							},
							autoFollowAccept = {
								order = 180,
								name = "Auto accept whisper follow command",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.AutoFollowWhisper 	end,
								set = function(info, value) aegerUI.db.global.Automation.AutoFollowWhisper = value
								end,
							},
							autoFollowkey = {
								order = 190,
								name = "Set follow whisper key",
								width = "full",
								type = "input",
								get = function() return aegerUI.db.global.Automation.FollowKeyWord end,
								set = function(info, value) aegerUI.db.global.Automation.FollowKeyWord = value
								end,
							},
							autoRareAlert = {
								order = 191,
								name = "Enable rare raid warning",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.RareAlert end,
								set = function(info, value) aegerUI.db.global.Automation.RareAlert = value
								end,
							},
							autoRez = {
								order = 192,
								name = "Auto accept resurrection requests",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.profile.Automation.AcceptRez end,
								set = function(info, value) aegerUI.db.profile.Automation.AcceptRez = value
								end,
							},
							autoSummon = {
								order = 193,
								name = "Auto accept summon requests",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.profile.Automation.AcceptSummon end,
								set = function(info, value) aegerUI.db.profile.Automation.AcceptSummon = value
								end,
							},
							autoReload = {
								order = 194,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},
						},
					},
					blockers = {
						order = 200,
						type = "group",
						name = "Blockers",
						cmdHidden = false,
						args = {
							blockParty = {
								order = 210,
								name = "Block non-friend party invites",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.BlockPartyInvites end,
								set = function(info, value) aegerUI.db.global.Automation.BlockPartyInvites = value
								end,
							},
							blockDuel = {
								order = 220,
								name = "Block duel requests",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.profile.Automation.BlockDuel end,
								set = function(info, value) aegerUI.db.profile.Automation.BlockDuel = value
								end,
							},
							blockPetduel = {
								order = 230,
								name = "Block pet duel requests",
								width = "full",
								type = "toggle",
								get = function() return aegerUI.db.profile.Automation.BlockPetDuel 	end,
								set = function(info, value) aegerUI.db.profile.Automation.BlockPetDuel = value
								end,
							},
							disableerrormessage = {
								order = 240,
								name = "Hide error messages",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.HideErrors end,
								set = function(info, value) aegerUI.db.global.Automation.HideErrors = value
								end,
							},
							disablebguardgossip = {
								order = 250,
								name = "Hide bodyguard gossip",
								type = "toggle",
								get = function() return aegerUI.db.global.Automation.HideBodyGuard end,
								set = function(info, value) aegerUI.db.global.Automation.HideBodyGuard = value
								end,
							},
						},
					},
					brokerplugins = {
						name = "Broker Plugins",
						type = "group",
						order = 300,
						args = {
							bdesc = {
								order = 301,
								type = "description",
								name = "Enable/Disable DataBroker plugins for aegerUI" .. "\n",
							},
							bautoloot = {
								order = 310,
								name = "Auto Loot",
								type = "toggle",
								get = function() return aegerUI.db.global.BrokerPlugins.AutoLoot end,
								set = function(info, value) aegerUI.db.global.BrokerPlugins.AutoLoot = value
								end,
							},
							bdurability = {
								order = 320,
								name = "Durability",
								type = "toggle",
								get = function() return aegerUI.db.global.BrokerPlugins.BDurability end,
								set = function(info, value) aegerUI.db.global.BrokerPlugins.BDurability = value
								end,
							},
							bsidebar = {
								order = 330,
								name = "Sidebar",
								type = "toggle",
								get = function() return aegerUI.db.global.BrokerPlugins.Sidebar end,
								set = function(info, value) aegerUI.db.global.BrokerPlugins.Sidebar = value
								end,
							},
							btinydps = {
								order = 340,
								name = "TinyDPS",
								type = "toggle",
								get = function() return aegerUI.db.global.BrokerPlugins.TinyDPS end,
								set = function(info, value) aegerUI.db.global.BrokerPlugins.TinyDPS = value
								end,
							},
							bzygors = {
								order = 350,
								name = "Zygors",
								type = "toggle",
								get = function() return aegerUI.db.global.BrokerPlugins.Zygors end,
								set = function(info, value) aegerUI.db.global.BrokerPlugins.Zygors = value
								end,
							},
							bspacer = {
								order = 360,
								type = "description",
								width = "full",
								name = "\n\n",
							},
							breload = {
								order = 370,
								name = "Reload UI to set options",
								type = "execute",
								func = function() ReloadUI() end,
							},					
						},
					},
					keybinds = {
						name = "Key bindings",
						type = "group",
						order = 400,
						args = {
							keyHeader = {
								order = 100,
								type = "header",
								name = "Keybindings",
							},
							keybindtopmenu = {
								order = 110,
								name = "Toggle TopMenu",
								type = "keybinding",
								get = function() return GetBindingKey("Toggle TopMenu") end,
								set = function(key1, value)
									key1 = GetBindingKey("Toggle TopMenu")
									if key1 ~= nil then
									SetBinding(key1)
									end
									SetBinding(value, "Toggle TopMenu")
									SaveBindings(GetCurrentBindingSet())
								end,
							},
						},
					},
					tooltips = {
						name = "Tooltips",
						type = "group",
						order = 500,
						args = {
							tipHeader = {
								order = 100,
								type = "header",
								name = "Tooltips",
							},
							tipTitle = {
								order = 110,
								name = "Show Titles",
								type = "toggle",
								get = function() return aegerUI.db.global.ToolTips.ShowTitle end,
								set = function(info, value) aegerUI.db.global.ToolTips.ShowTitle = value
								end,
							},
							tipRole = {
								order = 120,
								name = "Show Role Icon",
								type = "toggle",
								get = function() return aegerUI.db.global.ToolTips.RoleIcon end,
								set = function(info, value) aegerUI.db.global.ToolTips.RoleIcon = value
								end,
							},
							tipGuild = {
								order = 130,
								name = "Show Guild Rank",
								type = "toggle",
								get = function() return aegerUI.db.global.ToolTips.ShowGuildRanks end,
								set = function(info, value) aegerUI.db.global.ToolTips.ShowGuildRanks = value
								end,
							},
							tipFontsize = {
								order = 140,
								name = "ToolTip Font size",
								type = "range",
								step = 1,
								min = 10,
								max = 16,
								get = function() return aegerUI.db.global.ToolTips.FontSize end,
								set = function(info, value) aegerUI.db.global.ToolTips.FontSize = value
								end,
							},
							tipFont = {
								order = 150,
								name = "ToolTip Damage Font",
								type = "select",
								dialogControl = 'LSM30_Font',
								values = AceGUIWidgetLSMlists.font,
								
							},
							tipBorderColor = {
								order = 160,
								name = "Border color",
								type = "color",
								get = function(info)
									return unpack(aegerUI.db.global.ToolTips.Colors.Border)
								end,
								set = function(info, r, g, b)
									local aframecolor = aegerUI.db.global.ToolTips.Colors.Border
									aframecolor[1], aframecolor[2], aframecolor[3] = r, g, b
								end,
								hasAlpha = false,	
							},
						},
					},
				},
			},
			modules = {
				name = "Modules",
				type = "group",
				order = 200,
				args = {
					modActionBars = {
						order = 100,
						name = "Action Bars enabled",
						width = "full",
						type = "toggle",
						get = function() return aegerUI.db.global.ActionBars end,
						set = function(info, value) aegerUI.db.global.ActionBars = value
						end,
					},
					modHelmCloakbtn = {
						order = 110,
						name = "Show Helm/Cloak Buttons",
						width = "full",
						type = "toggle",
						get = function() return aegerUI.db.global.ShowHelmCloakBtn end,
						set = function(info, value) aegerUI.db.global.ShowHelmCloakBtn = value
						end,
					},
					modMinimap = {
						order = 120,
						name = "Minimap enabled",
						width = "full",
						type = "toggle",
						get = function() return aegerUI.db.global.MiniMapEnabled end,
						set = function(info, value) aegerUI.db.global.MiniMapEnabled = value
						end,
					},
					modBottombtns = {
						order = 130,
						name = "Buttons under chat",
						width = "full",
						type = "toggle",
						get = function() return aegerUI.db.global.BottomButtons end,
						set = function(info, value) aegerUI.db.global.BottomButtons = value
						end,
					},
					modTooltips = {
						order = 140,
						name = "ToolTip Mods",
						width = "full",
						type = "toggle",
						get = function() return aegerUI.db.global.ToolTips end,
						set = function(info, value) aegerUI.db.global.ToolTips = value
						end,
					},
					modReload = {
						order = 150,
						name = "Reload UI to set options",
						type = "execute",
						func = function() ReloadUI() end,
					},
				},
			},
			skins = {
				name = "Skin",
				type = "group",
				order = 250,
				args = {
					colorpicker = {
						order = 110,
						name = "Skin color",
						width = "full",
						type = "color",
						get = function(info)
							return unpack(aegerUI.db.profile.AUIFrameColor)
						end,
						set = function(info, r, g, b, a)
							local aframecolor = aegerUI.db.profile.AUIFrameColor
							aframecolor[1], aframecolor[2], aframecolor[3], aframecolor[4] = r, g, b, a
						end,
						hasAlpha = true,	
					},
					skinReload = {
						order = 120,
						name = "Reload UI to set options",
						type = "execute",
						func = function() ReloadUI() end,
					},
				},
			},
			reinstall = {
				name = "Reinstall",
				type = "group",
				order = 300,
				args = {
					reisntalldesc = {
						order = 31,
						type = "description",
						name = "Reinstall aegerUI, this will overwrite any changes made to saved variables." .. "\n",
					},
					reinstall = {
						type = "execute",
						name = "Reinstall aegerUI",
						order = 32,
						func = function()
							aegerUI.db.global.addonProfileVersion = {}
							aegerUI.db.profile.addonProfileVersionPC = {}
							aegerUI:EnableModule("SetupUI")
							aui.DoSetup()
						end,
					},
				},
			},
			about = {
				order = 900,
				type = "group",
				name = "About",
				cmdHidden = false,
				args = {
					aboutHeader = {
						order = 100,
						type = "header",
						name = "aegerUI",
						cmdHidden = true,
					},
					version = {				
						order = 200,
						type = "description",
						fontSize = "medium",
						name = _G.GAME_VERSION_LABEL .. ": " .. aegerUI.version .. "\n",
						cmdHidden = true,
					},
					about = {
						order = 300,
						type = "description",
						fontSize = "medium",
						name = ("Author: Aeger - Terokkar\n \nThanks to: Leatrix and Abu for all the code I stole."),
						cmdHidden = true,
					},
				},
			},
			
			scalesmall = {
				type = "execute",
				name = "Set UI scale to 0.64",
				hidden = true,
				order = 99,
				func = function()
					SetScaleSmall()
				end,
			},
			scalenormal = {
				type = "execute",
				name = "Set UI scale to 1",
				hidden = true,
				order = 99,
				func = function()
					SetScaleNormal()
				end,
			},
			install = {
				type = "execute",
				name = "Reinstall aegerUI",
				hidden = true,
				order = 60,
				func = function()
					aegerUI:EnableModule("SetupUI")
					aui.DoSetup()
				end,
			},
		},
	}
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(aegerUI.db)
	return options
end


function aegerUI:SetupOptions()
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("aegerUI", GetOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("aegerUI", "aegerUI")
end


