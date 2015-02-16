local AUI, aui = ...

---------------------------------------------------------------------------
--							Event Handler								 --
---------------------------------------------------------------------------
local eventframe = CreateFrame("Frame")
eventframe:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		for _, func in pairs(self[event]) do
			func(event, ...)
		end
	end
end)

function aui.RegisterEvent(event, func)
	assert(type(event) == "string")
	if not eventframe[event] then
		eventframe[event] = {}
	end
	table.insert(eventframe[event], func)
	return eventframe:RegisterEvent(event)
end

function aui.UnregisterEvent(event, func) 
	if not eventframe[event] then return; end
	if func and eventframe[event][func]  then
		eventframe[event][func] = nil
	end
	if #eventframe[event] == 0 then
		eventframe:UnregisterEvent(event)
	end
end


---------------------------------------------------------------------------
--							Print										 --
---------------------------------------------------------------------------
function aui.Print(...)
	if (not ...) then return; end
	local s = ""
	local t = {...}
	for i = 1, #t do
		s = s .. " " .. t[i]
	end
	return print("|cffffcf00AegerUI:|r"..s)
end

---------------------------------------------------------------------------
--	For fading frame, almost like UIFrameFadeIn/Out
--	But doesnt call Hide() or Show() so can be used on secure frames 
---------------------------------------------------------------------------

local FadeManager = CreateFrame("FRAME");
local FADINGFRAMES = {}

local function FadeManager_OnUpdate(self, elapsed)
	local index = 1;
	local frame, fadeInfo;
	while FADINGFRAMES[index] do
		frame = FADINGFRAMES[index];
		fadeInfo = FADINGFRAMES[index].fadeInfo;
		-- Reset the timer if there isn't one, this is just an internal counter
		if ( not fadeInfo.fadeTimer ) then
			fadeInfo.fadeTimer = 0;
		end
		fadeInfo.fadeTimer = fadeInfo.fadeTimer + elapsed;
 
		-- If there is a fadeHoldTime then wait until its passed to continue on
		if ( fadeInfo.waitTime and fadeInfo.waitTime > 0  ) then
			frame:SetAlpha(fadeInfo.startAlpha)
			fadeInfo.waitTime = fadeInfo.waitTime - elapsed;
			
		-- If the fadeTimer is less then the desired fade time then set the alpha otherwise hold the fade state, call the finished function, or just finish the fade 
		elseif ( fadeInfo.fadeTimer < fadeInfo.timeToFade ) then
			if ( fadeInfo.mode == "IN" ) then
				frame:SetAlpha((fadeInfo.fadeTimer / fadeInfo.timeToFade) * (fadeInfo.endAlpha - fadeInfo.startAlpha) + fadeInfo.startAlpha);
			elseif ( fadeInfo.mode == "OUT" ) then
				frame:SetAlpha(((fadeInfo.timeToFade - fadeInfo.fadeTimer) / fadeInfo.timeToFade) * (fadeInfo.startAlpha - fadeInfo.endAlpha)  + fadeInfo.endAlpha);
			end
		else
			frame:SetAlpha(fadeInfo.endAlpha);
			-- Complete the fade and call the finished function if there is one
			tDeleteItem(FADINGFRAMES, frame);
			if ( fadeInfo.finishedFunc ) then
				fadeInfo.finishedFunc(fadeInfo.finishedArg1, fadeInfo.finishedArg2, fadeInfo.finishedArg3, fadeInfo.finishedArg4);
				fadeInfo.finishedFunc = nil;
			end
		end
		index = index + 1;
	end
	 
	if ( #FADINGFRAMES == 0 ) then
		self:SetScript("OnUpdate", nil);
	end
end

-- Generic fade function
local function FadeFrame(frame, fadeInfo)
	if (not frame) then
		return;
	end
	if ( not fadeInfo.mode ) then
		fadeInfo.mode = "IN";
	end
	local alpha;
	if ( fadeInfo.mode == "IN" ) then
		if ( not fadeInfo.startAlpha ) then
			fadeInfo.startAlpha = 0;
		end
		if ( not fadeInfo.endAlpha ) then
			fadeInfo.endAlpha = 1.0;
		end
		alpha = 0;
	elseif ( fadeInfo.mode == "OUT" ) then
		if ( not fadeInfo.startAlpha ) then
			fadeInfo.startAlpha = 1.0;
		end
		if ( not fadeInfo.endAlpha ) then
			fadeInfo.endAlpha = 0;
		end
		alpha = 1.0;
	end

	-- Holding the frame travels back in time
	if ( fadeInfo.waitTime and fadeInfo.waitTime > 0 ) then
		fadeInfo.fadeTimer = - fadeInfo.waitTime
	end

	frame:SetAlpha(fadeInfo.startAlpha);
	frame.fadeInfo = fadeInfo;
 
	local index = 1;
	while FADINGFRAMES[index] do
		-- If frame is already set to fade, stop!
		if ( FADINGFRAMES[index] == frame ) then
			-- its currently moving, queue it up after the animation is finished
			FADINGFRAMES[index].fadeInfo.endFunc = FadeFrame
			FADINGFRAMES[index].fadeInfo.arg1 = frame
			FADINGFRAMES[index].fadeInfo.arg2 = fadeInfo
			return;
		end
		index = index + 1;
	end
	tinsert(FADINGFRAMES, frame);
	FadeManager:SetScript("OnUpdate", FadeManager_OnUpdate);
end
 
-- Convenience function to do a simple fade in
function aui.UIFrameFadeIn(frame, timeToFade, startAlpha, endAlpha, waitTime)
	local fadeInfo = {};
	fadeInfo.mode = "IN";
	fadeInfo.timeToFade = timeToFade;
	fadeInfo.startAlpha = startAlpha;
	fadeInfo.endAlpha = endAlpha;
	fadeInfo.waitTime = waitTime
	FadeFrame(frame, fadeInfo);
end
 
-- Convenience function to do a simple fade out
function aui.UIFrameFadeOut(frame, timeToFade, startAlpha, endAlpha, waitTime)
	local fadeInfo = {};
	fadeInfo.mode = "OUT";
	fadeInfo.timeToFade = timeToFade;
	fadeInfo.startAlpha = startAlpha;
	fadeInfo.endAlpha = endAlpha;
	fadeInfo.waitTime = waitTime
	FadeFrame(frame, fadeInfo);
end

--[=============================================[

	For Sliding frames
	horOrVert: 'X' or 'Y'
	AnimationSlideStart(frame, timeToSlide, horOrVert, distToSlide)
	AnimationSlideReturn(frame, delay)

--]=============================================]

local SlideManager = CreateFrame("Frame")
local SLIDEFRAMES = {}
local RETURNFRAMES = {}

local function SlideManager_OnUpdate(self, elapsed)
	local i = 1;
	local frame, slideInfo;
	while SLIDEFRAMES[i] do
		frame = SLIDEFRAMES[i]
		slideInfo = SLIDEFRAMES[i].slideInfo

		if not slideInfo.slideTimer then
			slideInfo.slideTimer = 0;
		end
		slideInfo.slideTimer = slideInfo.slideTimer + elapsed;

		local p, rp, x, y = unpack(slideInfo.origPos)
		
		local distance 
		if slideInfo.stage == "SlidingBack" then
			distance = -slideInfo.distance
		else
			distance = slideInfo.distance
		end

		-- delay, lets wait
		if slideInfo.delay then
			if slideInfo.delay > slideInfo.slideTimer then
				slideInfo.delay = slideInfo.delay - elapsed
			else
				-- reset the timer
				slideInfo.delay = nil;
				slideInfo.slideTimer = 0;
				slideInfo.stage = "SlidingBack";
			end
		-- Sliding isnt done yet
		elseif slideInfo.slideTimer < slideInfo.timeToSlide then
			local yPos, xPos
			if slideInfo.dir == 'Y' then
				if slideInfo.stage == "SlidingBack" then
					yPos = (slideInfo.slideTimer/slideInfo.timeToSlide)^2 * (distance) + (y - distance);
				else
					yPos = sqrt(slideInfo.slideTimer/slideInfo.timeToSlide) * (distance) + y;
				end
				frame:SetPoint(p, frame:GetParent(), rp, x, yPos)
			elseif slideInfo.dir == 'X' then
				if slideInfo.stage == "SlidingBack" then
					xPos = (slideInfo.slideTimer/slideInfo.timeToSlide)^2 * (distance) + (x - distance);
				else
					xPos = sqrt(slideInfo.slideTimer/slideInfo.timeToSlide) * (distance) + x;
				end
				frame:SetPoint(p, frame:GetParent(), rp, xPos, y)
			end
		-- Were finished
		else
			if slideInfo.stage == "SlidingBack" then -- Put it back in original position
				frame:SetPoint(p, frame:GetParent(), rp, x, y);
				slideInfo.stage = "Finished"
			elseif slideInfo.dir == 'Y' then
				slideInfo.stage = "SlidedOut"
				frame:SetPoint(p, frame:GetParent(), rp, x, (y + distance));
			elseif slideInfo.dir == 'X' then
				slideInfo.stage = "SlidedOut"
				frame:SetPoint(p, frame:GetParent(), rp, (x + distance), y);
			end
			-- Run the finish function if there is one
			if slideInfo.endFunc then
				slideInfo.endFunc(slideInfo.arg1, slideInfo.arg2)
				slideInfo.endFunc, slideInfo.arg1, slideInfo.arg2 = nil, nil, nil;
			end
			slideInfo.slideTimer = 0;
			-- Finished, remove it from the cache
			tDeleteItem(SLIDEFRAMES, frame);
		end
		i = i + 1
	end

	if ( #SLIDEFRAMES == 0 ) then
		self:SetScript("OnUpdate", nil);
	end
end

local function AnimationSlideStart(frame, func, arg1, arg2)

	local index = 1;
	while SLIDEFRAMES[index] do
		-- If frame is already set to sliding 
		if ( SLIDEFRAMES[index] == frame ) then
			if frame.slideInfo.stage == "Delay" then
				-- If its waiting to go back, cancel it
				tDeleteItem(SLIDEFRAMES, frame);
				frame.slideInfo.stage = "SlidedOut";
				frame.slideInfo.slideTimer = 0;
				tinsert(RETURNFRAMES, frame)
			end
			return;
		end
		index = index + 1;
	end

	index = 1;
	while RETURNFRAMES[index] do
		-- If frame hasnt returned yet, we cant move it
		if ( RETURNFRAMES[index] == frame ) then
			return;
		end
		index = index + 1;
	end

	frame.slideInfo.endFunc = func;
	frame.slideInfo.arg1 = arg1;
	frame.slideInfo.arg2 = arg2;
	frame.slideInfo.stage = "SlidingOut";

	tinsert(RETURNFRAMES, frame);
	tinsert(SLIDEFRAMES, frame);
	SlideManager:SetScript("OnUpdate", SlideManager_OnUpdate);
end

local function AnimationSlideReturn(frame, delay)
	if (not frame) then
		return;
	end
	local index = 1;
	while SLIDEFRAMES[index] do
		if ( SLIDEFRAMES[index] == frame ) then
			-- its currently moving, queue it up after the animation is finished
			SLIDEFRAMES[index].slideInfo.endFunc = AnimationSlideReturn
			SLIDEFRAMES[index].slideInfo.arg1 = frame
			SLIDEFRAMES[index].slideInfo.arg2 = delay
			return;
		end
		index = index + 1;
	end

	if delay and delay <= 0 then delay = nil; end

	local index = 1;
	while RETURNFRAMES[index] do
		-- Found the frame!
		if ( RETURNFRAMES[index] == frame ) and frame.slideInfo then
			frame.slideInfo.stage = delay and "Delay" or "SlidingBack";
			frame.slideInfo.delay = delay;
			tinsert(SLIDEFRAMES, frame);
			tDeleteItem(RETURNFRAMES, frame)
			SlideManager:SetScript("OnUpdate", SlideManager_OnUpdate);
			return;
		end
		index = index + 1;
	end
end

function aui.SetupFrameForSliding(frame, timeToSlide, horOrVert, distToSlide)
	if (not frame) then
		return;
	end

	if (horOrVert ~= 'Y' and horOrVert ~= 'X') then
		horOrVert = "Y";
	end

	local slideInfo = { };
	local p, _, rp, x, y = frame:GetPoint()
	slideInfo.origPos = {p, rp, x, y}; --p, rp, x, y
	slideInfo.dir = horOrVert;
	slideInfo.timeToSlide = timeToSlide;
	slideInfo.distance = distToSlide;
	slideInfo.stage = "Finished";
	frame.slideInfo = slideInfo;

	frame.AnimationSlideReturn = AnimationSlideReturn
	frame.AnimationSlideStart = AnimationSlideStart
end

--[=======================================[
			BORDER
	How to use:
		
		frame.borderTextures 
		frame.borderShadow
		frame:CreateBorder(size, padding, layer)
		frame:SetBorderColor(r, g, b, a)
		frame:SetBorderShadowColor(r, g, b, a)
		frame:SetBorderTextureFile() - 'white' or nothing
		frame:SetBorderSize(size)
		frame:GetBorderSize(self)
		frame:SetBorderPadding(T, B, L, R)

--]=======================================]

local textureNormal = 'Interface\\AddOns\\aegerUI\\Media\\Border\\textureNormal'
local textureWhite = 'Interface\\AddOns\\aegerUI\\Media\\Border\\textureWhite'
local textureShadow = 'Interface\\AddOns\\aegerUI\\Media\\Border\\textureShadow'
local sections = { "TOPLEFT", "TOPRIGHT", "TOP", "BOTTOMLEFT", "BOTTOMRIGHT", "BOTTOM", "LEFT", "RIGHT" }

local function SetBorderColor(self, r, g, b, a)
	local t = self.borderTextures
	if t then
		if not r or not g and not b then
			r, g, b = 1, 1, 1
		end
		for _, tex in pairs (t) do
			tex:SetVertexColor(r, g, b, a or 1)
		end
	end
end

local function SetBorderShadowColor(self, r, g, b, a)
	local t = self.borderShadow
	if t then
		if not r or not g and not b then
			r, g, b = 1, 1, 1
		end
		for _, tex in pairs (t) do
			tex:SetVertexColor(r, g, b, a or 1)
		end
	end
end
-----------------
local function SetBorderTextureFile(self, texture)
	local b = self.borderTextures
	if b then
		if texture == 'white' then 
			texture = textureWhite
		else
			texture = textureNormal
		end
		for _, tex in pairs(b) do
			tex:SetTexture(texture)
		end
	end
end
-----------------
local function SetBorderSize(self, size)
	local b = self.borderTextures
	local s = self.borderShadow
	if b then
		for _, tex in pairs(b) do
			tex:SetSize(size, size) 
		end
	end
	if s then
		for _, tex in pairs(s) do
			tex:SetSize(size, size) 
		end
	end
end

local function GetBorderSize(self)
	if self.borderTextures then
		local size = self.borderTextures.TOPRIGHT:GetSize()
		return size
	end
end
------------------
local function SetBorderPadding(self, T, B, L, R)
	local b = self.borderTextures
	local s = self.borderShadow
	if b and T then
		if not R and not B and not B and not L then
			R, B, L = T, T, T
		end

		b.TOPLEFT:SetPoint("TOPLEFT", self, -L, T)
		b.TOPRIGHT:SetPoint("TOPRIGHT", self, R, T)
		b.TOP:SetPoint("TOPLEFT", b.TOPLEFT, "TOPRIGHT")
		b.TOP:SetPoint("TOPRIGHT", b.TOPRIGHT, "TOPLEFT")
		b.BOTTOMLEFT:SetPoint("BOTTOMLEFT", self, -L, -B)
		b.BOTTOMRIGHT:SetPoint("BOTTOMRIGHT", self, R, -B)
		b.BOTTOM:SetPoint("BOTTOMLEFT", b.BOTTOMLEFT, "BOTTOMRIGHT")
		b.BOTTOM:SetPoint("BOTTOMRIGHT", b.BOTTOMRIGHT, "BOTTOMLEFT")
		b.LEFT:SetPoint("TOPLEFT", b.TOPLEFT, "BOTTOMLEFT")
		b.LEFT:SetPoint("BOTTOMLEFT", b.BOTTOMLEFT, "TOPLEFT")
		b.RIGHT:SetPoint("TOPRIGHT", b.TOPRIGHT, "BOTTOMRIGHT")
		b.RIGHT:SetPoint("BOTTOMRIGHT", b.BOTTOMRIGHT, "TOPRIGHT")

		local space = (self:GetBorderSize()) / 3.5

		s.TOPLEFT:SetPoint("TOPLEFT", self, -(L+space), (T+space))
		s.TOPRIGHT:SetPoint("TOPRIGHT", self, (R+space), (T+space))
		s.TOP:SetPoint("TOPLEFT", s.TOPLEFT, "TOPRIGHT")
		s.TOP:SetPoint("TOPRIGHT", s.TOPRIGHT, "TOPLEFT")
		s.BOTTOMLEFT:SetPoint("BOTTOMLEFT", self, -(L+space), -(B+space))
		s.BOTTOMRIGHT:SetPoint("BOTTOMRIGHT", self, (R+space), -(B+space))
		s.BOTTOM:SetPoint("BOTTOMLEFT", s.BOTTOMLEFT, "BOTTOMRIGHT")
		s.BOTTOM:SetPoint("BOTTOMRIGHT", s.BOTTOMRIGHT, "BOTTOMLEFT")
		s.LEFT:SetPoint("TOPLEFT", s.TOPLEFT, "BOTTOMLEFT")
		s.LEFT:SetPoint("BOTTOMLEFT", s.BOTTOMLEFT, "TOPLEFT")
		s.RIGHT:SetPoint("TOPRIGHT", s.TOPRIGHT, "BOTTOMRIGHT")
		s.RIGHT:SetPoint("BOTTOMRIGHT", s.BOTTOMRIGHT, "TOPRIGHT")
	end
end
-----------------
function aui.CreateBorder(self, size, padding, layer)
	if type(self) ~= 'table' or self.borderTextures then return end

	if not (self.borderTextures) then
		local b = {}
		local s = {}

		for i = 1, 8 do 
			local t = self:CreateTexture(nil, layer or 'OVERLAY')
			t:SetParent(self)
			t:SetTexture(textureNormal)
			t:SetVertexColor(1, 1, 1, 1)
			b[sections[i]] = t
		end

		for i = 1, 8 do 
			local t = self:CreateTexture(nil, 'BORDER')
			t:SetParent(self)
			t:SetTexture(textureShadow)
			t:SetVertexColor(0, 0, 0, 1)
			s[sections[i]] = t
		end

		b.TOPLEFT:SetTexCoord(0, 1/3, 0, 1/3)
		b.TOPRIGHT:SetTexCoord(2/3, 1, 0, 1/3)
		b.TOP:SetTexCoord(1/3, 2/3, 0, 1/3)
		b.BOTTOMLEFT:SetTexCoord(0, 1/3, 2/3, 1)
		b.BOTTOMRIGHT:SetTexCoord(2/3, 1, 2/3, 1)
		b.BOTTOM:SetTexCoord(1/3, 2/3, 2/3, 1)
		b.LEFT:SetTexCoord(0, 1/3, 1/3, 2/3)
		b.RIGHT:SetTexCoord(2/3, 1, 1/3, 2/3)

		s.TOPLEFT:SetTexCoord(0, 1/3, 0, 1/3)
		s.TOPRIGHT:SetTexCoord(2/3, 1, 0, 1/3)
		s.TOP:SetTexCoord(1/3, 2/3, 0, 1/3)
		s.BOTTOMLEFT:SetTexCoord(0, 1/3, 2/3, 1)
		s.BOTTOMRIGHT:SetTexCoord(2/3, 1, 2/3, 1)
		s.BOTTOM:SetTexCoord(1/3, 2/3, 2/3, 1)
		s.LEFT:SetTexCoord(0, 1/3, 1/3, 2/3)
		s.RIGHT:SetTexCoord(2/3, 1, 1/3, 2/3)

		self.borderTextures = b
		self.borderShadow = s

		self.SetBorderColor = SetBorderColor
		self.SetBorderShadowColor = SetBorderShadowColor
		self.SetBorderTextureFile = SetBorderTextureFile
		self.SetBorderSize = SetBorderSize
		self.GetBorderSize = GetBorderSize
		self.SetBorderPadding = SetBorderPadding
		self:SetBorderSize(size or 11)
		self:SetBorderPadding(padding or 3)
	end
end


function aui.Kill(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	else
		object.Show = object.Hide
	end
	
	object:Hide()
end