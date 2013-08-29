MoveableFramesSaved = {}
local HandledFrames = {}
local BlizzardFrames = {
	"AchievementFrame",
	"AuctionFrame",
	"ArchaeologyFrame",
	"BarberShopFrame",
	"BlackMarketFrame",
	"CalendarFrame",
	"CharacterFrame",
	"ClassTrainerFrame",
	"DressUpFrame",
	"EncounterJournal",
	"FriendsFrame",
	"GameMenuFrame",
	"GMSurveyFrame",
	"GossipFrame",
	"GuildFrame",
	"GuildBankFrame",
	"GuildRegistrarFrame",
	"HelpFrame",
	"InterfaceOptionsFrame",
	"ItemUpgradeFrame",
	"KeyBindingFrame",
	"LFGDungeonReadyPopup",
	"LossOfControlFrame",
	"MacOptionsFrame",
	"MacroFrame",
	"MailFrame",
	"MerchantFrame",
	"PlayerTalentFrame",
	"PetJournalParent",
	"PVEFrame",
	"PVPFrame",
	"QuestFrame",
	"QuestLogFrame",
	"RaidBrowserFrame",
	"ReadyCheckFrame",
	"ReforgingFrame",
	"ReportCheatingDialog",
	"ReportPlayerNameDialog",
	"RolePollPopup",
	"ScrollOfResurrectionSelectionFrame",
	"SpellBookFrame",
	"TabardFrame",
	"TaxiFrame",
	"TimeManagerFrame",
	"TradeSkillFrame",
	"TradeFrame",
	"TransmorgifyFrame",
	"TutorialFrame",
	"VideoOptionsFrame",
	"VoidStorageFrame",
	"WorldStateAlwaysUpFrame",
	"WorldStateCaptureBar1",
	"WorldStateScoreFrame",
}

local function MakeMovable(Frame)
	if HandledFrames then
		for _, Handled in pairs(HandledFrames) do
			if Frame:GetName() == Handled then return end
		end
	end
	if ElvUI and Frame:GetName() == "LossOfControlFrame" then return end
	Frame:EnableMouse(true)
	if Frame:GetName() == "LFGDungeonReadyPopup" then LFGDungeonReadyDialog:EnableMouse(false) end
	
	Frame:SetMovable(true)
	Frame:RegisterForDrag("LeftButton")
	Frame:SetClampedToScreen(true)
	Frame:HookScript("OnUpdate", function(self)
		if InCombatLockdown() or self:GetName() == "GameMenuFrame" then return end
		if self.IsMoving then return end
		self:ClearAllPoints()
		if self:GetName() == "QuestFrame" then
			if MoveableFramesSaved["GossipFrame"].Points ~= nil then
				self:SetPoint(unpack(MoveableFramesSaved["GossipFrame"].Points))
			end
		elseif MoveableFramesSaved[self:GetName()].Points ~= nil then
			self:SetPoint(unpack(MoveableFramesSaved[self:GetName()].Points))
		end
	end)
	Frame:SetScript("OnDragStart", function(self) self:StartMoving() self.IsMoving = true end)
	Frame:SetScript("OnDragStop", function(self)
		self.IsMoving = false
		self:StopMovingOrSizing()
		if self:GetName() == "GameMenuFrame" then return end
		local a,b,c,d,e = self:GetPoint()
		b = self:GetParent():GetName()
		self:ClearAllPoints()
		self:SetPoint(a,b,c,d,e)
		if self:GetName() == "QuestFrame" then
			MoveableFramesSaved["GossipFrame"].Points = {a,b,c,d,e}
		else
			MoveableFramesSaved[self:GetName()].Points = {a,b,c,d,e}
		end
	end)
	if Frame:GetName() == "WorldStateAlwaysUpFrame" then
		Frame:SetScript("OnEnter", function(self) self:SetTemplate() end)
		Frame:SetScript("OnLeave", function(self) self:StripTextures() end)
	end
	tinsert(HandledFrames, Frame:GetName())
end


local MovableFrame = CreateFrame("Frame")
MovableFrame:RegisterEvent("PLAYER_LOGIN")
MovableFrame:RegisterEvent("ADDON_LOADED")
MovableFrame:RegisterEvent("LFG_UPDATE")
MovableFrame:RegisterEvent("ROLE_POLL_BEGIN")
MovableFrame:RegisterEvent("READY_CHECK")
MovableFrame:RegisterEvent("UPDATE_WORLD_STATES")
MovableFrame:RegisterEvent("WORLD_STATE_TIMER_START")
MovableFrame:RegisterEvent("WORLD_STATE_UI_TIMER_UPDATE")
MovableFrame:SetScript("OnEvent", function(self, event, name)
	for _, object in pairs(BlizzardFrames) do
		if _G[object] then
			if MoveableFramesSaved[object] == nil then MoveableFramesSaved[object] = {} end
			MoveableFramesSaved["GameMenuFrame"] = {}
			MakeMovable(_G[object])
		end
	end
end)