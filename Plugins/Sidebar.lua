local AUI, aui = ...
local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"

function aegerUI_Sidebar:OnEnable()
--Toggle Sidebar
LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Toggle Bars", {
	type = "launcher",
	label = "Toggle Bars",
	OnClick = function(_, msg)
	if msg == "LeftButton" then
			if (MultiBarRight:IsVisible()) then
			MultiBarRight:Hide()
			aegerUI.db.profile.SideBar1Show = false
			PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
			else
			MultiBarRight:Show()
			aegerUI.db.profile.SideBar1Show = true
			PlaySoundFile(MEDIA_PATH .. "sound\\click.mp3")
		end
    end
	
end,
	icon = "Interface\\AddOns\\aegerUI\\Media\\Icons\\toggle",
	 
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("Toggle Side Bars")
		tooltip:AddLine("Left |cff00ff00Click|r to toggle side bars")
	end,
})
end