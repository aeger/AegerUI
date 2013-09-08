--local L_aegerUI = LibStub("AceLocale-3.0"):GetLocale("aegerUI")
local MEDIAPATH = "Interface\\AddOns\\aegerUI\\Media\\"

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("aegerUI", {
	type = "launcher",
	label = "aegerUI",
	OnClick = function(_, msg)
		if msg == "LeftButton" then
			if topmenu:IsVisible() then
				topmenu:Hide()
				topmenuborder:Hide()
				BazookaBar_1:Hide()
				TopmenuShow = nil
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
			else
				topmenu:Show()
				topmenuborder:Show()
				BazookaBar_1:Show()
				TopmenuShow = 1
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
			end
		elseif msg == "RightButton" then
			if Bbars == 1 then
				Bartender4.db:SetProfile("aegerUI2bar")
				Bbars = 2
				PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
				BottomBarFrame1:Hide()
				Bar1BorderFrame:Hide()
				BottomBarFrame2:Show()
				Bar2BorderFrame:Show()


			else
				if Bbars == 2 then
					Bartender4.db:SetProfile("aegerUI1bar")
					Bbars = 1
					PlaySoundFile(MEDIAPATH .. "Sound\\click.mp3")
					BottomBarFrame1:Show()
					Bar1BorderFrame:Show()
					BottomBarFrame2:Hide()
					Bar2BorderFrame:Hide()
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
