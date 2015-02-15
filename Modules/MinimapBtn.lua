local AUI, aui = ...

local bgMinimapButton = CreateFrame("Frame","aegerUI_MinimapButton", Minimap)

bgMinimapButton:SetHeight(32)
bgMinimapButton:SetWidth(32)
bgMinimapButton:SetMovable(1)
bgMinimapButton:SetUserPlaced(1)
bgMinimapButton:EnableMouse(1)
bgMinimapButton:RegisterForDrag('LeftButton')
bgMinimapButton:SetFrameStrata('DIALOG')
bgMinimapButton:SetPoint('TOPRIGHT', -131, -22);
bgMinimapButton:CreateTexture('bgMinimapButtonTexture', 'BACKGROUND')
bgMinimapButton:SetClampedToScreen(true)

bgMinimapButtonTexture:SetWidth(32)
bgMinimapButtonTexture:SetHeight(32)
bgMinimapButtonTexture:SetTexture('Interface\\AddOns\\aegerUI\\media\\minimap.tga')
bgMinimapButtonTexture:SetPoint('CENTER')
	
bgMinimapButton:SetScript('OnMouseUp', function(self, button)
	if button == 'LeftButton' then
		if InCombatLockdown() then
			print("Cannot toggle TopMenu during combat.")
			return
		end
		if TMMenuFrame:IsVisible() then
                        TMMenuHide()
                        HideBazookaBars()
                        aegerUI.db.profile.TopMenuShow = false
                        PlaySoundFile("Interface\\AddOns\\aegerUI\\Media\\sound\\click.mp3")
                else
                        TMMenuDisplay()
                        if aegerUI.db.profile.ShowBazBar == 1 then
							ShowBazookaBar1()
						elseif
						aegerUI.db.profile.ShowBazBar == 2 then
							ShowBazookaBar2()
						elseif
						aegerUI.db.profile.ShowBazBar == 3 then
							ShowBazookaBar3()
						elseif
						aegerUI.db.profile.ShowBazBar == 4 then
							ShowBazookaBar4()
						end
                        aegerUI.db.profile.TopMenuShow = true
                        PlaySoundFile("Interface\\AddOns\\aegerUI\\Media\\sound\\click.mp3")
        end
	
	elseif button == 'RightButton' then
		LibStub("AceConfigDialog-3.0"):Open("aegerUI")
	end
end)

bgMinimapButton:SetScript('OnDragStart', function(self, button)
	if IsShiftKeyDown() then
		bgMinimapButton:SetScript('OnUpdate', function(self, elapsed)
			local x, y = Minimap:GetCenter()
			local cx, cy = GetCursorPosition()
			x, y = cx / self:GetEffectiveScale() - x, cy / self:GetEffectiveScale() - y
			if x > Minimap:GetWidth()/2+bgMinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2+bgMinimapButton:GetWidth()/2 end
			if x < Minimap:GetWidth()/2*-1-bgMinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2*-1-bgMinimapButton:GetWidth()/2 end
			if y > Minimap:GetHeight()/2+bgMinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2+bgMinimapButton:GetHeight()/2 end
			if y < Minimap:GetHeight()/2*-1-bgMinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2*-1-bgMinimapButton:GetHeight()/2 end
			bgMinimapButton:ClearAllPoints()
			bgMinimapButton:SetPoint('CENTER', x, y)
		end)
	end
end)

bgMinimapButton:SetScript('OnDragStop', function(self, button)
	bgMinimapButton:SetScript('OnUpdate', nil)
end)

bgMinimapButton:SetScript('OnEnter', function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("aegerUI")
	GameTooltip:AddLine("Left Click toggles TopMenu")
	GameTooltip:AddLine("Right Click opens aegerUI configuration")
	GameTooltip:Show()
end)

bgMinimapButton:SetScript('OnLeave', function(self)
	GameTooltip:Hide()
end)

----------------------------------------------------------------------------------------
--	Fade in/out functions -- Credits ShestakUI -- 
----------------------------------------------------------------------------------------
local function FadeIn(f)
	UIFrameFadeIn(f, 0.4, f:GetAlpha(), 1)
end

local function FadeOut(f)
	UIFrameFadeOut(f, 0.8, f:GetAlpha(), 0)
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end
	object = EnumerateFrames(object)
end
--[[
----------------------------------------------------------------------------------------
--	Clear and Hide MinimapBtn -- Hover Over Time!
----------------------------------------------------------------------------------------
aegerUI_MinimapButton.ClearAllPoints = dummy
aegerUI_MinimapButton.SetPoint = dummy
aegerUI_MinimapButton:SetAlpha(0)
aegerUI_MinimapButton:SetScript("OnEnter", function()
	aegerUI_MinimapButton:FadeIn()
end)
aegerUI_MinimapButton:SetScript("OnLeave", function()
	aegerUI_MinimapButton:FadeOut()
end)

----------------------------------------------------------------------------------------
--	Clear and Hide The GarryPMB -- Hover Over Time!
----------------------------------------------------------------------------------------
GarrisonLandingPageMinimapButton.ClearAllPoints = dummy
GarrisonLandingPageMinimapButton.SetPoint = dummy
GarrisonLandingPageMinimapButton:SetAlpha(0)
GarrisonLandingPageMinimapButton:SetScript("OnEnter", function()
	GarrisonLandingPageMinimapButton:FadeIn()
end)
GarrisonLandingPageMinimapButton:SetScript("OnLeave", function()
	GarrisonLandingPageMinimapButton:FadeOut()
end)
--]]