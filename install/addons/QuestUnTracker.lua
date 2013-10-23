local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local profileVersion = "1.0"

function addon:InstallQuestUnTracker()
	if not IsAddOnLoaded("QuestUnTracker") then return end
	
	if addon.db.global.addonProfileVersion.QuestUnTracker ~= profileVersion then
	
		_G.aegerUI_QuestUnTracker_Install = {
			["normals"] = true,
			["dailies"] = true,
		}
		
for k,v in pairs(aegerUI_QuestUnTracker_Install) do
		QuestUnTrackerDB.global[k] = v
		addon.db.global.addonProfileVersion.QuestUnTracker = profileVersion
	end
	end
end