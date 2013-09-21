local addonname, aegerUI = ...

function aegerUI:InstallQuestUnTracker()
	if not IsAddOnLoaded("QuestUnTracker") then return end
	
		_G.aegerUI_QuestUnTracker_Install = {
			["normals"] = true,
			["dailies"] = true,
		}
		
for k,v in pairs(aegerUI_QuestUnTracker_Install) do
		QuestUnTrackerDB.global[k] = v
	end
end