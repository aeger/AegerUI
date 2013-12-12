-------------------------------------------------------------------------------
--  aegerUI 5.4.8 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local aegerUI = ...

	local LibStub = _G.LibStub
	local aegerUI = LibStub("AceAddon-3.0"):GetAddon("aegerUI")
	local L = LibStub("AceLocale-3.0"):GetLocale("aegerUI")
    	
--  Constants  ----------------------------------------------------------------
	local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]    
	local FONT = "Fonts\\FRIZQT__.ttf"
	local CLICK = "Interface\\AddOns\\aegerUI\\media\\sound\\click.mp3"
	
	local index
	local start = -44
	local maxIndex = -79
	local SideBar = CreateFrame("Frame")
	SideBar:SetPoint("RIGHT", BT4Bar3, "RIGHT", 0, 63)
	SideBar:SetPoint("LEFT", BT4Bar3, "RIGHT", index, 63)
	SideBar:SetSize(42, 480)
	SideBar:SetParent(UIParent)
	local textureSide = SideBar:CreateTexture(nil, "BACKGROUND")
	textureSide:SetAllPoints(SideBar)
	textureSide:SetTexture(MEDIA_PATH .. "textures\\Right1Bar")
	textureSide:SetVertexColor(0, 0, 0, 0.5)

	local Expand2 = CreateFrame("Button", nil, SideBar)
	local Retract2 = CreateFrame("Button", nil, SideBar)
	local firstRunTime = true
	local SideBarMode2
	SideBar.ag = SideBar:CreateAnimationGroup()
	SideBar.ag.anim = SideBar.ag:CreateAnimation()
	SideBar.ag.anim:SetDuration(0.01)
	SideBar.ag:SetLooping("REPEAT")
	SideBar.ag:SetScript("OnLoop", function(self)
	if not aegerUI.db.profile.SetUpDone then return end
		if aegerUI.db.profile.SideBars == 2 then 
			if SideBarMode2 == 'Expand' then -- Expand Bar4 (Second Bar)
				if index == maxIndex then 
					aegerUI.db.profile.SideBars = 3
					Retract2:Show()
					self:Stop() 
					firstRunTime = true
				return end
				if firstRunTime then
					Retract2:Hide()
					Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, 0)
					Expand2:Hide()
					firstRunTime = false
				else
					if index == -66 then
						Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always",false)
						BT4Bar4:SetAlpha(0)
					else
						local alpha = BT4Bar4:GetAlpha()
						if alpha <= 1 then
							BT4Bar4:SetAlpha(alpha + 0.08)
						end
					end
					index = index - 1
					SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
				end
			elseif SideBarMode2 == 'Retract' then -- Retract Bar3 (First Bar)
				if index == 0 then 
					aegerUI.db.profile.SideBars = 1
					Expand2:Show()
					self:Stop()
					firstRunTime = true
				return end
				if firstRunTime then
					Retract2:Hide()
					Expand2:Hide()
					Expand2:SetPoint("RIGHT", SideBar, "LEFT", 0, 0)
					firstRunTime = false
				else
					if index == -20 then
						Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always",true)
					else
						local alpha = BT4Bar3:GetAlpha()
						if alpha >= 0 then
							BT4Bar3:SetAlpha(alpha - 0.08)
						end
					end
				index = index + 1
				SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			end
			end
		elseif aegerUI.db.profile.SideBars == 3 then -- Retract Bar4 (Second Bar)
			if index == start then
				aegerUI.db.profile.SideBars = 2
				Expand2:Show()
				Retract2:Show()
				self:Stop()
				firstRunTime = true
			return end
			if firstRunTime then
				Retract2:Hide()
				Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, -100)
				Expand2:Hide()
				firstRunTime = false
			else
				if index == -60 then
					Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always",true)
				else
					local alpha = BT4Bar4:GetAlpha()
					if alpha >= 0 then
						BT4Bar4:SetAlpha(alpha - 0.08)
					end
				end
			index = index + 1
			SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			end
		elseif aegerUI.db.profile.SideBars == 1 then  -- Expand Bar3 (First Bar)
				if index == start then 
				aegerUI.db.profile.SideBars = 2
				Expand2:Show()
				Retract2:Show()
				self:Stop()
				firstRunTime = true
			return end
			if firstRunTime then
				Expand2:Hide()
				Expand2:SetPoint("RIGHT", SideBar, "LEFT", 0, 100)
				Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, -100)
				firstRunTime = false
			else
				if index == -30 then
					Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always",false)
					BT4Bar3:SetAlpha(0)
				else
					local alpha = BT4Bar3:GetAlpha()
					if alpha <= 1 then
						BT4Bar3:SetAlpha(alpha + 0.08)
					end
				end
			index = index - 1
			SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			end
		end
	end)

	Expand2:SetPoint("RIGHT", SideBar, "LEFT", 0, 100)
	Expand2:SetSize(14, 120)
	Expand2:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Expand2.font = Expand2:CreateFontString()
	Expand2.font:SetPoint("CENTER")
	Expand2.font:SetFont(FONT, 14)
	Expand2.font:SetText("<")
	Expand2.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	Expand2:SetScript("OnClick", function(self)
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		SideBarMode2 = 'Expand'
		SideBar.ag:Play()
	end)

	Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, -100)
	Retract2:SetSize(14, 120)
	Retract2:SetNormalTexture(MEDIA_PATH .. "textures\\RightBarButton")
	Retract2.font = Retract2:CreateFontString()
	Retract2.font:SetPoint("CENTER")
	Retract2.font:SetFont(FONT, 14)
	Retract2.font:SetText(">")
	Retract2.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	Retract2:SetScript("OnClick", function(self)
		if InCombatLockdown() then return end
		PlaySoundFile(CLICK)
		SideBarMode2 = 'Retract'
		SideBar.ag:Play()
	end)

	Expand2:SetScript("OnEnter", function()
		local _, class = UnitClass("player")
		if class == "PRIEST" then
			Expand2.font:SetTextColor(0,1,0)
		else
			Expand2.font:SetTextColor(1,1,1)
		end 
	end)
	Expand2:SetScript("OnLeave", function()
		Expand2.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	Retract2:SetScript("OnEnter", function()
		local _, class = UnitClass("player");
		if class == "PRIEST" then
			Retract2.font:SetTextColor(1,0,0)
		else
			Retract2.font:SetTextColor(1,1,1)
		end 
	end)
	Retract2:SetScript("OnLeave", function()
		Retract2.font:SetTextColor(classcolor.r, classcolor.g, classcolor.b)
	end)

	--> WatchFrame Set-Up
	local function moveWatchFrame()
		if not aegerUI.db.profile.SetUpDone then 
			Expand2:Hide()
			Retract2:Hide()
			SideBar:Hide()
		return end
		WatchFrame:SetMovable(true)
		WatchFrame:SetUserPlaced(true)
		WatchFrame:ClearAllPoints()
		WatchFrame:SetHeight(aegerUI.db.global.WatchFrame_Height)
		--BazookaBar_1:Hide()
		Retract2:Hide()
		Expand2:Hide()
		if aegerUI.db.global.WatchFrame_Position == "RIGHT" then
			WatchFrame:SetPoint("TOPRIGHT", SideBar, "TOPLEFT", -20, -10)
		end
		if BT4Bar3:IsVisible() and not BT4Bar4:IsVisible() then
			index = -44
			SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			Expand2:Show()
			Retract2:Show()
			Expand2:SetPoint("RIGHT", SideBar, "LEFT", 0, 100)
			Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, -100)
		elseif BT4Bar4:IsVisible() then
			index = -79
			SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			Retract2:Show()
			Retract2:SetPoint("RIGHT", SideBar, "LEFT", 0, 0)
		else
			index = 0
			SideBar:SetPoint("LEFT", UIParent, "RIGHT", index, 63)
			Expand2:Show()
			Expand2:SetPoint("RIGHT", SideBar, "LEFT", 0, 0)
		end
		if aegerUI.db.global.WatchFrame_Position == "LEFT" then
				WatchFrame:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", 30, -250)
		end
	end
	
local SideBarSetup = CreateFrame('Frame')
SideBarSetup:RegisterEvent('PLAYER_LOGIN')
SideBarSetup:SetScript('OnEvent', function() 
	if aegerUI.db.profile.SideBars == 1 then
		Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always",true)
		Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always",true)
	elseif aegerUI.db.profile.SideBars == 2 then
		Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always",true)
		Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always",false)
	elseif aegerUI.db.profile.SideBars == 3 then
		Bartender4.Bar.barregistry["4"]:SetVisibilityOption("always",false)
		Bartender4.Bar.barregistry["3"]:SetVisibilityOption("always",false)
	end
	moveWatchFrame()
end)