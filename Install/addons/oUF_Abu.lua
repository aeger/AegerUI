local AUI, aui = ...
local profileVersion = "1.0"
 
 function aui.oUF_AbuOptions()
	if not IsAddOnLoaded("oUF_Abu") then return end
	
	if aegerUI.db.global.addonProfileVersion.oUF_Abu ~= profileVersion then
		
	_G.aegerUI_oUF_Abu_Profile_Defaults = {
				["Default"] = {
					["player"] = {
					["cbposition"] = "BOTTOM/0/170",
					},
				},
	}

	for k,v in pairs(aegerUI_oUF_Abu_Profile_Defaults) do
		oUFAbuSettings[k] = v
		aegerUI.db.global.addonProfileVersion.oUF_Abu = profileVersion
	end
	end
end