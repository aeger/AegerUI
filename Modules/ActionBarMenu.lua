
local AUI, aui = ...

-- A simple, SIMPLE LDB

local AMM = CreateFrame("Frame", "AbuMicroMenu", UIParent)
local button = CreateFrame('Button', nil, UIParent)
local nop = function() end
local BUTTONS

local function CreateDefaultList()
	local list = {}

	local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions()

	for i, skill in pairs({prof1, prof2, cooking}) do
		local button = {}
		local name, texture = GetProfessionInfo(skill)

		button.IsPlugin = true
	  button.icon = texture
		button.addon = name
		button.OnMouseDown = nop
		button.OnMouseUp = nop

		button.OnClick = function() CastSpellByName(name) end

		list[name] = button
	end
	return list
end

local function SlideOutFrame()
	if not AMM:IsMouseOver() then
		AMM:AnimationSlideReturn(5)
	end
end

local function SlideCancel()
	if AMM:IsMouseOver() then
		AMM:AnimationSlideStart()
	end
end

function AMM:CreateAddonButton(addon)
	local b = CreateFrame("Button", self:GetName()..addon.."Button", self, "MainMenuBarMicroButton")
	b.addon = addon
	b.data = BUTTONS[addon]
	b:RegisterForClicks("AnyUp")

	b:SetNormalTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Up");
	b:SetPushedTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Down");
	b:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight");

	b.texture = b:CreateTexture(nil, "OVERLAY")
	b.texture:SetTexCoord(.05, .95, .05, .95)
	b.texture:SetSize(18,18)
	b.texture:SetPoint("TOP", 0, -30)
	b.texture:SetBlendMode("ADD")
	b.texture:SetTexture(b.data.icon)

	if b.data.iconR then
		b.texture:SetVertexColor(b.data.iconR, b.data.iconG, b.data.iconB)
	end

	b:SetScript("OnEnter", function(self, ...)
		SlideCancel()
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", -3, -10)
		if self.data.OnTooltipShow then
			self.data.OnTooltipShow(GameTooltip)
			GameTooltip:Show()
		elseif self.data.OnEnter then
			GameTooltip:Hide()
			self.data.OnEnter(self)
			GameTooltip:ClearAllPoints()
			GameTooltip:SetAnchorType("ANCHOR_TOPRIGHT", -3, -10)
		else
			GameTooltip:AddLine(self.data.addon)
			GameTooltip:Show()
		end
	end)

	b:SetScript("OnLeave", function(self, ...)
		if self.data.OnLeave then
			self.data.OnLeave(self, ...)
		else
			GameTooltip:Hide()
		end
		SlideOutFrame()
	end)

	b:SetScript("OnMouseDown", function(self, ...)
		self.texture:SetPoint("TOP", self, "TOP", -1, -31);
		self.texture:SetAlpha(0.5);
		self.data.OnMouseDown(self, ...)
	end)

	b:SetScript("OnMouseUp", function(self, ...)
		self.texture:SetPoint("TOP", self, "TOP", 0, -30);
		self.texture:SetAlpha(1.0);
		self.data.OnMouseUp(self, ...)
	end)
	b:SetScript("OnClick", function(self, ...)
		self.data.OnClick(self, ...)
	end)
	return b;
end

local lastbutton = nil;
local num = 0
function AMM:UpdateButtons()
	if not BUTTONS then
		BUTTONS = CreateDefaultList()
	end
	for addon, v in pairs(BUTTONS) do
		if not self.loadedbuttons[addon] and (IsAddOnLoaded(addon) or v.IsPlugin) then
			if num >= 12 then return; end
			local button = self:CreateAddonButton(addon)
			self.loadedbuttons[addon] = button;
			num = num + 1

			if lastbutton then
				button:SetPoint("TOPLEFT", lastbutton, "TOPRIGHT", -2.2, 0)
			else
				button:SetPoint("BOTTOMLEFT", CharacterMicroButton, "TOPLEFT", 0, -20)
			end
			lastbutton = button
		end
	end
end

function AMM:MakePlugin(name, obj)
    if not BUTTONS[name] then BUTTONS[name] = { }; end
    BUTTONS[name].icon = obj.icon
	BUTTONS[name].IsPlugin = true;
	BUTTONS[name].addon = name

	BUTTONS[name].OnClick = obj.OnClick or nop
	BUTTONS[name].OnMouseDown = obj.OnMouseDown or nop
	BUTTONS[name].OnMouseUp = obj.OnMouseUp or nop
	BUTTONS[name].OnTooltipShow = obj.OnTooltipShow
	BUTTONS[name].OnEnter = obj.OnEnter
	BUTTONS[name].OnLeave = obj.OnLeave

	BUTTONS[name].iconR = obj.iconR
	BUTTONS[name].iconG = obj.iconG
	BUTTONS[name].iconB = obj.iconB

    self:UpdateButtons()
end

function AMM:UpdatePlugin(event, name, _, _, obj)
	local b = self.loadedbuttons[name]
	if not b then return; end
	self:MakePlugin(name, obj)

	b.texture:SetTexture(obj.icon)
	if b.data.iconR then
		b.texture:SetVertexColor(b.data.iconR, b.data.iconG, b.data.iconB)
	end
end

local function MakeButton()

	button:SetFrameStrata('HIGH')
	button:SetToplevel(true)
	button:SetSize(30, 30)
	button:SetPoint('BOTTOM', UIParent, 265, -4)
	button:RegisterForClicks('Anyup')

	button:SetNormalTexture('Interface\\AddOns\\aegerUI\\Media\\picomenu\\picomenuNormal')
	button:GetNormalTexture():SetSize(30, 30)

	button:SetHighlightTexture('Interface\\AddOns\\aegerUI\\Media\\picomenu\\picomenuHighlight')
	button:GetHighlightTexture():SetAllPoints(button:GetNormalTexture())

	button:SetScript('OnMouseDown', function(self)
		self:GetNormalTexture():ClearAllPoints()
		self:GetNormalTexture():SetPoint('CENTER', 1, -1)
	end)

	button:SetScript('OnMouseUp', function(self, button)
		self:GetNormalTexture():ClearAllPoints()
		self:GetNormalTexture():SetPoint('CENTER')

		if AMM.slideInfo.stage == "Finished" then
			AMM:AnimationSlideStart()
		else
			AMM:AnimationSlideReturn()
		end
		GameTooltip:Hide()
	end)

	button:SetScript('OnEnter', function(self) 
		local LATENCYLABEL = 'Home: %d ms\nWorld: %d ms'
		local _, _, latencyHome, latencyWorld = GetNetStats()
		GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 25, -5)
		GameTooltip:AddLine(MAINMENU_BUTTON)
		GameTooltip:AddLine(format(LATENCYLABEL, latencyHome, latencyWorld))
		GameTooltip:AddLine(format(MAINMENUBAR_FPS_LABEL, GetFramerate()))
		GameTooltip:Show()
	end)
	button:SetScript('OnLeave', function() GameTooltip:Hide() end)
end

local TexData = {
	--LEFT
	[1] = { t = "Interface\\PaperDollInfoFrame\\UI-Character-Honor-BottomRight",
			s =  {128, 100},
			p = {"TOPLEFT", -74, 42}, 
			c = {1, 0, 1, 1-100/128}
	},
	[2] = { t = "Interface\\PaperDollInfoFrame\\UI-Character-Honor-BottomRight",
			s =  {128, 128*(1-100/128)+15},
			p = {"TOPLEFT", -74, -58},
			c = {1, 0, (1-(100/128*.85)), 0}
	},
	--RIGHT
	[3] = { t = "Interface\\PaperDollInfoFrame\\UI-Character-Honor-BottomLeft",
			s =  {260, 100},
			p = {"TOPLEFT", 54, 42},
			c = {1, 0, 1, 1-100/128}
	},
	[4] = { t = "Interface\\PaperDollInfoFrame\\UI-Character-Honor-BottomLeft",
			s =  {260, 128*(1-100/128)+15},
			p = {"TOPLEFT", 54, -58},
			c = {1, 0, (1-(100/128*.85)), 0}
	},
}

function aui.InitABMenu()
	local self = AMM
	self.loadedbuttons = {};
	self:SetSize(304, 100)
	self:SetPoint("TOPRIGHT", UIParent, "BOTTOMRIGHT", -290, -22) 
	self.textures = {};
	for i = 1, 4 do
		local t = self:CreateTexture()
		local d = TexData[i]
		t:SetTexture(d.t)
		t:SetSize(d.s[1], d.s[2])
		t:SetPoint(d.p[1], d.p[2], d.p[3])
		t:SetTexCoord(unpack(d.c))
		self.textures[i] = t
	end

	CharacterMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint('TOPLEFT', self, 0, -18)
	hooksecurefunc('MoveMicroButtons', function(anchor, achorTo, relAnchor, x, y, isStacked)
		if (not isStacked) then
			CharacterMicroButton:ClearAllPoints()
			CharacterMicroButton:SetPoint('TOPLEFT', AMM, 0, -18)
			for k,button in pairs(AMM.loadedbuttons) do
				button:Show()
			end
		else
			for k,button in pairs(AMM.loadedbuttons) do
				button:Hide()
			end
		end
	end)

    for i=1, #MICRO_BUTTONS do
    	local f = _G[MICRO_BUTTONS[i]]
    	if f then
        	f:HookScript("OnLeave", SlideOutFrame)
        	f:HookScript("OnEnter", SlideCancel)
        end
    end

	aui.SetupFrameForSliding(self, .5, 'Y', 100)

	self:RegisterEvent("ADDON_LOADED")
	self:SetScript("OnEvent", self.UpdateButtons)
	self:UpdateButtons()

	self:SetScript("OnLeave", SlideOutFrame)
	self:SetScript("OnEnter", SlideCancel)

	MakeButton()
 -- This addon gets loaded late, should be good
 --	local LDB = LibStub and LibStub:GetLibrary("LibDataBroker-1.1", true)
--	if LDB then
--		for k,v in LDB:DataObjectIterator() do
--			self:MakePlugin(k,v)
--			LDB.RegisterCallback(self, "LibDataBroker_AttributeChanged_"..k.."_icon", "UpdatePlugin")
--			LDB.RegisterCallback(self, "LibDataBroker_AttributeChanged_"..k.."_OnClick", "UpdatePlugin")
--		end
--    	LDB.RegisterCallback(self, "LibDataBroker_DataObjectCreated", "MakePlugin")
--	end
end

--aui:RegisterEvent("PLAYER_LOGIN", Init)