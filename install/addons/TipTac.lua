local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallTipTac()
	if not IsAddOnLoaded("TipTac") then return end
	
	if addon.db.global.addonProfileVersion.TipTac ~= profileVersion then
	
		_G.aegerUI_TipTac_Install = {
			["fontFace"] = "Fonts\\FRIZQT__.TTF",
			["classification_elite"] = "+%s ",
			["barHeight"] = 6,
			["overrideFade"] = false,
			["tipBackdropEdge"] = "Interface\\Tooltips\\UI-Tooltip-Border",
			["optionsLeft"] = 701.9999389648438,
			["backdropEdgeSize"] = 16,
			["showTarget"] = "first",
			["powerBar"] = false,
			["fontFlags"] = "",
			["tipColor"] = {
				0.1, -- [1]
				0.1, -- [2]
				0.1, -- [3]
				0.8, -- [4]
			},
			["hideDefaultBar"] = false,
			["healthBar"] = false,
			["colRace"] = "|cffffffff",
			["showDebuffs"] = false,
			["classification_normal"] = "%s ",
			["colLevel"] = "|cffc0c0c0",
			["healthBarClassColor"] = true,
			["reactColoredBorder"] = false,
			["classification_minus"] = "-%s ",
			["barFontFlags"] = "OUTLINE",
			["fontSize"] = 12,
			["classification_rare"] = "%s|r (Rare) ",
			["enableChatHoverTips"] = true,
			["colorGuildByReaction"] = true,
			["showBuffs"] = false,
			["left"] = 1670.000732421875,
			["fontSizeDelta"] = 2,
			["preFadeTime"] = 0.1,
			["reactColoredBackdrop"] = false,
			["optionsBottom"] = 506.9999389648438,
			["classification_trivial"] = "~%s ",
			["classification_worldboss"] = "%s|r (Boss) ",
			["tipBorderColor"] = {
				0.8, -- [1]
				0.8, -- [2]
				0.9, -- [3]
				1, -- [4]
			},
			["hideWorldTips"] = false,
			["gradientTip"] = false,
			["backdropInsets"] = 4,
			["manaBar"] = false,
			["gradientColor"] = {
				0.8, -- [1]
				0.8, -- [2]
				0.8, -- [3]
				0.2, -- [4]
			},
			["colSameGuild"] = "|cffff32ff",
			["showGuildRank"] = true,
			["fadeTime"] = 0.1,
			["targetYouText"] = "[YOU]",
			["classColoredBorder"] = false,
			["top"] = 171.0000915527344,
			["healthBarColor"] = {
				0.3, -- [1]
				0.9, -- [2]
				0.3, -- [3]
				1, -- [4]
			},
			["barFontFace"] = "Fonts\\ARIALN.TTF",
			["classification_rareelite"] = "+%s|r (Rare) ",
			["colorNameByClass"] = false,
			["barFontSize"] = 12,
			["tipBackdropBG"] = "Interface\\Tooltips\\UI-Tooltip-Background",
			["healthBarText"] = "value",
		}
		
for k,v in pairs(aegerUI_TipTac_Install) do
		TipTac_Config[k] = v
		addon.db.global.addonProfileVersion.TipTac = profileVersion
	end
	end
end