local AUI, aui = ...
local profileVersion = "1.1"

function aui.InstallAtlasLoot()
	if not IsAddOnLoaded("AtlasLoot") then return end
	
	if aegerUI.db.global.addonProfileVersion.AtlasLoot ~= profileVersion then
				
	_G.aegerUI_AtlasLoot_Install = {
		["MiniMapButton"] = {
		["point"] = {
			"CENTER", -- [1]
			nil, -- [2]
			"CENTER", -- [3]
			-74.7203598022461, -- [4]
			-28.5809211730957, -- [5]
		},
		["shown"] = false,
	},
}
		
for k,v in pairs(aegerUI_AtlasLoot_Install) do
		AtlasLootCharDB[k] = v
		aegerUI.db.global.addonProfileVersion.AtlasLoot = profileVersion
	end
	end
end