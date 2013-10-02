local addonname, aegerUI = ...

function aegerUI:InstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	local Bazprofile = "Default"
		
	_G.aegerUI_Bazooka_Install = {
		["BazBar2"] = {
			["numBars"] = 2,
			["locked"] = true,
			["plugins"] = {
				["launcher"] = {
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["pos"] = 13,
						["showText"] = false,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Broker_TimelessIsleChests"] = {
						["area"] = "left",
						["pos"] = 2,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["area"] = "left",
						["pos"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
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
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
				},
			},
			["bars"] = {
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["point"] = "TOPRIGHT",
					["pos"] = 0,
					["x"] = -61.99810028076172,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
					["fadeAlpha"] = 0.22,
				}, -- [2]
			},
		},
		["Default"] = {
			["numBars"] = 4,
			["plugins"] = {
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
					},
					["BugSack"] = {
						["pos"] = 5,
						["bar"] = 4,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 12,
					},
					["Broker_TimelessIsleChests"] = {
						["pos"] = 14,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 8,
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
						["pos"] = 12,
						["bar"] = 4,
					},
					["DualSpeccer"] = {
						["bar"] = 3,
						["pos"] = 5,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["showText"] = false,
						["pos"] = 2,
						["bar"] = 4,
					},
					["TimelessDailyCheck"] = {
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["Bartender4"] = {
						["pos"] = 4,
						["bar"] = 4,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["bar"] = 4,
						["pos"] = 6,
					},
					["TradeSkillInfo"] = {
						["bar"] = 3,
						["pos"] = 1,
					},
					["GatherMate2"] = {
						["pos"] = 13,
						["bar"] = 3,
					},
					["Prat"] = {
						["pos"] = 12,
						["bar"] = 3,
					},
					["Bazooka"] = {
						["area"] = "right",
						["pos"] = 13,
						["bar"] = 3,
					},
					["Parrot"] = {
						["pos"] = 7,
						["bar"] = 4,
					},
					["AskMrRobot"] = {
						["area"] = "right",
						["pos"] = 12,
						["bar"] = 3,
					},
					["AtlasLoot"] = {
						["pos"] = 9,
						["bar"] = 3,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Breakables"] = {
						["pos"] = 14,
						["bar"] = 3,
					},
					["Masque"] = {
						["pos"] = 3,
						["bar"] = 4,
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
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["x"] = -61.99810028076172,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["y"] = -1.000007510185242,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
				}, -- [3]
				{
					["bgEnabled"] = false,
					["y"] = -1.000007510185242,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
				}, -- [4]
			},
		},
		["BazBar3"] = {
			["numBars"] = 2,
			["locked"] = true,
			["plugins"] = {
				["launcher"] = {
					["TradeSkillInfo"] = {
						["pos"] = 1,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["pos"] = 13,
						["showText"] = false,
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
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
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
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
				},
			},
			["bars"] = {
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["point"] = "TOPRIGHT",
					["pos"] = 0,
					["x"] = -61.99810028076172,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
					["fadeAlpha"] = 0.22,
				}, -- [2]
			},
		},
		["BazBar1"] = {
			["numBars"] = 2,
			["locked"] = true,
			["plugins"] = {
				["launcher"] = {
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["Bartender4"] = {
						["enabled"] = false,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Prat"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["enabled"] = false,
					},
				},
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["pos"] = 13,
						["showText"] = false,
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
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 8,
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
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
				},
			},
			["bars"] = {
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.000007510185242,
					["x"] = 1.000335693359375,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["point"] = "TOPRIGHT",
					["pos"] = 0,
					["x"] = -61.99810028076172,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
					["fadeAlpha"] = 0.22,
				}, -- [2]
			},
		},
		["BazBar4"] = {
			["numBars"] = 2,
			["locked"] = true,
			["plugins"] = {
				["launcher"] = {
					["TradeSkillInfo"] = {
						["enabled"] = false,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["enabled"] = false,
					},
					["Bartender4"] = {
						["pos"] = 2,
					},
					["GatherMate2"] = {
						["enabled"] = false,
					},
					["Breakables"] = {
						["enabled"] = false,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Prat"] = {
						["pos"] = 5,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Parrot"] = {
						["pos"] = 4,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["Masque"] = {
						["pos"] = 3,
					},
				},
				["data source"] = {
					["|cFFFFB366Ara|r Tradeskills"] = {
						["pos"] = 13,
						["showText"] = false,
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
						["enabled"] = false,
						["pos"] = 12,
					},
					["TimelessDailyCheck"] = {
						["enabled"] = false,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 8,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 10,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["pos"] = 6,
					},
					["DualSpeccer"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["enabled"] = false,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
				},
			},
			["bars"] = {
				{
					["bgEnabled"] = false,
					["y"] = -1.000007510185242,
					["frameWidth"] = 497.0000305175781,
					["pos"] = 0,
					["x"] = 1.000335693359375,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["fadeAlpha"] = 0,
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeOutOfCombat"] = true,
					["y"] = -206.9999084472656,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.00001525878906,
					["point"] = "TOPRIGHT",
					["pos"] = 0,
					["x"] = -61.99810028076172,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
					["fadeAlpha"] = 0.22,
				}, -- [2]
			},
		},
	}

			
	

	for k,v in pairs(aegerUI_Bazooka_Install) do
		BazookaDB.profiles[k] = v
	end
end