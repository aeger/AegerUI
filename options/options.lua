-------------------------------------------------------------------------------
--  aegerUI 5.4.6 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------
	
--  Namespace -----------------------------------------------------------------	
	local FOLDER_NAME, private = ...

	local LibStub = _G.LibStub
	local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
	
	local AceConfig 	= LibStub("AceConfig-3.0")
	local AceConfigReg 	= LibStub("AceConfigRegistry-3.0")
	local AceConfigDialog 	= LibStub("AceConfigDialog-3.0")
	
-- Define locals and local functions up here so they're in scope for the whole file
    local GetAddOnMetadata = GetAddOnMetadata
	local db
	
--  Options -------------------------------------------------------------------	
	local modularOptions = {}
	
	local function giveProfiles()
		return LibStub("AceDBOptions-3.0"):GetOptionsTable(addon.db)
	end
	
	local options
	
	local function fullOptions()
		if not options then
			options = {
				type = "group",
				name = private.addon_name,
				args = {
					general = {
						order = 1,
						type = "group",
						name = "Main Options",
						desc = "MAIN_OPTIONS_DESC",
						args = {
							version = {
							order = 11,
							type = "description",
							name = _G.GAME_VERSION_LABEL .. ": " .. addon.version .. "\n",
							},
							spacer1 = {
							order = 12,
							type = "description",
							name = "\n",
							},
							header1 = {
							order = 15,
							type = "header",
							name = "Global Options",
							},
							global_desc = {
							order = 20,
							type = "description",
							name = "Set global options for aegerUI" .. "\n",
							},
							disableminimap = {
							order = 25,
							name = "Minimap enabled",
							type = "toggle",
							confirm = true,
							confirmText = "Disabling the Minimap will reload your UI, are you sure? You will need to exit wow and re-login to fully restore the Minimap",
							get = function()
								return addon.db.global.MiniMapEnabled
							end,
							set = function(info, value)
								addon.db.global.MiniMapEnabled = value
								ReloadUI()
							end,
							},
							WatchFrame_Position = {
							order = 30,
							name = L["Watchframe Position"],
							type = "select",
							confirm = true,
							confirmText = L["Changes to Watchframe position will reload your UI, are you sure?"],
							get = function()
								return addon.db.global.WatchFrame_Position
							end,
							set = function(info, value)
								addon.db.global.WatchFrame_Position = value
								ReloadUI()
							end,
							values = { 
								RIGHT = L["Right"],
								LEFT = L["Left"],
							},
							style = "dropdown",
							},
							spacer2 = {
								order = 40,
								type = "description",
								width = "full",
								name = "\n\n",
							},
							resetHeader = {
							order = 50,
							type = "header",
							name = "Reinstall aegerUI",
							},
							install_desc = {
							order = 55,
							type = "description",
							name = "Reinstalls all addon options. This will overwrite any modifications you made!" .. "\n",
							},
							install = {
								type = "execute",
								name = L["Reinstall aegerUI"],
							order = 60,
							func = function()
								addon:DoSetup()
							end,
							},
						},
					},
				},
			}
			for k, v in pairs(modularOptions) do
			options.args[k] = (type(v) == "function") and v() or v
		end
	end
	return options
end
	
	function addon:ChatCommands(input)
		if InCombatLockdown() then
		self:Print(L["Cannot access options during combat."])
		return
	end
	if not input or input:trim() == "" then
		LibStub("AceConfigDialog-3.0"):Open("addon")
	else
		 LibStub("AceConfigCmd-3.0").HandleCommand("aui", "addon", input)
	end
	end
	
	function addon:SetupOptions()
		AceConfigReg:RegisterOptionsTable(private.addon_name, fullOptions)
		self.optionsFrame = AceConfigDialog:AddToBlizOptions(private.addon_name, nil, nil, "general")
		self:RegisterModuleOptions("Profiles", giveProfiles(), L["Profile Options"])
		addon:RegisterChatCommand( "aui", "ChatCommands")
		addon:RegisterChatCommand( "aegerUI", "ChatCommands")
	end
	
	function addon:RegisterModuleOptions(name, optionsTable, displayName)
	modularOptions[name] = optionsTable
	self.optionsFrame[name] = AceConfigDialog:AddToBlizOptions(private.addon_name, displayName, private.addon_name, name)
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	