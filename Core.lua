local AUI, aui = ...
aegerUI = LibStub("AceAddon-3.0"):NewAddon("aegerUI", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
local media = LibStub("LibSharedMedia-3.0")
aegerUI:SetDefaultModuleState(false)
local CharName = UnitName("player")
local versionNumber  = "6.0.3";
local AUI_Beta = false;
BINDING_HEADER_aegerUI = "aegerUI"

-- Modules
aegerUI_ActionBars = aegerUI:NewModule("ActionBars");
aegerUI_BottomButtons = aegerUI:NewModule("BottomButtons");
aegerUI_BuffFrame = aegerUI:NewModule("BuffFrame");
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
		ActionBars = true,
	  AutoLootSolo = true,
	  AutoLootGroup = false,
	  AutoLootRaid = false,
	  BottomButtons = true,
	  StartUpMessage = true,
	  Durability = true,
	  MiniMapEnabled = true,
	  ShowMinimapIcon = false,
	  ShowHelmCloakBtn = true,
	  Recolor = true,
	  ToolTips = true,
	  addonProfileVersion = {},
	  ActionBarOptions = {
	  	color = {   -- Red, Green, Blue
        Normal = { 1, 1, 1 },
        IsEquipped = { 0, 1, 0 },

        OutOfRange = { 0.9, 0, 0 },
        OutOfMana = { 0.3, 0.3, 1 },

        NotUsable = { 0.35, 0.35, 0.35 },

        HotKeyText = { 0.6, 0.6, 0.6 },
        MacroText = { 1, 1, 1 },
        CountText = { 1, 1, 1 },
    },
	  },
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
			RareAlert = true,
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
	  BuffFrame = {
	  	adjustOneletterAbbrev = true,
	  	consolidatedTooltipScale = 1.2,
	  	combineBuffsAndDebuffs = true,
	  	dragFrameList = {},
	  	color         = "0000FFFF",
	  	shortcut      = "rbfs",
	  	pos             = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -70, y = 0 },
    	gap             = 10, --gap between buff and debuff rows
   		userplaced      = true, --want to place the bar somewhere else?
    	rowSpacing      = 10,
    	colSpacing      = 7,
    	buttonsPerRow   = 10,
    	button = {
      	size              = 28,
    	},
    	icon = {
      	padding           = -2,
    	},
    	border = {
      	texture           = "Interface\\AddOns\\aegerUI\\Media\\BuffFrame\\gloss",
      	color             = { r = 0.4, g = 0.35, b = 0.35, },
      	classcolored      = false,
    	},
    	background = {
      	show              = true,   --show backdrop
      	edgeFile          = "Interface\\AddOns\\aegerUI\\Media\\BuffFrame\\outer_shadow",
      	color             = { r = 0, g = 0, b = 0, a = 0.9},
      	classcolored      = false,
      	inset             = 6,
      	padding           = 4,
    	},
    	duration = {
      	font              = STANDARD_TEXT_FONT,
      	size              = 11,
      	pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    	},
    	count = {
      	font              = STANDARD_TEXT_FONT,
      	size              = 11,
      	pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    	},
	  },
	  DeBuffFrame = {
	  	pos             = { a1 = "TOPRIGHT", af = "rBFS_BuffDragFrame", a2 = "BOTTOMRIGHT", x = 0, y = -10 },
    	userplaced      = true, --want to place the bar somewhere else?
    	rowSpacing      = 10,
    	colSpacing      = 7,
    	buttonsPerRow   = 6,
    	button = {
    	  size              = 40,
    	},
    	icon = {
    	  padding           = -2,
    	},
    	border = {
    	  texture           = "Interface\\AddOns\\aegerUI\\Media\\BuffFrame\\gloss",
    	},
    	background = {
    	  show              = true,   --show backdrop
    	  edgeFile          = "Interface\\AddOns\\aegerUI\\Media\\BuffFrame\\outer_shadow",
    	  color             = { r = 0, g = 0, b = 0, a = 0.9},
    	  classcolored      = false,
    	  inset             = 6,
    	  padding           = 4,
    	},
    	duration = {
    	  font              = STANDARD_TEXT_FONT,
    	  size              = 13,
    	  pos               = { a1 = "BOTTOM", x = 0, y = 0 },
    	},
    	count = {
    	  font              = STANDARD_TEXT_FONT,
    	  size              = 12,
    	  pos               = { a1 = "TOPRIGHT", x = 0, y = 0 },
    	},
	  },
	  FadeOutBars = { -- Fade these bars out if they're set to true.
			['MultiBarLeft'] = true,
			['MultiBarRight'] = false,
			['MultiBarBottomRight'] = false,
		},
		HideStanceBar = { -- Hide stance bar for these classes if set to true.
			['DEATHKNIGHT'] = false,
			['DRUID'] = false,
			['HUNTER'] = false,
			['MAGE'] = false,
			['MONK'] = false,
			['PALADIN'] = false,
			['PRIEST'] = false,
			['ROGUE'] = false,
			['SHAMAN'] = false,
			['WARLOCK'] = false,
			['WARRIOR'] = true,
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
aegerUI:EnableModule("BuffFrame")

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
  if aegerUI.db.global.ActionBars then
		aegerUI:EnableModule("ActionBars")
	end
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

local function Startup()
	if aegerUI.db.profile.SetUpDone == false or aegerUI.db.profile.Version ~= aegerUI_Version then
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
	aui.Print("Testing 123.")
	 --Check if Action Bars are enabled before loading ActionBarMenu
	if aegerUI.db.global.ActionBars then
		aui.InitABMenu()
	end
end
aui.RegisterEvent("PLAYER_LOGIN", Startup)