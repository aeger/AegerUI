-- Configuration
local whispCommand = "!kingme" -- The whisper command to trigger the invite.

-- Local Table
local aName, aTable = ...

function aTable:OnEvent(event, ...)
	local msg, name = ...

	if event == "CHAT_MSG_WHISPER" then
		aTable.PassCrown(msg, name)
	end
end

function aTable.PassCrown(msg, name)
	local name = Ambiguate(name, "none")
	if msg == whispCommand then
		if IsInRaid() then return end
		if UnitIsGroupLeader("player") then
			PromoteToLeader(name)
		else
			SendChatMessage(aName..": "..UnitName("player")..aTable.NOT_PARTY_LEADER, "WHISPER", nil, name)
		end
	else
		return
	end
end

-- Need a frame to attach to.
local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_WHISPER")
f:SetScript("OnEvent", aTable.OnEvent)

-- Localization
aTable.NOT_PARTY_LEADER = " is not the party leader."
