local AUI, aui = ...
-- Most of the code below from Leatrix Plus and Abu essentials
--auto sell/repair

local function MerchantOperations(event, ...)
	local AutoRepair = aegerUI.db.global.Automation.AutoRepair
	local SellGreyCrap = aegerUI.db.global.Automation.AutoSell
	local AutoGuildRepair = aegerUI.db.global.Automation.GuildRepair
	if IsModifierKeyDown() then	
		return
	else
		local cost = GetRepairAllCost()
		if(AutoRepair == true and CanMerchantRepair() and cost > 0) then
			if AutoGuildRepair and CanGuildBankRepair() and cost <= GetGuildBankMoney() and (cost <= GetGuildBankWithdrawMoney() or GetGuildBankWithdrawMoney() == -1) then
				RepairAllItems(1)
				aui.Print("Repair cost using guild funds: ".. GetCoinTextureString(cost))
			elseif cost <= GetMoney() then
				RepairAllItems()
				aui.Print("Repair cost: ".. GetCoinTextureString(cost))
			else
				aui.Print("Not enough money to repair")
			end
		end
	end
			
	if(SellGreyCrap == true) then
		local profit = 0
		local bag, slot 
		for bag = 0, 4 do
			for slot = 0, GetContainerNumSlots(bag) do
				local link = GetContainerItemLink(bag, slot)
				local bText, iCount, bLocked, bQuality, bRead = GetContainerItemInfo(bag, slot)

				if link and (select (3, GetItemInfo(link))==0) then
					local iName, iLink, iRarity, iLvl, iMinLvl, iType, iSType, iStack, iEqLoc, iText, iPrice = GetItemInfo(link)
					UseContainerItem(bag, slot)
					profit = profit + ( iCount * iPrice )
				end
			end
		end
		if profit > 0 then
			aui.Print("Sold greys for: "..GetCoinTextureString(profit))
		end
	end
end

local function CvarUpdates()
	StanceButton1:SetPoint('BOTTOM', UIParent, -450, 5)
	PetActionButton1:SetPoint('BOTTOM', UIParent, 382, 5)
end

		----------------------------------------------------------------------
		--	Hide error text
		----------------------------------------------------------------------
local function HideErrors()
		if aegerUI.db.global.Automation.HideErrors then
	
			local OrigErrHandler = UIErrorsFrame:GetScript('OnEvent')

			--	Error message events
			UIErrorsFrame:SetScript('OnEvent', function (self, event, err, ...)

				-- Handle error messages
				if event == "UI_ERROR_MESSAGE" then
					if aegerUI.db.global.Automation.ShowErrorsFlag == 1 then
						if 	err == ERR_INV_FULL or
							err == ERR_QUEST_LOG_FULL or
							err == ERR_RAID_GROUP_ONLY	or
							err == ERR_PARTY_LFG_BOOT_LIMIT or
							err == ERR_PARTY_LFG_BOOT_DUNGEON_COMPLETE or
							err == ERR_PARTY_LFG_BOOT_IN_COMBAT or
							err == ERR_PARTY_LFG_BOOT_IN_PROGRESS or
							err == ERR_PARTY_LFG_BOOT_LOOT_ROLLS or
							err == ERR_PARTY_LFG_TELEPORT_IN_COMBAT or
							err == ERR_PET_SPELL_DEAD or
							err == ERR_PLAYER_DEAD or
							err:find(format(ERR_PARTY_LFG_BOOT_NOT_ELIGIBLE_S, ".+")) then
							return OrigErrHandler(self, event, err, ...) 
						end
					else
						return OrigErrHandler(self, event, err, ...) 
					end
				end

				-- Handle information messages
				if event == 'UI_INFO_MESSAGE'  then
					if aegerUI.db.global.Automation.ShowQuestUpdates then
						return OrigErrHandler(self, event, err, ...)
					end
				end

			end)

		end
end

-- auto deposit reagents
local function autodeposit()
if aegerUI.db.global.Automation.AutoDepositRegs then 
if IsModifierKeyDown() then	
		return
	else
if not BankFrameItemButton_Update_ORI then -- Copy the function and re-write it
		BankFrameItemButton_Update_ORI = BankFrameItemButton_Update 
		
		BankFrameItemButton_Update = function(button)
				BankFrameItemButton_Update_ORI(button)
		end		
	end

	DepositReagentBank()
	aui.Print("Reagents deposited in the bank.")
	end
end
end

-- Stuff stolen from Leatrix
local LpEvt = CreateFrame("FRAME")
LpEvt:RegisterEvent("ADDON_LOADED")

local function AutoMationLoaded()
	if aegerUI.db.global.Automation.HideBodyGuard then
			LpEvt:RegisterEvent("GOSSIP_SHOW");
		else
			LpEvt:UnregisterEvent("GOSSIP_SHOW");
	end
	if aegerUI.db.global.Automation.InviteFromWhisper then
			LpEvt:RegisterEvent("CHAT_MSG_WHISPER");
			LpEvt:RegisterEvent("CHAT_MSG_BN_WHISPER");
		else
			LpEvt:UnregisterEvent("CHAT_MSG_WHISPER");
			LpEvt:UnregisterEvent("CHAT_MSG_BN_WHISPER");
		end
	if aegerUI.db.profile.Automation.BlockDuel then
			LpEvt:RegisterEvent("DUEL_REQUESTED");
		else
			LpEvt:UnregisterEvent("DUEL_REQUESTED");
		end
	if aegerUI.db.profile.Automation.BlockPetDuel then
			LpEvt:RegisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED");
		else
			LpEvt:UnregisterEvent("PET_BATTLE_PVP_DUEL_REQUESTED");
		end
	if aegerUI.db.global.Automation.AcceptInvites then
			LpEvt:RegisterEvent("PARTY_INVITE_REQUEST");
		else
			LpEvt:UnregisterEvent("PARTY_INVITE_REQUEST");
		end
	if aegerUI.db.profile.Automation.AcceptSummon then
			LpEvt:RegisterEvent("CONFIRM_SUMMON");
		else
			LpEvt:UnregisterEvent("CONFIRM_SUMMON");
		end
	if aegerUI.db.profile.Automation.AcceptRez then
			LpEvt:RegisterEvent("RESURRECT_REQUEST");
		else
			LpEvt:UnregisterEvent("RESURRECT_REQUEST");
		end
end
	
local function FriendCheck(name)
		ShowFriends()
		for i = 1, GetNumFriends() do
			if (name == GetFriendInfo(i)) then
				return true
			end
		end
		return false;
end
	
local function GuildCheck(name)  -- Not working
	if IsInGuild() then	
		GuildRoster() 
		for i = 1, GetNumGuildMembers() do
			if (name == GetGuildRosterInfo(i)) then
				return true
			end
		end
		end
		return false;
end
	
-- Check if a player is in your Real ID friends list
	local function RealIDCheck(name)

		-- Get name of inviting character (without realm)
		local invname = strsplit("-", name, 2)
		invname = strtrim(invname)

		-- Update friends list
		ShowFriends()

		-- Traverse friends list for name (does not check realm)
		local numfriends = BNGetNumFriends()
		for i = 1, numfriends do
			local presenceID, void, void, void, toonname, void, client, isOnline = BNGetFriendInfo(i)
			if client == "WoW" and isOnline and toonname then
				if invname == toonname then
					return true
				end
			end
		end
		return false

	end
-- Check if player is in LFG queue
	local function IsInLFGQueue()
 		if 	GetLFGMode(LE_LFG_CATEGORY_LFD) or
			GetLFGMode(LE_LFG_CATEGORY_LFR) or
			GetLFGMode(LE_LFG_CATEGORY_RF) or
			GetLFGMode(LE_LFG_CATEGORY_SCENARIO) or
			GetLFGMode(LE_LFG_CATEGORY_FLEXRAID) then
			return true
		end
	end
	
local function eventHandler(self, event, arg1, arg2, ...)

		----------------------------------------------------------------------
		-- Hide bogyguard gossip
		----------------------------------------------------------------------

		if event == "GOSSIP_SHOW" then
			-- Do nothing if shift is being held
			if IsShiftKeyDown() then return end
			-- Traverse faction IDs for known bodyguards (wowhead.com/factions=1444.1735)
			local id = GetFriendshipReputation();
			if id then
				if id == 1733 -- Delvar Ironfist
				or id == 1736 -- Tormmok
				or id == 1737 -- Talonpriest Ishaal
				or id == 1738 -- Defender Illona
				or id == 1739 -- Vivianne
				or id == 1740 -- Aeda Brightdawn
				or id == 1741 -- Leorajh
				then
					-- Close gossip window if it's for a cooperating (active) bodyguard
					if UnitCanCooperate("target", "player") then
						CloseGossip()
					end
				end
			end
			return
		end

		----------------------------------------------------------------------
		-- Invite from whisper
		----------------------------------------------------------------------

		if event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_BN_WHISPER" then
			if (not UnitExists("party1") or UnitIsGroupLeader("player")) and strlower(arg1) == strlower(aegerUI.db.global.Automation.WhisperKeyWord) then
				if not IsInLFGQueue() then
					if event == "CHAT_MSG_WHISPER" then
						InviteUnit(arg2)
					elseif event == "CHAT_MSG_BN_WHISPER" then
						local presenceID = select(11, ...)
						if presenceID and BNIsFriend(presenceID) then
							local index = BNGetFriendIndex(presenceID);
							if index then
								local presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID = BNGetFriendInfo(index);
								if toonID then
									BNInviteFriend(toonID);
								end
							end
						end
					end
				end
			end
			return
		end
				
		----------------------------------------------------------------------
		-- Block duel requests
		----------------------------------------------------------------------

		if event == "DUEL_REQUESTED" and not RealIDCheck(arg1) and not FriendCheck(arg1) then
			CancelDuel();
			StaticPopup_Hide("DUEL_REQUESTED");
			return
		end

		----------------------------------------------------------------------
		-- Block pet battle duel requests
		----------------------------------------------------------------------

		if event == "PET_BATTLE_PVP_DUEL_REQUESTED" and not RealIDCheck(arg1) and not FriendCheck(arg1) then
			C_PetBattles.CancelPVPDuel()
			return
		end

		----------------------------------------------------------------------
		-- Automatically accept resurrection requests
		----------------------------------------------------------------------

		if event == "RESURRECT_REQUEST" then
			if GetCorpseRecoveryDelay() == 0 then
				if ((UnitAffectingCombat(arg1)) and LeaPlusLC["NoAutoResInCombat"] == "Off") or not (UnitAffectingCombat(arg1)) then
					AcceptResurrect()
					StaticPopup_Hide("RESURRECT_NO_TIMER")
					DoEmote("thank", arg1)
				end
			end
			return
		end

		----------------------------------------------------------------------
		-- Automatically accept summon requests
		----------------------------------------------------------------------

		if event == "CONFIRM_SUMMON" then
			if not UnitAffectingCombat("player") then
				ConfirmSummon()
				StaticPopup_Hide("CONFIRM_SUMMON")
			end
			return
		end

		----------------------------------------------------------------------
		-- Block party invites
		----------------------------------------------------------------------
	
		if event == "PARTY_INVITE_REQUEST" then
			-- If a friend, accept if you're accepting friends and not in Dungeon Finder
			if 	(aegerUI.db.global.Automation.AcceptInvites and FriendCheck(arg1)) or
				(aegerUI.db.global.Automation.AcceptInvites and GuildCheck(arg1)) or
				(aegerUI.db.global.Automation.AcceptInvites and RealIDCheck(arg1)) then

				if not IsInLFGQueue() then
					AcceptGroup();
					for i=1, STATICPOPUP_NUMDIALOGS do
						if _G["StaticPopup"..i].which == "PARTY_INVITE" then
							_G["StaticPopup"..i].inviteAccepted = 1
							StaticPopup_Hide("PARTY_INVITE");
							break
						elseif _G["StaticPopup"..i].which == "PARTY_INVITE_XREALM" then
							_G["StaticPopup"..i].inviteAccepted = 1
							StaticPopup_Hide("PARTY_INVITE_XREALM");
							break
						end
					end
					return
				end

			end

			-- If not a friend and you're blocking invites, decline
			if aegerUI.db.global.Automation.BlockPartyInvites then
				if FriendCheck(arg1) or RealIDCheck(arg1) then
					return
				else
					DeclineGroup();
					StaticPopup_Hide("PARTY_INVITE");
					StaticPopup_Hide("PARTY_INVITE_XREALM");
					return
				end
			end

			return
		end
	
	if event == "ADDON_LOADED" then
		AutoMationLoaded()
	end
end

LpEvt:SetScript("OnEvent", eventHandler);

-- reset echo		
local success = gsub(INSTANCE_RESET_SUCCESS, "%%s", "")
local failed = gsub(INSTANCE_RESET_FAILED, ".*%%s", "")
local fail_offline = gsub(INSTANCE_RESET_FAILED_OFFLINE, ".*%%s", "")
local fail_zone = gsub(INSTANCE_RESET_FAILED_ZONING, ".*%%s", "")

local function Echo(self, event, ...)
	local instance = ...

	if event == "CHAT_MSG_SYSTEM" then
		if UnitIsGroupLeader("player") and (strfind(instance, success) or strfind(instance, failed) or strfind(instance, fail_offline) or strfind(instance, fail_zone)) then
			SendChatMessage("ResetEcho - "..instance, "PARTY")
		end
	end
end

aui.RegisterEvent("MERCHANT_SHOW", MerchantOperations)
aui.RegisterEvent("PLAYER_ENTERING_WORLD", CvarUpdates)
aui.RegisterEvent("ADDON_LOADED", HideErrors)
aui.RegisterEvent("BANKFRAME_OPENED", autodeposit)
--aui.RegisterEvent("PARTY_INVITE_REQUEST", autoparty)
aui.RegisterEvent("CHAT_MSG_SYSTEM", Echo)
