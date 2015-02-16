local AUI, aui = ...

function aegerUI_ActionBars:OnEnable()
local playerClass
local cfg = aegerUI.db.global.ActionBarOptions

local FRAMES_DISABLE_MOVEMENT = {
	'MultiBarLeft',
	'MultiBarRight',
	'MultiBarBottomRight',
	'PossessBarFrame',
	'MULTICASTACTIONBAR_YPOS',
	'MultiCastActionBarFrame',
	--'PETACTIONBAR_YPOS',
}

local HIDE_FRAMES = {
	'ActionBarUpButton', 'ActionBarDownButton',
	'MainMenuBarBackpackButton','CharacterBag0Slot','CharacterBag1Slot','CharacterBag2Slot','CharacterBag3Slot',
	'MainMenuBarTexture2','MainMenuMaxLevelBar2','MainMenuBarTexture3','MainMenuMaxLevelBar3',
	'ReputationWatchBarTexture2','ReputationXPBarTexture2',
	'ReputationWatchBarTexture3','ReputationXPBarTexture3',
	'MainMenuBarPageNumber',
	'SlidingActionBarTexture0','SlidingActionBarTexture1',
	'StanceBarLeft','StanceBarMiddle','StanceBarRight',
	'PossessBackground1','PossessBackground2',
}

local SHORTEN_FRAMES = {
    'MainMenuBar',
    'MainMenuExpBar',
    'MainMenuBarMaxLevelBar',
    'ReputationWatchBar',
    'ReputationWatchStatusBar',
}

local function CreateShortBars()
	-- Fix some stuff 
	for _, frame in pairs(FRAMES_DISABLE_MOVEMENT) do
		UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
	end

	for _, name in pairs(HIDE_FRAMES) do
		local object = _G[name]
		if not object then print(name) end
		if (object:IsObjectType('Frame') or object:IsObjectType('Button')) then
			object:UnregisterAllEvents()
			object:SetScript('OnEnter', nil)
			object:SetScript('OnLeave', nil)
			object:SetScript('OnClick', nil)
		else
			object.Show = object.Hide
		end
		object:Hide()
	end
	--  [[  Shorten textures  ]]  --
	for _, name in pairs(SHORTEN_FRAMES) do
		_G[name]:SetWidth(512)
	end

	    -- remove divider

	for i = 1, 19, 2 do
	    for _, object in pairs({_G['MainMenuXPBarDiv'..i]}) do
	        object.Show = object.Hide
	        object:Hide()
	    end
	end

	hooksecurefunc(_G['MainMenuXPBarDiv2'], 'Show', function(self)
	    local divWidth = MainMenuExpBar:GetWidth() / 10
	    local xpos = divWidth - 4.5

	    for i = 2, 19, 2 do
	        local texture = _G['MainMenuXPBarDiv'..i]
	        local xalign = floor(xpos)
	        texture:SetPoint('LEFT', xalign, 1)
	        xpos = xpos + divWidth
	    end
	end)

	_G['MainMenuXPBarDiv2']:Show()

	--  [[  MultiBarBottomRight (now top middle)  ]]  --
	MultiBarBottomRight:EnableMouse(false)
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint('BOTTOMLEFT', MultiBarBottomLeftButton1, 'TOPLEFT', 0, 6)
	
	MainMenuBarTexture0:SetPoint('BOTTOM', MainMenuBarArtFrame, -128, 0)
	MainMenuBarTexture1:SetPoint('BOTTOM', MainMenuBarArtFrame, 128, 0)
	MainMenuMaxLevelBar0:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -128, 0)
	MainMenuBarLeftEndCap:SetPoint('BOTTOM', MainMenuBarArtFrame, -289, 0)
	MainMenuBarRightEndCap:SetPoint('BOTTOM', MainMenuBarArtFrame, 289, 0)

	MainMenuBarVehicleLeaveButton:HookScript('OnShow', function(self)
		self:ClearAllPoints()
		self:SetPoint('LEFT', MainMenuBar, 'RIGHT', 10, 75)
	end)
end

local function SetupBars()
	local function EnableFading(frame, element)
	    frame:HookScript('OnEnter', function()
	        securecall('UIFrameFadeIn', element, 0.2, element:GetAlpha() or 0, 1)
	    end)
	    frame:HookScript('OnLeave', function()
	        securecall('UIFrameFadeOut', element, 0.2, element:GetAlpha() or 1, 0) 
	    end)
	end

	--  [[  Rep Bar  ]]  --
	ReputationWatchStatusBarText:SetFont('Fonts\\ARIALN.ttf', 14, 'THINOUTLINE')
	ReputationWatchStatusBarText:SetShadowOffset(0, 0)
	ReputationWatchStatusBarText:SetAlpha(0)
	EnableFading(ReputationWatchBar, ReputationWatchStatusBarText)

	--  [[  Exp Bar  ]]  --
	MainMenuBarExpText:SetFont('Fonts\\ARIALN.ttf', 14, 'THINOUTLINE')
	MainMenuBarExpText:SetShadowOffset(0, 0)
    MainMenuBarExpText:SetAlpha(0)
	EnableFading(MainMenuExpBar, MainMenuBarExpText)
    
	-- [[  Stance Bar  ]]  --
	if (aegerUI.db.global.HideStanceBar[playerClass]) then
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G['StanceButton'..i]
			button:SetAlpha(0)
			button.SetAlpha = function() end

			button:EnableMouse(false)
			button.EnableMouse = function() end
		end
	end
	
    hooksecurefunc(StanceBarFrame, "SetPoint", function(self, ...)
    	if InCombatLockdown() then return; end
    	local point, anchor, rpoint, x, y = ...

    	if MultiBarBottomRight:IsVisible() and y < 80 then
    		self:SetPoint(point, anchor, rpoint, x -30, y + 45)
    	end
    end)

	--  [[  MultiBarRight  ]]  --
	MultiBarRight:ClearAllPoints()
  MultiBarRight:SetPoint('TOPRIGHT', UIParent, 'RIGHT', -6, (MultiBarRight:GetHeight() / 2))

    --  [[  MultiBarLeft  ]]  --
  MultiBarLeft:SetParent(UIParent)
	MultiBarLeft:ClearAllPoints()
	MultiBarLeft:SetPoint('TOPRIGHT', MultiBarRightButton1, 'TOPLEFT', -6, 0)

	--  [[  Kill the shit that places spells  ]] --
	IconIntroTracker:UnregisterAllEvents()
	IconIntroTracker:Hide()
	IconIntroTracker.Show = function() end
end

local function BuildPetBar()

	   --  [[  Pet Bar  ]]  --
  local petBar = CreateFrame("Frame", nil, PetActionBarFrame);
	petBar:SetFrameStrata("BACKGROUND");
	petBar:SetWidth(330);
	petBar:SetHeight(33);
	for i = 1, 12 do
		local button = _G["PetActionButton"..i];--getglobal("PetActionButton"..i);
		if (button ~= nil) then
			button:ClearAllPoints();
			local x = 2 + ((i - 1) * 33);
			local y = -1;
			button:SetPoint("BOTTOMLEFT", petBar, "TOPLEFT", x, y);
		end
	end
	local _, _, class = UnitClass("player");
	local offset = 0;

	if(ReputationWatchBar:IsShown() and MainMenuExpBar:IsShown())then
		offset = 0;
	else
		offset = 8;
	end

	if ( StanceBarFrame and GetNumShapeshiftForms() > 0 ) then
		petBar:ClearAllPoints();
		petBar:SetPoint("CENTER", -415, offset);
	else
		petBar:ClearAllPoints();
		petBar:SetPoint("CENTER", 50, offset);
	end
end

local function EnableMouseOverBars()
	-- Custom UIFrameFadeIn/Out(frame, time, startA, endA, holdTime)
	local function Bar_OnEnter(bar)
		aui.UIFrameFadeIn(bar, 0.4, bar:GetAlpha(), 1)
	end

	local function Bar_OnLeave(bar)
		if not bar:IsMouseOver() then -- In case mouse went from bar to button or vice
			aui.UIFrameFadeOut(bar, 0.4, 1, 0, 2)
		end
	end

	local function Button_OnEnter(button)
		local bar = button:GetParent()
		Bar_OnEnter(bar)
	end

	local function Button_OnLeave(button)
		local bar = button:GetParent()
		Bar_OnLeave(bar)
	end

	for name, key in pairs(aegerUI.db.global.FadeOutBars) do
		local bar = _G[name]
		if bar and key then
			-- hook for cooldown alpha
			hooksecurefunc(bar, "SetAlpha", function(self, alpha)
				local name = self:GetName()
				alpha = alpha * .7
				for i = 1, 12 do
					_G[name..'Button'..i].cooldown:SetSwipeColor(0,0,0,alpha)
				end
			end)

			bar:EnableMouse(true) -- So it doesnt hide when mouse is between buttons
			bar:HookScript("OnEnter", Bar_OnEnter)
			bar:HookScript("OnLeave", Bar_OnLeave)
			bar:Show()
			bar:SetAlpha(0)

			for i = 1, 12 do
				local button = _G[name..'Button'..i]
				button:HookScript("OnEnter", Button_OnEnter)
				button:HookScript("OnLeave", Button_OnLeave)
			end
		end
	end

	local seenFlyoutButtons = 1
	-- Fix so flyoutbuttons counts as bars
	hooksecurefunc(SpellFlyout, "Toggle", function(self, flyoutID, parent, direction, distance, isActionBar, specID, showFullTooltip)
		if not self:IsShown() then return end
		local _, _, numSlots, isKnown = GetFlyoutInfo(flyoutID)
		for i = seenFlyoutButtons, numSlots do
			local name = 'SpellFlyoutButton'..i
			local b = _G[name]
			if b then
				b:HookScript("OnEnter", function(self)
					local flyOut = self:GetParent()
					if flyOut.isActionBar then
						local parentBar = flyOut:GetParent():GetParent()
						if not aegerUI.db.global.FadeOutBars[parentBar:GetName()] then return end
						Bar_OnEnter(parentBar)
					end
				end)
				b:HookScript("OnLeave", function(self)
					local flyOut = self:GetParent()
					if flyOut.isActionBar then
						local parentBar = flyOut:GetParent():GetParent()
						if not aegerUI.db.global.FadeOutBars[parentBar:GetName()] then return end
						Bar_OnLeave(parentBar)
					end
				end)
			end
			seenFlyoutButtons = numSlots + 1
		end
	end)
	SpellFlyout:HookScript("OnEnter", function(self)
		if self.isActionBar then
			local parentBar = self:GetParent():GetParent()
			if not aegerUI.db.global.FadeOutBars[parentBar:GetName()] then return end
			Bar_OnEnter(parentBar)
		end
	end)
	SpellFlyout:HookScript("OnLeave", function(self)
		if self.isActionBar then
			local parentBar = self:GetParent():GetParent()
			if not aegerUI.db.global.FadeOutBars[parentBar:GetName()] then return end
			Bar_OnLeave(parentBar)
		end
	end)
end

local function LoadActionBars()
	playerClass = select(2, UnitClass('player'))
	SetupBars()
	CreateShortBars()
	EnableMouseOverBars()
	BuildPetBar()
end

hooksecurefunc('ActionButton_UpdateUsable', function(self)
    if (IsAddOnLoaded('RedRange') or IsAddOnLoaded('GreenRange') or IsAddOnLoaded('tullaRange') or IsAddOnLoaded('RangeColors')) then
        return
    end  

    local normal = _G[self:GetName()..'NormalTexture']
    if (normal) then
        normal:SetVertexColor(cfg.color.Normal[1], cfg.color.Normal[2], cfg.color.Normal[3], 1) 
    end

    local isUsable, notEnoughMana = IsUsableAction(self.action)
    if (isUsable) then
        _G[self:GetName()..'Icon']:SetVertexColor(1, 1, 1)
    elseif (notEnoughMana) then
        _G[self:GetName()..'Icon']:SetVertexColor(unpack(cfg.color.OutOfMana))
    else
        _G[self:GetName()..'Icon']:SetVertexColor(unpack(cfg.color.NotUsable))
    end
end)

hooksecurefunc('ActionButton_OnUpdate', function(self, elapsed)
    if (IsAddOnLoaded('tullaRange') or IsAddOnLoaded('RangeColors')) then
        return
    end

    if (self.rangeTimer) then
        if (self.rangeTimer - elapsed <= 0) then
            local isInRange = false
            if (IsActionInRange(self.action) == false) then
                _G[self:GetName()..'Icon']:SetVertexColor(unpack(cfg.color.OutOfRange))
                isInRange = true
            end

            if (self.isInRange ~= isInRange) then
                self.isInRange = isInRange
                ActionButton_UpdateUsable(self)
            end
        end
    end
end)

LoadActionBars()
--aui:RegisterEvent("PLAYER_LOGIN", LoadActionBars)
end