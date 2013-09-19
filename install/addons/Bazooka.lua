local addonname, aegerUI = ...

function aegerUI:InstallBazooka()
	if not IsAddOnLoaded("Bazooka") then return end
	
	local Bazprofile = "Default"
		
	_G.aegerUI_Bazooka_Install = {
		[Bazprofile] = {
			["numBars"] = 2,
			["plugins"] = {
				["data source"] = {
					["BugSack"] = {
						["pos"] = 5,
					},
					["SocialState"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 7,
					},
					["SOCD - Daily Reset"] = {
						["enabled"] = false,
						["pos"] = 12,
					},
					["SOCD-AltTrack"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["|cFFFFB366Ara|r Tradeskills"] = {
						["showText"] = false,
						["pos"] = 10,
					},
					["Broker_DurabilityInfo"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 10,
					},
					["Aanye_XP"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
					},
					["BagSyncLDB"] = {
						["enabled"] = false,
						["pos"] = 2,
					},
					["Broker_MoneyFu"] = {
						["showIcon"] = false,
						["area"] = "left",
						["pos"] = 9,
					},
					["Broker_MicroMenu"] = {
						["showIcon"] = false,
						["area"] = "center",
						["pos"] = 1,
						["bar"] = 2,
					},
				},
				["launcher"] = {
					["Bazooka"] = {
						["area"] = "right",
						["enabled"] = false,
						["pos"] = 2,
					},
					["AtlasLoot"] = {
						["area"] = "right",
						["pos"] = 8,
					},
					["Prat"] = {
						["enabled"] = false,
						["pos"] = 11,
					},
					["Parrot"] = {
						["enabled"] = false,
						["pos"] = 7,
					},
					["TinyDPS"] = {
						["area"] = "right",
						["pos"] = 6,
					},
					["Bartender4"] = {
						["area"] = "right",
						["enabled"] = false,
						["pos"] = 4,
					},
					["GatherMate2"] = {
						["enabled"] = false,
						["pos"] = 6,
					},
					["Breakables"] = {
						["enabled"] = false,
						["pos"] = 8,
					},
					["Zygors"] = {
						["area"] = "right",
						["pos"] = 9,
					},
					["AskMrRobot"] = {
						["area"] = "right",
						["pos"] = 7,
					},
					["AutoLootToggle"] = {
						["area"] = "right",
						["enabled"] = false,
						["pos"] = 6,
					},
					["Masque"] = {
						["area"] = "right",
						["enabled"] = false,
						["pos"] = 3,
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
	}
			
	

	for k,v in pairs(aegerUI_Bazooka_Install) do
		BazookaDB.profiles[k] = v
	end
end