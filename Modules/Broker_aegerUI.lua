--local L_aegerUI = LibStub("AceLocale-3.0"):GetLocale("aegerUI")
local FOLDER_NAME, private_data = ...
local MEDIAPATH = "Interface\\AddOns\\aegerUI\\Media\\"

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("aegerUI", {
	type = "launcher",
	label = "aegerUI",
	OnClick = function(_, msg)
		if msg == "LeftButton" then
			if TMMenuFrame:IsVisible() then
				TMMenuHide()
				HideBazookaBar1()
				aegerUI_TMShow = nil
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
			else
				TMMenuDisplay()
				ShowBazookaBar1()
				aegerUI_TMShow = true
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
			end
		elseif msg == "RightButton" then
			if aegerUI_Bbars == 1 then
				Bartender4.db:SetProfile("aegerUI2bar")
				aegerUI_Bbars = 2
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
				Bbar2Display()
				Bbar1Hide()
				
			else
				if aegerUI_Bbars == 2 then
					Bartender4.db:SetProfile("aegerUI1bar")
					aegerUI_Bbars = 1
					PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
					Bbar1Display()
					Bbar2Hide()
				end
			end
		end
	end,
	icon = "Interface\\AddOns\\aegerUI\\Media\\icon",
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("AegerUI")
		tooltip:AddLine("Click|r to toggle the top menu")
		tooltip:AddLine("Right-click|r to toggle bottom bars")
	end,
})
