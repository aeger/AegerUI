local AUI, aui = ...
local profileVersion = "1.1"
 
 function aui.PetTrackerOptions()
	if not IsAddOnLoaded("PetTracker") then return end
	
	if aegerUI.db.global.addonProfileVersion.PetTracker ~= profileVersion then
		
	_G.aegerUI_PT_Profile_Defaults = {
				["TamerHistory"] = {
				},
				["MainTutorial"] = 4,
				["JournalTutorial"] = 1,
	}

	for k,v in pairs(aegerUI_PT_Profile_Defaults) do
		PetTracker_Sets[k] = v
		aegerUI.db.global.addonProfileVersion.PetTracker = profileVersion
	end
	end
end