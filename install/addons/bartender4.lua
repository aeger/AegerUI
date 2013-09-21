local addonname, aegerUI = ...

function aegerUI:InstallBartender1()
	if not IsAddOnLoaded("Bartender4") then return end
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	local aUI1bar = "aegerUI1bar"
	local aUI2bar = "aegerUI2bar"

	_G.BagBarDefaults = {
		[aUI1bar] = {
			
			["enabled"] = false,
			["onebag"] = true,
			["version"] = 3,
			["position"] = {
				["y"] = 41.75,
				["x"] = 463.5,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(BagBarDefaults) do
		Bartender4DB.namespaces.BagBar.profiles[k] = v
	end

	_G.RepBarDefaults = {
		[CharName] = {
			["position"] = {
				["y"] = 9.999978772832151,
				["x"] = 361.714377491161,
				["point"] = "LEFT",
			},
			["version"] = 3,
		},
	}

	for k,v in pairs(RepBarDefaults) do
		Bartender4DB.namespaces.RepBar.profiles[k] = v
	end

	_G.XPBarDefaults = {
		[aUI1bar] = {
			["position"] = {
				["y"] = 47,
				["x"] = -512,
				["point"] = "BOTTOM",
			},
			["version"] = 3,
		},
	}

	for k,v in pairs(XPBarDefaults) do
		Bartender4DB.namespaces.XPBar.profiles[k] = v
	end

	_G.ActionBarsDefaults = {
		[aUI1bar] = {
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
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 40,
								["x"] = -4,
								["point"] = "BOTTOM",
							},
							["padding"] = 3,
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
								["scale"] = 0.9000000357627869,
							},
							["padding"] = 6,
							["visibility"] = {
								["always"] = true,
							},
						}, -- [4]
						{
							["enabled"] = false,
							["version"] = 3,
							["position"] = {
								["y"] = 83,
								["x"] = 3,
								["point"] = "BOTTOM",
							},
							["padding"] = 6,
						}, -- [5]
						{
							["enabled"] = false,
							["version"] = 3,
							["position"] = {
								["y"] = 83,
								["x"] = -510,
								["point"] = "BOTTOM",
							},
							["padding"] = 6,
						}, -- [6]
						{
						}, -- [7]
						{
						}, -- [8]
						{
							["enabled"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 76.50006103515625,
								["x"] = -231.5001831054688,
								["point"] = "CENTER",
							},
							["visibility"] = {
								["always"] = true,
							},
						}, -- [9]
						{
							["enabled"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 114.5001220703125,
								["x"] = -231.5001831054688,
								["point"] = "CENTER",
							},
							["visibility"] = {
								["always"] = true,
							},
						}, -- [10]
					},
	}
	}

	for k,v in pairs(ActionBarsDefaults) do
		Bartender4DB.namespaces.ActionBars.profiles[k] = v
	end

	_G.VehicleDefaults = {
		[aUI1bar] = {
			["version"] = 3,
			["position"] = {
				["y"] = 101.5777206420898,
				["x"] = 420.9888916015625,
				["point"] = "BOTTOM",
			},
			["visibility"] = {
				["vehicleui"] = true,
			},
		},
	}

	for k,v in pairs(VehicleDefaults) do
		Bartender4DB.namespaces.Vehicle.profiles[k] = v
	end

	_G.StanceBarDefaults = {
		[aUI1bar] = {
			["position"] = {
				["y"] = 90.564453125,
				["x"] = -468.1570434570313,
				["point"] = "BOTTOM",
				["scale"] = 1,
			},
				["padding"] = 3,
				["version"] = 3,
		},
	}

	for k,v in pairs(StanceBarDefaults) do
		Bartender4DB.namespaces.StanceBar.profiles[k] = v
	end

	_G.PetBarDefaults = {
		[aUI1bar] = {
			["version"] = 3,
			["position"] = {
				["y"] = 95.11115264892578,
				["x"] = -183.5667114257813,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(PetBarDefaults) do
		Bartender4DB.namespaces.PetBar.profiles[k] = v
	end

	_G.MicroMenuDefaults = {
		[aUI1bar] = {
			["enabled"] = false,
			["version"] = 3,
			["position"] = {
				["y"] = 41.75,
				["x"] = 37.5,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(MicroMenuDefaults) do
		Bartender4DB.namespaces.MicroMenu.profiles[k] = v
	end

	_G.BTProfilesDefaults = {
		[aUI1bar] = {
			["minimapIcon"] = {
				["minimapPos"] = 268,
				["radius"] = 80,
				["hide"] = true,
			},
			["buttonlock"] = true,
			["blizzardVehicle"] = true,
		},
	}

	for k,v in pairs(BTProfilesDefaults) do
		Bartender4DB.profiles[k] = v
	end

	if Bartender4DB.profileKeys[ProfileName] == nil then
		tinsert(Bartender4DB.profileKeys,ProfileName)
		Bartender4DB.profileKeys[ProfileName] = aUI1bar
	elseif Bartender4DB.profileKeys[ProfileName] ~= aUI1bar then
		Bartender4DB.profileKeys[ProfileName] = aUI1bar
	end
end

function aegerUI:InstallBartender2()
	if not IsAddOnLoaded("Bartender4") then return end
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	local aUI1bar = "aegerUI1bar"
	local aUI2bar = "aegerUI2bar"

	_G.BagBarDefaults = {
		[aUI2bar] = {
			["enabled"] = false,
			["onebag"] = true,
			["version"] = 3,
			["position"] = {
				["y"] = 41.75,
				["x"] = 463.5,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(BagBarDefaults) do
		Bartender4DB.namespaces.BagBar.profiles[k] = v
	end

	_G.RepBarDefaults = {
		[CharName] = {
			["position"] = {
				["y"] = 9.999978772832151,
				["x"] = 361.714377491161,
				["point"] = "LEFT",
			},
			["version"] = 3,
		},
	}

	for k,v in pairs(RepBarDefaults) do
		Bartender4DB.namespaces.RepBar.profiles[k] = v
	end

	_G.XPBarDefaults = {
		[aUI2bar] = {
			["position"] = {
				["y"] = 47,
				["x"] = -512,
				["point"] = "BOTTOM",
			},
			["version"] = 3,
		},
	}

	for k,v in pairs(XPBarDefaults) do
		Bartender4DB.namespaces.XPBar.profiles[k] = v
	end

	_G.ActionBarsDefaults = {
		[aUI2bar] = {
			["actionbars"] = {
				{
					["showgrid"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 40,
								["x"] = -471,
								["point"] = "BOTTOM",
							},
							["padding"] = 3,
							["hidemacrotext"] = true,
							["visibility"] = {
								["vehicle"] = false,
								["vehicleui"] = true,
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 40,
								["x"] = -4,
								["point"] = "BOTTOM",
							},
							["padding"] = 3,
						}, -- [2]
						{
							["flyoutDirection"] = "LEFT",
							["showgrid"] = true,
							["rows"] = 12,
							["padding"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -40,
								["point"] = "RIGHT",
								["scale"] = 0.9,
							},
							["hidemacrotext"] = true,
							["visibility"] = {
								["always"] = true,
							},
						}, -- [3]
						{
							["flyoutDirection"] = "LEFT",
							["showgrid"] = true,
							["rows"] = 12,
							["padding"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -75,
								["point"] = "RIGHT",
								["scale"] = 0.9,
							},
							["hidemacrotext"] = true,
							["visibility"] = {
								["always"] = true,
							},
						}, -- [4]
						{
							["showgrid"] = true,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 79,
								["x"] = -471,
								["point"] = "BOTTOM",
							},
							["padding"] = 3,
						}, -- [5]
						{
							["showgrid"] = true,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 79,
								["x"] = -4,
								["point"] = "BOTTOM",
							},
							["padding"] = 3,
						}, -- [6]
						{
						}, -- [7]
						{
						}, -- [8]
						{
							["enabled"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 76.50006103515625,
								["x"] = -231.5001831054688,
								["point"] = "CENTER",
							},
							["visibility"] = {
								["always"] = true,
							},
						}, -- [9]
						{
							["enabled"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 114.5001220703125,
								["x"] = -231.5001831054688,
								["point"] = "CENTER",
							},
							["visibility"] = {
								["always"] = true,
							},
						}, -- [10]
					},
	}
	}

	for k,v in pairs(ActionBarsDefaults) do
		Bartender4DB.namespaces.ActionBars.profiles[k] = v
	end

	_G.VehicleDefaults = {
		[aUI2bar] = {
			["visibility"] = {
				["vehicleui"] = true,
			},
			["version"] = 3,
			["position"] = {
				["y"] = 144.0444183349609,
				["x"] = 419.789306640625,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(VehicleDefaults) do
		Bartender4DB.namespaces.Vehicle.profiles[k] = v
	end

	_G.StanceBarDefaults = {
		[aUI2bar] = {
			["position"] = {
				["y"] = 136.0088500976563,
				["x"] = -465.9903259277344,
				["point"] = "BOTTOM",
				["scale"] = 1,
			},
				["padding"] = 3,
				["version"] = 3,
		},
	}

	for k,v in pairs(StanceBarDefaults) do
		Bartender4DB.namespaces.StanceBar.profiles[k] = v
	end

	_G.PetBarDefaults = {
		[aUI2bar] = {
			["version"] = 3,
			["position"] = {
				["y"] = 147.7422790527344,
				["x"] = -163.5,
				["point"] = "BOTTOM",
			},
		},
	}

	for k,v in pairs(PetBarDefaults) do
		Bartender4DB.namespaces.PetBar.profiles[k] = v
	end

	_G.MicroMenuDefaults = {
		[aUI2bar] = {
			["enabled"] = false,
			["version"] = 3,
			["position"] = {
				["y"] = 41.75,
				["x"] = 37.5,
				["point"] = "BOTTOM",
				["scale"] = 1,
			},
		},
	}

	for k,v in pairs(MicroMenuDefaults) do
		Bartender4DB.namespaces.MicroMenu.profiles[k] = v
	end

	_G.BTProfilesDefaults = {
		[aUI2bar] = {
			["minimapIcon"] = {
				["minimapPos"] = 268,
				["radius"] = 80,
				["hide"] = true,
			},
			["blizzardVehicle"] = true,
			["buttonlock"] = true,
		},
	}

	for k,v in pairs(BTProfilesDefaults) do
		Bartender4DB.profiles[k] = v
	end
end