local addonname, aegerUI = ...
	
function aegerUI:InstallParrot()
	if not IsAddOnLoaded("Parrot") then return end
			
	_G.aegerUI_Parrot_Install = {
		["CombatEvents"] = {
			["CombatEvents"] = {
			["profiles"] = {
				["Default"] = {
					["dbver"] = 5,
				},
			},
		},
		["Suppressions"] = {
		},
		["ScrollAreas"] = {
			["profiles"] = {
				["Default"] = {
					["areas"] = {
						["Notification"] = {
							["stickyDirection"] = "UP;CENTER",
							["direction"] = "UP;CENTER",
							["stickyAnimationStyle"] = "Pow",
							["xOffset"] = 0,
							["size"] = 150,
							["animationStyle"] = "Straight",
							["yOffset"] = 249.0000610351563,
						},
						["Incoming"] = {
							["stickyDirection"] = "DOWN;RIGHT",
							["direction"] = "DOWN;LEFT",
							["stickyAnimationStyle"] = "Pow",
							["iconSide"] = "RIGHT",
							["xOffset"] = -275.9993286132813,
							["size"] = 260,
							["animationStyle"] = "Parabola",
							["yOffset"] = 40.00018310546875,
						},
						["Outgoing"] = {
							["stickyDirection"] = "DOWN;LEFT",
							["direction"] = "DOWN;RIGHT",
							["stickyAnimationStyle"] = "Pow",
							["xOffset"] = 270.99951171875,
							["size"] = 260,
							["animationStyle"] = "Parabola",
							["yOffset"] = 41.0001220703125,
						},
					},
				},
			},
		},
		["Cooldowns"] = {
			["profiles"] = {
				["Default"] = {
					["threshold"] = 20,
				},
			},
		},
		["Display"] = {
		},
		["Triggers"] = {
			["profiles"] = {
				["Default"] = {
					["dbver"] = 9,
				},
			},
		},
	},
}

	for k,v in pairs(aegerUI_Parrot_Install) do
		ParrotDB.namespaces[k] = v
	end

	_G.aegerUI_ParrotProfiles = {
		["profiles"] = {
			["Default"] = {
		},
	},
	}

	for k,v in pairs(aegerUI_ParrotProfiles ) do
		ParrotDB[k] = v
	end
end