local addonname, aegerUI = ...

function aegerUI:InstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	local Bazprofile = "Default"
		
	_G.aegerUI_Bazooka_Install = {
		["BazBar2"] = {
			["locked"] = true,
			["bars"] = {
				{
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
					["bgEnabled"] = false,
					["attach"] = "none",
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [1]
				{
					["point"] = "TOPRIGHT",
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["fadeInCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeAlpha"] = 0.22,
					["attach"] = "none",
					["frameHeight"] = 20.0000171661377,
					["relPoint"] = "TOPRIGHT",
					["x"] = -61.99810028076172,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
				}, -- [2]
			},
			["plugins"] = {
				["data source"] = {
					["DailyGlobalCheck_broker"] = {
						["pos"] = 2,
						["area"] = "left",
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["enabled"] = false,
						["area"] = "left",
					},
					["Broker_TimelessIsleChests"] = {
						["pos"] = 3,
						["area"] = "left",
					},
					["Broker_DurabilityInfo"] = {
						["enabled"] = false,
						["pos"] = 12,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["pos"] = 3,
						["area"] = "left",
					},
					["Broker_MicroMenu"] = {
						["bar"] = 2,
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
					["BagSyncLDB"] = {
						["enabled"] = false,
						["pos"] = 6,
						["showText"] = false,
						["area"] = "left",
					},
					["Broker_MoneyFu"] = {
						["enabled"] = false,
						["pos"] = 10,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["enabled"] = false,
						["area"] = "left",
					},
					["DualSpeccer"] = {
						["pos"] = 4,
						["showText"] = false,
						["area"] = "left",
					},
					["SocialState"] = {
						["enabled"] = false,
						["pos"] = 8,
						["showIcon"] = false,
						["area"] = "left",
					},
					["Aanye_XP"] = {
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
				},
				["launcher"] = {
					["Bartender4"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["pos"] = 7,
						["area"] = "right",
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["pos"] = 5,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
						["pos"] = 6,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["pos"] = 11,
						["area"] = "right",
					},
					["Breakables"] = {
						["enabled"] = false,
						["pos"] = 6,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
			},
			["numBars"] = 2,
		},
		["Default"] = {
			["plugins"] = {
				["launcher"] = {
					["TradeSkillInfo"] = {
						["pos"] = 1,
						["bar"] = 3,
					},
					["TinyDPS"] = {
						["pos"] = 7,
						["area"] = "right",
					},
					["AutoLootToggle"] = {
						["pos"] = 6,
						["bar"] = 4,
					},
					["Bartender4"] = {
						["bar"] = 4,
						["pos"] = 4,
					},
					["GatherMate2"] = {
						["bar"] = 3,
						["pos"] = 13,
					},
					["Breakables"] = {
						["bar"] = 3,
						["pos"] = 14,
					},
					["Bazooka"] = {
						["bar"] = 3,
						["pos"] = 13,
						["area"] = "right",
					},
					["Zygors"] = {
						["pos"] = 11,
						["area"] = "right",
					},
					["Prat"] = {
						["bar"] = 3,
						["pos"] = 12,
					},
					["AtlasLoot"] = {
						["bar"] = 3,
						["pos"] = 9,
					},
					["Parrot"] = {
						["bar"] = 4,
						["pos"] = 7,
					},
					["AskMrRobot"] = {
						["bar"] = 3,
						["pos"] = 12,
						["area"] = "right",
					},
					["Masque"] = {
						["bar"] = 4,
						["pos"] = 3,
					},
				},
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["bar"] = 4,
						["pos"] = 5,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_DurabilityInfo"] = {
						["pos"] = 12,
						["showIcon"] = false,
						["area"] = "left",
					},
					["Aanye_XP"] = {
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
					["BagSyncLDB"] = {
						["bar"] = 4,
						["pos"] = 2,
						["showText"] = false,
						["area"] = "left",
					},
					["Broker_MicroMenu"] = {
						["bar"] = 2,
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
					["SocialState"] = {
						["pos"] = 8,
						["showIcon"] = false,
						["area"] = "left",
					},
					["Broker_MoneyFu"] = {
						["pos"] = 10,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["bar"] = 4,
						["pos"] = 12,
					},
					["DualSpeccer"] = {
						["pos"] = 5,
						["bar"] = 3,
					},
					["TimelessDailyCheck"] = {
						["pos"] = 1,
					},
					["Broker_TimelessIsleChests"] = {
						["pos"] = 14,
					},
				},
			},
			["bars"] = {
				{
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
					["bgEnabled"] = false,
					["attach"] = "none",
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [1]
				{
					["point"] = "TOPRIGHT",
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["x"] = -61.99810028076172,
					["y"] = -206.9999084472656,
					["fadeAlpha"] = 0.22,
					["attach"] = "none",
					["frameHeight"] = 20.0000171661377,
					["relPoint"] = "TOPRIGHT",
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
				}, -- [2]
				{
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [3]
				{
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [4]
			},
			["locked"] = true,
			["numBars"] = 4,
		},
		["BazBar3"] = {
			["plugins"] = {
				["data source"] = {
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["pos"] = 3,
						["area"] = "left",
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["enabled"] = false,
						["pos"] = 12,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_MicroMenu"] = {
						["bar"] = 2,
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
					["BagSyncLDB"] = {
						["enabled"] = false,
						["showText"] = false,
						["area"] = "left",
					},
					["Broker_MoneyFu"] = {
						["enabled"] = false,
						["pos"] = 10,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["pos"] = 1,
						["area"] = "left",
					},
					["DualSpeccer"] = {
						["enabled"] = false,
						["area"] = "left",
					},
					["SocialState"] = {
						["enabled"] = false,
						["pos"] = 8,
						["showIcon"] = false,
						["area"] = "left",
					},
					["Aanye_XP"] = {
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
				},
				["launcher"] = {
					["Bartender4"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["pos"] = 7,
						["area"] = "right",
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["TradeSkillInfo"] = {
						["pos"] = 1,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
						["pos"] = 2,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["pos"] = 11,
						["area"] = "right",
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
			},
			["bars"] = {
				{
					["y"] = -1.000007510185242,
					["fadeAlpha"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["bgEnabled"] = false,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [1]
				{
					["point"] = "TOPRIGHT",
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["fadeInCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeAlpha"] = 0.22,
					["attach"] = "none",
					["frameHeight"] = 20.0000171661377,
					["x"] = -61.99810028076172,
					["relPoint"] = "TOPRIGHT",
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
				}, -- [2]
			},
			["locked"] = true,
			["numBars"] = 2,
		},
		["BazBar1"] = {
			["numBars"] = 2,
			["plugins"] = {
				["data source"] = {
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 12,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 10,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["DualSpeccer"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 8,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Bartender4"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["bgEnabled"] = false,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["fadeAlpha"] = 0,
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["x"] = -61.99810028076172,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["fadeInCombat"] = true,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
				}, -- [2]
			},
		},
		["BazBar4"] = {
			["plugins"] = {
				["data source"] = {
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["enabled"] = false,
						["area"] = "left",
					},
					["Broker_TimelessIsleChests"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Broker_DurabilityInfo"] = {
						["enabled"] = false,
						["pos"] = 12,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["Broker_MicroMenu"] = {
						["bar"] = 2,
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
					["BagSyncLDB"] = {
						["enabled"] = false,
						["showText"] = false,
						["area"] = "left",
					},
					["Broker_MoneyFu"] = {
						["enabled"] = false,
						["pos"] = 10,
						["showIcon"] = false,
						["area"] = "left",
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["enabled"] = false,
						["pos"] = 6,
						["area"] = "left",
					},
					["DualSpeccer"] = {
						["enabled"] = false,
						["area"] = "left",
					},
					["SocialState"] = {
						["enabled"] = false,
						["pos"] = 8,
						["showIcon"] = false,
						["area"] = "left",
					},
					["Aanye_XP"] = {
						["pos"] = 1,
						["showIcon"] = false,
						["area"] = "center",
					},
				},
				["launcher"] = {
					["Bartender4"] = {
						["pos"] = 2,
					},
					["TinyDPS"] = {
						["pos"] = 7,
						["area"] = "right",
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["pos"] = 4,
					},
					["Prat"] = {
						["pos"] = 5,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["pos"] = 11,
						["area"] = "right",
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["pos"] = 3,
					},
				},
			},
			["bars"] = {
				{
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
					["bgEnabled"] = false,
					["attach"] = "none",
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
				}, -- [1]
				{
					["point"] = "TOPRIGHT",
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["fadeInCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeAlpha"] = 0.22,
					["attach"] = "none",
					["frameHeight"] = 20.0000171661377,
					["x"] = -61.99810028076172,
					["relPoint"] = "TOPRIGHT",
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
				}, -- [2]
			},
			["locked"] = true,
			["numBars"] = 2,
		},
	}
	

			
	

	for k,v in pairs(aegerUI_Bazooka_Install) do
		BazookaDB.profiles[k] = v
	end
end