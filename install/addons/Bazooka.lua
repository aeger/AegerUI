local addonname, aegerUI = ...

function aegerUI:InstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	local Bazprofile = "Default"
		
	_G.aegerUI_Bazooka_Install = {
		[Bazprofile] = {
			["numBars"] = 4,
			["plugins"] = {
				["launcher"] = {
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 7,
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
						["area"] = "right",
						["bar"] = 3,
						["pos"] = 13,
					},
					["AtlasLoot"] = {
						["bar"] = 3,
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["area"] = "right",
						["bar"] = 3,
						["pos"] = 12,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 11,
					},
					["Parrot"] = {
						["bar"] = 4,
						["pos"] = 7,
					},
					["Prat"] = {
						["bar"] = 3,
						["pos"] = 12,
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
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 12,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
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
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["bar"] = 2,
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["area"] = "left",
						["bar"] = 4,
						["showText"] = false,
						["pos"] = 2,
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
					["x"] = -61.99810028076172,
					["frameHeight"] = 20.0000171661377,
					["attach"] = "none",
					["relPoint"] = "TOPRIGHT",
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
	}
			
	

	for k,v in pairs(aegerUI_Bazooka_Install) do
		BazookaDB.profiles[k] = v
	end
end