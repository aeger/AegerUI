local addonname, aegerUI = ...

function aegerUI:InstallRaven()
	if not IsAddOnLoaded("Raven") then return end
	
		local CharName = UnitName("player")
		local ServerName = GetRealmName()
		local ProfileName = CharName.." - "..ServerName
	
		_G.aegerUI_Raven_InstallGlobal = {
			["Minimap"] = {
				["hide"] = true,
			},
		}
		
		for k,v in pairs(aegerUI_Raven_InstallGlobal) do
		RavenDB.global[k] = v
		end
	
		_G.aegerUI_Raven_Install = {
		[ProfileName] = {
			["BarGroups"] = {
				["Target"] = {
					["backdropFill"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["name"] = "Target",
					["minimumDuration"] = false,
					["auto"] = true,
					["pointYT"] = 0.6885596364830454,
					["detectBuffs"] = true,
					["pointW"] = 164.9777374267578,
					["checkDuration"] = true,
					["filterDuration"] = 300,
					["bars"] = {
					},
					["borderColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["pointX"] = 0.6118518193562825,
					["detectDebuffs"] = true,
					["detectDebuffsMonitor"] = "target",
					["pointH"] = 14.9333438873291,
					["pointXR"] = 0.3022222757339478,
					["detectBuffsMonitor"] = "target",
					["backdropColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["pointY"] = 0.2976131916880506,
				},
				["Short Buffs"] = {
					["backdropFill"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["pointH"] = 14.9333438873291,
					["name"] = "Short Buffs",
					["minimumDuration"] = false,
					["auto"] = true,
					["pointYT"] = 0.6872427463240726,
					["detectBuffs"] = true,
					["pointW"] = 164.9777984619141,
					["checkDuration"] = true,
					["bars"] = {
					},
					["pointX"] = 0.3014814694722494,
					["borderColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["configuration"] = 7,
					["pointXR"] = 0.6125925938288371,
					["detectBuffsCastBy"] = "anyone",
					["backdropColor"] = {
						["a"] = 1,
						["b"] = 1,
						["g"] = 1,
						["r"] = 1,
					},
					["pointY"] = 0.2989300818470235,
				},
			},
			["Durations"] = {
				[104510] = 12,
				[55078] = 30,
				[81326] = 30,
				[3714] = 600.005,
				[104423] = 12,
				[146296] = 20,
				[108211] = 3600.018,
				[84746] = 15,
				[71401] = 15,
				[148447] = 20,
				[51460] = 3.668,
				[104509] = 12,
				[51124] = 10,
				[84617] = 25.912,
				[93068] = 15,
				[130735] = 5,
				[57330] = 3600.011,
				[101568] = 15,
				[55095] = 30.784,
				[92055] = 20,
				[2818] = 14.499,
				[5171] = 18.867,
				[84745] = 15,
				[31224] = 5,
				[53365] = 15,
				[112961] = 10,
				[59052] = 15,
				[2823] = 3600.018,
			},
			["hideConsolidated"] = false,
			["hideBlizz"] = false,
		},	
		}
		
for k,v in pairs(aegerUI_Raven_Install) do
		RavenDB.profiles[k] = v
	end
	
	--if RavenDB.profileKeys[ProfileName] == nil then
	--	tinsert(RavenDB.profileKeys,ProfileName)
	--	RavenDB.profileKeys[ProfileName] = aegerUIRaven
	--elseif RavenDB.profileKeys[ProfileName] ~= aegerUIRaven then
		--RavenDB.profileKeys[ProfileName] = aegerUIRaven
	--end --]
	
end