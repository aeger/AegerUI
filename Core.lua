local AUI, aui = ...
aegerUI = LibStub("AceAddon-3.0"):NewAddon("aegerUI", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
local media = LibStub("LibSharedMedia-3.0")
aegerUI:SetDefaultModuleState(false)
local CharName = UnitName("player")
local versionNumber  = "6.0.3";
local AUI_Beta = false;

-- Event Handler
local eventframe = CreateFrame("Frame")
eventframe:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		for _, func in pairs(self[event]) do
			func(event, ...)
		end
	end
end)

function aui.RegisterEvent(event, func)
	assert(type(event) == "string")
	if not eventframe[event] then
		eventframe[event] = {}
	end
	table.insert(eventframe[event], func)
	return eventframe:RegisterEvent(event)
end

function aui.UnregisterEvent(event, func) 
	if not eventframe[event] then return; end
	if func and eventframe[event][func]  then
		eventframe[event][func] = nil
	end
	if #eventframe[event] == 0 then
		eventframe:UnregisterEvent(event)
	end
end

-- Modules
aegerUI_BottomButtons = aegerUI:NewModule("BottomButtons");
aegerUI_Durability = aegerUI:NewModule("Durability");
aegerUI_SetupUI = aegerUI:NewModule("SetupUI");
aegerUI_MiniMap = aegerUI:NewModule("MiniMap");
aegerUI_TopMenu = aegerUI:NewModule("TopMenu");
aegerUI_ToolTips = aegerUI:NewModule("ToolTips");
aegerUI_HelmCloakBtn = aegerUI:NewModule("HelmCloakBtn");
aegerUI_recolor = aegerUI:NewModule("Recolor");
aegerUI_FollowMe = aegerUI:NewModule("FollowMe");

-- Plugins
aegerUI_AutoLoot = aegerUI:NewModule("AutoLoot");
aegerUI_BDurability = aegerUI:NewModule("BDurability");
aegerUI_Sidebar = aegerUI:NewModule("Sidebar");
aegerUI_TinyDPS = aegerUI:NewModule("TinyDPS");
aegerUI_Zygors = aegerUI:NewModule("Zygors");

-- DB default values
local defaults = {
	global = {
	  AutoLootSolo = true,
	  AutoLootGroup = false,
	  AutoLootRaid = false,
	  BottomButtons = true,
	  StartUpMessage = true,
	  Durability = true,
	  MiniMapEnabled = true,
	  ShowMinimapIcon = true,
	  ShowHelmCloakBtn = true,
	  Recolor = true,
	  ToolTips = true,
	  addonProfileVersion = {},
	  Automation = {
		AcceptInvites = true,
		AutoDepositRegs = true,
		AutoFollowWhisper = true,
		AutoRepair = true,
		AutoSell = true,
		BlockPartyInvites = false,
		FollowKeyWord = followme,
		GuildRepair = true,
		HideBodyGuard = true,
		HideErrors = true,
		InviteFromWhisper = true,
		ShowErrorsFlag = 1,
		ShowQuestUpdates = true,
		WhisperKeyWord = invitemedumbass,
	  },
	  BrokerPlugins = {
		AutoLoot = true,
		BDurability = true,
		Sidebar = false,
		TinyDPS = true,
		Zygors = true,
	  },
	  ToolTips = {
		ShowTitle = false,
		RoleIcon = true,
		ShowGuildRanks = true,
		FontSize = 13,
		Position = {'BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -57, 190},
		["Colors"] = {
			Border = { 0.9, 0.9, 0.8 },
		},
		["Fonts"] = {
			Damage = 'Interface\\AddOns\\aegerUI\\Media\\Font\\Defused.ttf',
			Normal = 'Interface\\AddOns\\aegerUI\\Media\\Font\\ExpresswayFree.ttf',
			Actionbar = 'Interface\\AddOns\\aegerUI\\Media\\Font\\AccPrec.ttf',
		},
		["Statusbar"] = {
			Normal = 'Interface\\AddOns\\aegerUI\\Media\\ToolTips\\statusbarTex.tga',
			Light = 'Interface\\AddOns\\aegerUI\\Media\\ToolTips\\tex.tga',
		},
	  },
	},
	profile = {
      AUIFrameColor = {0.5, 0.5, 0.4, 1},
	  SetUpDone = false,
	  TopMenuShow = true,
	  NumBottomBars = 1,
	  ShowBazBar = 1,
	  SideBars = 1,
	  SideBar1Show = true,
	  addonProfileVersionPC = {},
	  Automation = {
		BlockDuel = false,
		BlockPetDuel = false,
		AcceptRez = false,
		AcceptSummon = false,
	  },
	},
}

-- Handle Chat commands	
function aegerUI:ChatCommands(input)
	if InCombatLockdown() then
		self:Print("Cannot access options during combat.")
	return end
	if not input or input:trim() == "" then
		LibStub("AceConfigDialog-3.0"):Open("aegerUI")
	else
	 LibStub("AceConfigCmd-3.0").HandleCommand(aegerUI, "aui", "aegerUI", input)
	end
end

function aegerUI:OnInitialize() 
	self.db = LibStub("AceDB-3.0"):New("aegerUIdb", defaults)
	local version = _G.GetAddOnMetadata("aegerUI", "Version")
	self.version = version
	self:SetupOptions()
	aegerUI:RegisterChatCommand( "aui", "ChatCommands")
	aegerUI:RegisterChatCommand( "aegerUI", "ChatCommands")
end

aegerUI:EnableModule("TopMenu")

local function BrokerPluginCheck()
	if aegerUI.db.global.BrokerPlugins.AutoLoot then
		aegerUI:EnableModule("AutoLoot")
	end
	if aegerUI.db.global.BrokerPlugins.BDurability then
		aegerUI:EnableModule("BDurability")
	end
	if aegerUI.db.global.BrokerPlugins.Sidebar then
		aegerUI:EnableModule("Sidebar")
	end
	if aegerUI.db.global.BrokerPlugins.TinyDPS then
		aegerUI:EnableModule("TinyDPS")
	end
	if aegerUI.db.global.BrokerPlugins.Zygors then
		aegerUI:EnableModule("Zygors")
	end
end

local function ModuleChecks()
	if aegerUI.db.global.BottomButtons then
		aegerUI:EnableModule("BottomButtons")
	end
	if aegerUI.db.global.Durability then
		aegerUI:EnableModule("Durability")
	end
	if aegerUI.db.global.Automation.AutoFollowWhisper then
		aegerUI:EnableModule("FollowMe")
	end
	if aegerUI.db.global.MiniMapEnabled then
		aegerUI:EnableModule("MiniMap")
	end
	if aegerUI.db.global.ToolTips then
		aegerUI:EnableModule("ToolTips")
	end
	if aegerUI.db.global.ShowHelmCloakBtn then
		aegerUI:EnableModule("HelmCloakBtn")
	end
	if aegerUI.db.global.Recolor then
		aegerUI:EnableModule("Recolor")
	end
end

local function StartupMsg()
	if aegerUI.db.global.StartUpMessage then
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Welcome back|r|cFFFF0000 "..CharName.."|r|cFF00FF00 type |r/aui |cFF00FF00for aegerUI options", 1.0, 1.0, 1.0, nil, true);
	end
end

-- Determine if Install is needed.
local function SetVersion( version )
	if AUI_Beta then return version.." (Beta)";
		else
	return version.." (Release)";
	end
end
aegerUI_Version = SetVersion( versionNumber );

local function SetupCheck()
	if aegerUI.db.profile.SetUpDone == false then
		aegerUI:EnableModule("SetupUI")
		aui.DoSetup()
    end
	if aegerUI.db.profile.Version ~= aegerUI_Version then
		aegerUI:EnableModule("SetupUI")
		aui.DoSetup()
	end
	--check for minimap toggle
	if aegerUI.db.global.ShowMinimapIcon and aegerUI_MinimapButton and not aegerUI_MinimapButton:IsVisible() then
		aegerUI_MinimapButton:Show()
	elseif not aegerUI.db.global.ShowMinimapIcon and aegerUI_MinimapButton and aegerUI_MinimapButton:IsVisible() then
		aegerUI_MinimapButton:Hide()
	end
	BrokerPluginCheck()
	ModuleChecks()
	StartupMsg()
end
aui.RegisterEvent("PLAYER_LOGIN", SetupCheck)

function aui.Print(...)
	if (not ...) then return; end
	local s = ""
	local t = {...}
	for i = 1, #t do
		s = s .. " " .. t[i]
	end
	return print("|cffffcf00AegerUI:|r"..s)
end


	

