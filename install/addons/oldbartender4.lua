local addonname, aegerUI = ...

function aegerUI:InstallBartender()
	if not IsAddOnLoaded("Bartender4") then return end
		
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	
		_G.aegerUI_Bartender4_Install = {
	["namespaces"] = {
		["ActionBars"] = {
			["profiles"] = {
				["aegerUI"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 40,
								["x"] = -471,
								["point"] = "BOTTOM",
							},
							["hidemacrotext"] = true,
							["padding"] = 3,
							["visibility"] = {
								["vehicle"] = false,
								["vehicleui"] = true,
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 40,
								["x"] = -4,
								["point"] = "BOTTOM",
							},
							["hidemacrotext"] = true,
						}, -- [2]
						{
							["flyoutDirection"] = "LEFT",
							["showgrid"] = true,
							["rows"] = 12,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -40,
								["point"] = "RIGHT",
								["scale"] = 0.9,
							},
							["padding"] = 6,
							["visibility"] = {
								["always"] = true,
							},
						}, -- [3]
						{
							["flyoutDirection"] = "LEFT",
							["showgrid"] = true,
							["rows"] = 12,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -75,
								["point"] = "RIGHT",
								["scale"] = 0.9,
							},
							["padding"] = 6,
							["visibility"] = {
								["always"] = true,
							},
						}, -- [4]
						{
							["showgrid"] = true,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 79,
								["x"] = -471,
								["point"] = "BOTTOM",
							},
							["hidemacrotext"] = true,
						}, -- [5]
						{
							["showgrid"] = true,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 79,
								["x"] = -4,
								["point"] = "BOTTOM",
							},
							["hidemacrotext"] = true,
						}, -- [6]
						{
						}, -- [7]
						{
						}, -- [8]
						{
						}, -- [9]
						{
						}, -- [10]
					},
				},
			},
		},
		["LibDualSpec-1.0"] = {
		},
		["ExtraActionBar"] = {
			["profiles"] = {
				["aegerUI"] = {
					["position"] = {
						["y"] = 223.0000152587891,
						["x"] = -31.50006103515625,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
			},
		},
		["MicroMenu"] = {
			["profiles"] = {
				["aegerUI"] = {
					["enabled"] = false,
					["position"] = {
						["y"] = 41.75,
						["x"] = 37.5,
						["point"] = "BOTTOM",
						["scale"] = 1,
					},
					["version"] = 3,
				},
			},
		},
		["XPBar"] = {
			["profiles"] = {
				["aegerUI"] = {
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
			},
		},
		["BlizzardArt"] = {
		},
		["BagBar"] = {
			["profiles"] = {
				["aegerUI"] = {
					["enabled"] = false,
					["onebag"] = true,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
			},
		},
		["Vehicle"] = {
			["profiles"] = {
				["aegerUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 144.0444183349609,
						["x"] = 419.789306640625,
						["point"] = "BOTTOM",
					},
					["visibility"] = {
						["vehicleui"] = true,
					},
				},
			},
		},
		["StanceBar"] = {
			["profiles"] = {
				["aegerUI"] = {
					["position"] = {
						["y"] = 136.0088500976563,
						["x"] = -465.9903259277344,
						["point"] = "BOTTOM",
						["scale"] = 1,
					},
					["padding"] = 3,
					["version"] = 3,
				},
			},
		},
		["PetBar"] = {
			["profiles"] = {
				["aegerUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 147.7422790527344,
						["x"] = -163.5,
						["point"] = "BOTTOM",
					},
				},
			},
		},
	},
	["profiles"] = {
		["aegerUI"] = {
			["blizzardVehicle"] = true,
			["minimapIcon"] = {
				["minimapPos"] = 268,
				["radius"] = 80,
				["hide"] = true,
			},
		},
	},
}
	
	for k,v in pairs(aegerUI_Bartender4_Install) do
		Bartender4DB[k] = v
	end
	
	if Bartender4DB.profileKeys[ProfileName] == nil then
		tinsert(Bartender4DB.profileKeys,ProfileName)
		Bartender4DB.profileKeys[ProfileName] = aegerUI
	elseif Bartender4DB.profileKeys[ProfileName] ~= aegerUI then
		Bartender4DB.profileKeys[ProfileName] = aegerUI
	end
	
	if aegerUI.db.profile.NumBottomBars == 1  then
		Bartender4.Bar.barregistry["6"]:SetVisibilityOption("always",true)
        Bartender4.Bar.barregistry["5"]:SetVisibilityOption("always",true)
	elseif aegerUI.db.profile.NumBottomBars == 2 then
		Bartender4.Bar.barregistry["6"]:SetVisibilityOption("always",false)
        Bartender4.Bar.barregistry["5"]:SetVisibilityOption("always",false)
	end	
end