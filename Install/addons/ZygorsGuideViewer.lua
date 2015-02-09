local AUI, aui = ...
local profileVersion = "1.1"
 
 function aui.InstallZygorsGuideViewer()
	if not IsAddOnLoaded("ZygorGuidesViewer") then return end
	
	if aegerUI.db.profile.addonProfileVersionPC.ZygorGuidesViewer ~= profileVersion then
	
	local CharName = UnitName("player")
	local ServerName = GetRealmName()
	local ProfileName = CharName.." - "..ServerName
	
	_G.aegerUI_ZG_Profile_Defaults = {
			["default"] = {
			["dispmode"] = {
				["showborder"] = true,
			},
			["load_im"] = true,
			["im_town_alert"] = false,
			["skinstyle"] = "stealth",
			["dispprimary"] = {
				["showborder"] = true,
			},
			["magickey_bind"] = "",
			["foglight"] = false,
			["show_ui"] = true,
			["frame_positions"] = {
				["ZygorGuidesViewerViewer"] = {
				},
			},
			["load_gold"] = true,
			["skipauxsteps"] = true,
			["customcolorants"] = true,
			["detectcreatures"] = false,
			["enable_viewer"] = false,
			["frame_anchor"] = {
				"RIGHT", -- [1]
				{
					[0] = nil --[[ skipped userdata ]],
					["firstTimeLoaded"] = 1,
				}, -- [2]
				"RIGHT", -- [3]
				-400, -- [4]
				-100, -- [5]
			},
			["showmapbutton"] = false,
			["fullness_search"] = 1,
			["debug_flags"] = {
				["LibRover"] = {
					["enabled"] = true,
					["color"] = "ffffbb00",
				},
				["startup"] = {
					["enabled"] = true,
					["color"] = "ffff3300",
				},
				["waypoints"] = {
					["enabled"] = true,
					["color"] = "ff66ff00",
				},
				["display"] = {
					["enabled"] = false,
				},
				["pointer"] = {
					["enabled"] = true,
					["color"] = "ff00ff00",
				},
				["sticky"] = {
					["enabled"] = true,
					["color"] = "ffff5500",
				},
			},
			["tmp__was_sheened"] = true,
			["mv_enabled"] = false,
			["minicons"] = true,
			["showgreysellbutton"] = false,
			["load_mail"] = true,
			["stickycolored"] = false,
			["showborder"] = true,
			["im_always_wait"] = false,
			["n_nc_enabled"] = false,
			["skin"] = "default",
			["ranconfig2"] = true,
			["Inventory Manager"] = {
				["lastParentName"] = "Blizzard",
				["showText"] = false,
				["isSnapped"] = true,
				["lastParent"] = {
					["FilterIcon"] = {
						["Icon"] = {
						},
					},
					["PortraitButton"] = {
						["Highlight"] = {
						},
					},
					["Portrait"] = {
					},
					["ClickableTitleFrame"] = {
					},
					["bags"] = {
					},
					["FilterDropDown"] = {
						["displayMode"] = "MENU",
					},
					["bagsShown"] = 0,
				},
				["isSnappedSize"] = 169,
				["im_lastWidth"] = 169,
			},
			["load_betaguides"] = true,
			["quiet"] = true,
			["visible"] = false,
		},
}

	for k,v in pairs(aegerUI_ZG_Profile_Defaults) do
		ZygorGuidesViewerSettings.profiles[k] = v
		aegerUI.db.profile.addonProfileVersionPC.ZygorGuidesViewer = profileVersion
	end
	end
				
	ZygorGuidesViewer.db:SetProfile("default")
end