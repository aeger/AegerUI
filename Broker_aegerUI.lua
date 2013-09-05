local L_aegerUI = LibStub("AceLocale-3.0"):GetLocale("aegerUI")

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("aegerUI", {
	type = "launcher",
	label = "aegerUI",
	OnClick = function(_, msg)
		if msg == "LeftButton" then
			if topmenu:IsVisible() then
				topmenu:Hide()
				topmenuborder:Hide()
			else
				topmenu:Show()
				topmenuborder:Show()
			
			end
			end
		elseif msg == "RightButton" then
			if Bbars = 1 then
			if IsAddOnLoaded("Bartender4") then
               Bartender4.db:SetProfile("aegerUI2bar")
			   Bbars = 2
			   ReloadUI()
			   end
			elseif
			if Bbars = 2 then
			if IsAddOnLoaded("Bartender4") then
               Bartender4.db:SetProfile("aegerUI1bar")
			   Bbars = 1
			   ReloadUI()
			end
			end
			
		end
	end,
	icon = "Interface\\AddOns\\aegerUI\\Media\\icon",
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("AegerUI")
		tooltip:AddLine("|cffffff00" .. L_aegerUI["Click|r to toggle the top menu"])
		tooltip:AddLine("|cffffff00" .. L_aegerUI["Right-click|r to toggle bottom bars"])
	end,
})