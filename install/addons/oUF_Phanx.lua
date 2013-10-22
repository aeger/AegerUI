local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstalloUF_Phanx()
	if not IsAddOnLoaded("oUF_Phanx") then return end
	
		_G.aegerUI_oUF_Phanx_Install = {
		["backdropColor"] = {
		0.125, -- [1]
		0.125, -- [2]
		0.125, -- [3]
		1, -- [4]
	},
	["healthColor"] = {
		0.08, -- [1]
		0.08, -- [2]
		0.08, -- [3]
	},
	["powerHeight"] = 0.2,
	["statusbar"] = "Interface\\AddOns\\oUF_Phanx\\media\\Neal",
	["fontOutline"] = "OUTLINE",
	["borderColor"] = {
		0, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["healthColorMode"] = "CUSTOM",
	["powerColorMode"] = "CLASS",
	["powerColor"] = {
		0.8, -- [1]
		0.8, -- [2]
		0.8, -- [3]
	},
	["dispelFilter"] = true,
	["backdrop"] = {
		["bgFile"] = "Interface\\BUTTONS\\WHITE8X8",
	},
	["PVP"] = false,
	["eclipseBar"] = true,
	["threatLevels"] = true,
	["ignoreOwnHeals"] = false,
	["druidMana"] = false,
	["width"] = 220,
	["totemBars"] = true,
	["font"] = "Interface\\AddOns\\oUF_Phanx\\media\\PTSans-Bold.ttf",
	["healthBG"] = 2,
	["eclipseBarIcons"] = false,
	["height"] = 30,
	["runeBars"] = true,
	["powerBG"] = 0.25,
	["borderSize"] = 16,
		}
		
for k,v in pairs(aegerUI_oUF_Phanx_Install) do
		oUFPhanxConfig[k] = v
	end
end