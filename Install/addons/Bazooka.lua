local AUI, aui = ...
local profileVersion = "1.2"

function aui.InstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	if aegerUI.db.global.addonProfileVersion.Bazooka ~= profileVersion then
			
	_G.aegerUI_Bazooka_Install = {
		["BazBar2"] = {
			["numBars"] = 3,
			["plugins"] = {
				["data source"] = {
					["Durability"] = {
						["area"] = "left",
						["pos"] = 5,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "center",
						["showText"] = false,
						["pos"] = 2,
						["bar"] = 3,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_GarrisonMission"] = {
						["pos"] = 4,
					},
					["Broker_GarrisonBuilding"] = {
						["pos"] = 1,
					},
					["shLatency"] = {
						["pos"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 4,
						["bar"] = 3,
					},
					["Broker Currency"] = {
						["bar"] = 3,
						["pos"] = 6,
					},
					["shFps"] = {
						["pos"] = 2,
					},
					["AutoTurnIn"] = {
						["pos"] = 5,
					},
					["Broker_Equipment"] = {
						["pos"] = 6,
					},
					["GGSocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 1,
					},
				},
				["launcher"] = {
					["LDB_InstanceCooldowns"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 4,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 1,
					},
					["Toggle Bars"] = {
						["area"] = "right",
						["pos"] = 2,
						["bar"] = 3,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["area"] = "center",
						["pos"] = 3,
						["bar"] = 3,
					},
					["Parrot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["AskMrRobot"] = {
						["area"] = "right",
						["pos"] = 2,
						["bar"] = 3,
					},
					["DBM-LDB"] = {
						["pos"] = 1,
					},
				},
			},
			["locked"] = true,
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["bgInset"] = 4,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.999908447266,
					["x"] = -61.9981002807617,
					["frameWidth"] = 90.0000152587891,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["fadeInCombat"] = true,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["y"] = -1.00000751018524,
					["frameWidth"] = 497.000030517578,
					["pos"] = 0,
					["x"] = 1.00033569335938,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
				}, -- [3]
			},
		},
		["Default"] = {
			["plugins"] = {
				["launcher"] = {
					["Bazooka"] = {
						["enabled"] = false,
					},
					["BigWigs"] = {
						["pos"] = 1,
					},
					["AtlasLoot"] = {
						["pos"] = 1,
					},
					["TradeSkillInfo"] = {
						["enabled"] = false,
						["pos"] = 3,
					},
					["Zygors"] = {
						["pos"] = 2,
					},
					["BagnonLauncher"] = {
						["enabled"] = false,
						["pos"] = 2,
					},
					["GatherMate2"] = {
						["enabled"] = false,
						["pos"] = 4,
					},
				},
				["data source"] = {
					["Skada"] = {
						["pos"] = 3,
					},
					["BugSack"] = {
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["pos"] = 9,
					},
					["Broker_GarrisonBuilding"] = {
						["pos"] = 5,
					},
					["GGSocialState"] = {
						["pos"] = 10,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["pos"] = 2,
					},
					["SOCD-AltTrack"] = {
						["pos"] = 8,
					},
					["Broker_DurabilityInfo"] = {
						["pos"] = 4,
					},
					["Broker_wGold"] = {
						["area"] = "center",
						["pos"] = 1,
					},
					["shLatency"] = {
						["pos"] = 4,
					},
					["BagSyncLDB"] = {
						["enabled"] = false,
						["pos"] = 5,
					},
					["Broker_MoneyFu"] = {
						["pos"] = 2,
					},
					["MyProf"] = {
						["showText"] = false,
						["pos"] = 6,
					},
					["shFps"] = {
						["pos"] = 3,
					},
					["Broker_GarrisonMission"] = {
						["pos"] = 7,
					},
					["Frenemy"] = {
						["area"] = "left",
						["alignment"] = "LEFT",
						["pos"] = 1,
					},
					["Broker_Skills"] = {
						["pos"] = 2,
					},
				},
			},
			["bars"] = {
				{
					["y"] = 4.00003004074097,
					["x"] = 1.99968659877777,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["bgInset"] = 4,
					["frameWidth"] = 570,
					["pos"] = 0,
				}, -- [1]
			},
		},
		["BazBar3"] = {
			["numBars"] = 3,
			["adjustFrames"] = false,
			["locked"] = true,
			["plugins"] = {
				["data source"] = {
					["Durability"] = {
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 11,
					},
					["BugSack"] = {
						["area"] = "left",
						["enabled"] = false,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_GarrisonBuilding"] = {
						["pos"] = 1,
					},
					["GGSocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 6,
					},
					["Broker Currency"] = {
						["bar"] = 3,
						["pos"] = 7,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["shLatency"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 4,
					},
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Memory"] = {
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 3,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 10,
						["bar"] = 3,
					},
					["Broker_GarrisonMission"] = {
						["pos"] = 5,
					},
					["shFps"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 2,
					},
					["AutoTurnIn"] = {
						["pos"] = 6,
					},
					["Broker_Equipment"] = {
						["pos"] = 7,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
				},
				["launcher"] = {
					["LDB_InstanceCooldowns"] = {
						["pos"] = 1,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 8,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 2,
					},
					["Toggle Bars"] = {
						["pos"] = 3,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["DBM-LDB"] = {
						["pos"] = 3,
					},
				},
			},
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["bgInset"] = 4,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.999908447266,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.0000152587891,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["x"] = -61.9981002807617,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
				}, -- [2]
				{
					["bgEnabled"] = false,
					["y"] = -1.00000751018524,
					["frameWidth"] = 497.000030517578,
					["pos"] = 0,
					["x"] = 1.00033569335938,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
				}, -- [3]
			},
		},
		["BazBar1"] = {
			["numBars"] = 3,
			["locked"] = true,
			["launcher"] = {
				["Bazooka"] = {
					["enabled"] = false,
				},
				["AutoLootToggle"] = {
					["pos"] = 1,
				},
				["AskMrRobot"] = {
					["enabled"] = false,
				},
				["TinyDPS"] = {
					["area"] = "right",
					["bar"] = 3,
					["pos"] = 7,
				},
				["Zygors"] = {
					["area"] = "right",
					["bar"] = 3,
					["pos"] = 11,
				},
				["TradeSkillInfo"] = {
					["enabled"] = false,
				},
				["AtlasLoot"] = {
					["enabled"] = false,
				},
			},
			["plugins"] = {
				["launcher"] = {
					["LDB_InstanceCooldowns"] = {
						["area"] = "right",
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 2,
					},
					["BigWigs"] = {
						["pos"] = 6,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["bar"] = 3,
						["pos"] = 16,
					},
					["AutoLootToggle"] = {
						["showIcon"] = false,
						["area"] = "right",
						["bar"] = 3,
						["pos"] = 13,
					},
					["Toggle Bars"] = {
						["area"] = "right",
						["enabled"] = false,
						["pos"] = 16,
						["bar"] = 3,
					},
					["Bazooka"] = {
						["pos"] = 2,
					},
					["AtlasLoot"] = {
						["area"] = "right",
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 6,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 17,
						["bar"] = 3,
					},
					["AskMrRobot"] = {
						["pos"] = 7,
					},
					["DBM-LDB"] = {
						["pos"] = 3,
					},
				},
				["data source"] = {
					["Durability"] = {
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 12,
					},
					["Broker_GarrisonMission"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 4,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["bar"] = 3,
						["pos"] = 18,
					},
					["BugSack"] = {
						["area"] = "center",
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Broker_GarrisonBuilding"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 3,
					},
					["shLatency"] = {
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 2,
					},
					["Broker Currency"] = {
						["alignment"] = "RIGHT",
						["pos"] = 15,
						["bar"] = 3,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 11,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["shFps"] = {
						["showIcon"] = false,
						["area"] = "cright",
						["enabled"] = false,
						["bar"] = 3,
						["pos"] = 1,
					},
					["AutoTurnIn"] = {
						["pos"] = 1,
					},
					["Broker_Equipment"] = {
						["pos"] = 2,
						["showText"] = false,
						["bar"] = 3,
					},
					["GGSocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 2,
					},
				},
			},
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["bgInset"] = 4,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["fadeAlpha"] = 1,
					["fadeOutOfCombat"] = true,
					["y"] = -56.9999656677246,
					["fadeInCombat"] = true,
					["frameWidth"] = 89.999885559082,
					["pos"] = 0,
					["x"] = 334.001800537109,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["bgInset"] = 4,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0,
					["y"] = -1.00000751018524,
					["x"] = 1.00033569335938,
					["frameWidth"] = 497.000030517578,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["bgInset"] = 4,
				}, -- [3]
			},
		},
		["BazBar4"] = {
			["numBars"] = 3,
			["locked"] = true,
			["plugins"] = {
				["data source"] = {
					["Durability"] = {
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 11,
					},
					["BugSack"] = {
						["area"] = "center",
						["bar"] = 3,
						["pos"] = 1,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["Broker_GarrisonBuilding"] = {
						["pos"] = 1,
					},
					["GGSocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["bar"] = 3,
						["pos"] = 6,
					},
					["Broker Currency"] = {
						["bar"] = 3,
						["pos"] = 7,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 13,
						["bar"] = 3,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["shLatency"] = {
						["pos"] = 4,
					},
					["DailyGlobalCheck_broker"] = {
						["enabled"] = false,
						["pos"] = 14,
					},
					["Memory"] = {
						["area"] = "left",
						["enabled"] = false,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 10,
						["bar"] = 3,
					},
					["Broker_GarrisonMission"] = {
						["pos"] = 5,
					},
					["shFps"] = {
						["pos"] = 2,
					},
					["AutoTurnIn"] = {
						["pos"] = 6,
					},
					["Broker_Equipment"] = {
						["pos"] = 7,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["enabled"] = false,
						["showText"] = false,
					},
				},
				["launcher"] = {
					["LDB_InstanceCooldowns"] = {
						["pos"] = 2,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 8,
						["bar"] = 3,
					},
					["AutoLootToggle"] = {
						["pos"] = 3,
					},
					["Toggle Bars"] = {
						["pos"] = 3,
					},
					["Bazooka"] = {
						["enabled"] = false,
					},
					["AtlasLoot"] = {
						["enabled"] = false,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
						["bar"] = 3,
					},
					["AskMrRobot"] = {
						["enabled"] = false,
					},
					["DBM-LDB"] = {
						["pos"] = 4,
					},
				},
			},
			["bars"] = {
				{
					["fadeAlpha"] = 0,
					["bgInset"] = 4,
					["y"] = -71,
					["x"] = 1,
					["frameWidth"] = 497,
					["pos"] = 0,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
				}, -- [1]
				{
					["bgEnabled"] = false,
					["fadeAlpha"] = 0.22,
					["fadeOutOfCombat"] = true,
					["y"] = -206.999908447266,
					["fadeInCombat"] = true,
					["frameWidth"] = 90.0000152587891,
					["pos"] = 0,
					["point"] = "TOPRIGHT",
					["relPoint"] = "TOPRIGHT",
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["x"] = -61.9981002807617,
				}, -- [2]
				{
					["bgEnabled"] = false,
					["y"] = -1.00000751018524,
					["frameWidth"] = 497.000030517578,
					["pos"] = 0,
					["x"] = 1.00033569335938,
					["frameHeight"] = 20.0000171661377,
					["fadeAlpha"] = 0,
				}, -- [3]
			},
		},
	}
	
	
	for k,v in pairs(aegerUI_Bazooka_Install) do
		BazookaDB.profiles[k] = v
		aegerUI.db.global.addonProfileVersion.Bazooka = profileVersion
	end
	end
end