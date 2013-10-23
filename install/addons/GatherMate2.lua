local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallGatherMate2()
	if not IsAddOnLoaded("GatherMate2") then return end
	
	if addon.db.global.addonProfileVersion.GatherMate2 ~= profileVersion then
	
	local GM2profile = "Default"
		
	_G.aegerUI_GatherMate2_Install = {
		[GM2profile] = {
				["show"] = {
				["Treasure"] = "never",
				["Herb Gathering"] = "active",
				["Fishing"] = "active",
				["Mining"] = "active",
				["Archaeology"] = "active",
			},
			["importers"] = {
				["GatherMate2_Data"] = {
					["Databases"] = {
						["Fish"] = true,
						["Treasure"] = true,
						["Archaeology"] = true,
						["Gases"] = true,
						["Mines"] = true,
						["Herbs"] = true,
					},
					["autoImport"] = true,
					["lastImport"] = 297,
				},
			},
		},
	}
	
	for k,v in pairs(aegerUI_GatherMate2_Install) do
		GatherMate2DB.profiles[k] = v
		addon.db.global.addonProfileVersion.GatherMate2 = profileVersion
	end
	end
end