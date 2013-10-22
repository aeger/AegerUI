local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallBartender()
	if not IsAddOnLoaded("Bartender4") then return end
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	local aUI1bar = "aegerUI"
	
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

	if addon.db.profile.NumBottomBars == 1 then
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
								["scale"] = 0.95,
							},
							["padding"] = 3,
							["visibility"] = {
								["always"] = true,
								["vehicleui"] = false,
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
								["scale"] = 0.95,
							},
							["padding"] = 3,
							["visibility"] = {
								["always"] = true,
								["vehicleui"] = false,
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
							["visibility"] = {
								["always"] = true,
							},
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
							["visibility"] = {
								["always"] = true,
							},
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
	}
	}
	
	for k,v in pairs(ActionBarsDefaults) do
		Bartender4DB.namespaces.ActionBars.profiles[k] = v
	end
	end
	
	if addon.db.profile.NumBottomBars == 2 then
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
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -40,
								["point"] = "RIGHT",
								["scale"] = 0.95,
							},
							["hidemacrotext"] = true,
							["visibility"] = {
								["always"] = true,
								["vehicleui"] = false,
							},
						}, -- [3]
						{
							["flyoutDirection"] = "LEFT",
							["showgrid"] = true,
							["rows"] = 12,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 200,
								["x"] = -75,
								["point"] = "RIGHT",
								["scale"] = 0.95,
							},
							["hidemacrotext"] = true,
							["visibility"] = {
								["always"] = true,
								["vehicleui"] = false,
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
						}, -- [9]
						{
						}, -- [10]
					},
	}
	}

	for k,v in pairs(ActionBarsDefaults) do
		Bartender4DB.namespaces.ActionBars.profiles[k] = v
	end
	end

	_G.VehicleDefaults = {
		[aUI1bar] = {
			["version"] = 3,
			["position"] = {
				["y"] = 122,
				["x"] = 426,
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
				["y"] = 122,
				["x"] = -470,
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
				["y"] = 122,
				["x"] = -179,
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
			["buttonlock"] = false,
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