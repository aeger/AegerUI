local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallMounty()
	if not IsAddOnLoaded("Mounty") then return end
	
		_G.aegerUI_Mounty_Install = {
			["Horde"] = {
		["shiftfly"] = "Albino Drake",
		["shiftserpent"] = "Azure Cloud Serpent",
		["shiftcloud"] = "None Set",
		["shiftride"] = "Amber Scorpion",
		["fly"] = "Red Flying Cloud",
		["ride"] = "Raven Lord",
		["serpent"] = "Azure Cloud Serpent",
		["cloud"] = "None Set",
		},
		["Alliance"] = {
		["shiftfly"] = "None Set",
		["shiftserpent"] = "None Set",
		["shiftcloud"] = "None Set",
		["shiftride"] = "None Set",
		["fly"] = "None Set",
		["ride"] = "None Set",
		["serpent"] = "None Set",
		["cloud"] = "None Set",
		},
		}
		
for k,v in pairs(aegerUI_Mounty_Install) do
		MOUNTY[k] = v
	end
	
		_G.aegerUI_MountyPerChar_Install = {
		["Ride"] = {
		["Shift"] = {
			["name"] = "Amber Scorpion",
			["coord"] = 3,
		},
		["nomod"] = {
			["name"] = "Raven Lord",
			["coord"] = 65,
		},
		},
		["Fly"] = {
		["Shift"] = {
			["name"] = "Albino Drake",
			["coord"] = 2,
		},
		["nomod"] = {
			["name"] = "Red Flying Cloud",
			["coord"] = 68,
		},
		},
		}
		
		
for k,v in pairs(aegerUI_MountyPerChar_Install) do
		Mounty[k] = v
	end
end