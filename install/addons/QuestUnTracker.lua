local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function addon:InstallQuestUnTracker()
	if not IsAddOnLoaded("QuestUnTracker") then return end
	
		_G.aegerUI_QuestUnTracker_Install = {
			["normals"] = true,
			["dailies"] = true,
		}
		
for k,v in pairs(aegerUI_QuestUnTracker_Install) do
		QuestUnTrackerDB.global[k] = v
	end
end