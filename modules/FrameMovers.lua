-------------------------------------------------------------------------------
--  aegerUI 5.4.5 http://www.wowinterface.com/downloads/info22493-aegerUI.html
-------------------------------------------------------------------------------

--  Namespace -----------------------------------------------------------------	
	local addonname, aegerUI = ...

--  Constants  ----------------------------------------------------------------
	local MEDIA_PATH = "Interface\\AddOns\\aegerUI\\media\\"
	local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]
	local FONT = "Fonts\\FRIZQT__.ttf"

-- Define locals and local functions up here so they're in scope for the whole file
	local aegerUI_MoveQuestWatchFrame
	local HookWatchFrame_Update = WatchFrame_Update

--  Event logic  --------------------------------------------------------------
	local aegerUI_FrameMover = CreateFrame('Frame')

	aegerUI_FrameMover:RegisterEvent('PLAYER_LOGIN')

	aegerUI_FrameMover:SetScript('OnEvent',function(self, event_name, ...)
            local func = self[event_name]
            if func then
                    func(self, ...) 
            else
                    -- If you don't have a function EventFrame:EVENT_NAME() then it errors to
                    -- let you know you forgot to define it (see below, "events").
                    error(('could not find function for `%s`: forgot to define?'):format(event_name))
            end
    end)
	
--  Events  ---------------------------------------------------------------------
	function aegerUI_FrameMover:PLAYER_LOGIN()
      aegerUI_MoveQuestWatchFrame()
	end

--  Core logic  ---------------------------------------------------------------
	function aegerUI_MoveQuestWatchFrame()
	  WatchFrame:ClearAllPoints()
      WatchFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 17, -230)
	-- Stop the default UI from moving it back
      local noop = function() end
      WatchFrame.ClearAllPoints = noop
      WatchFrame.SetPoint = noop
	end

	-- Auto resize for the quest watch frame
	--Credit for this function is from SmartFrameViewer by Aeldra
	local function UpdateWatchFrameHeight()  
	local yt, yb = UIParent:GetBottom(), UIParent:GetTop();
	  for i = 1, 50, 1 do
    local l = _G["WatchFrameLine"..i];
	  if (l and l:IsVisible()) then
	--print("Quest line = "..i);
	 local t, b = l:GetTop(), l:GetBottom();
	  if (t and t > yt) then yt = t; end
	  if (b and b < yb) then yb = b; end
	  end
	end
	local h = yt - yb + 40;
	  if (h <= 0) then
	    h = 1;
    end
    WatchFrame:SetHeight(h);
    --print("WatchFrame height = "..h);
    end

	local isLockWF = false;
	function SmartFrameMover_WatchFrame_Update(self)
	if (isLockWF) then return; end
	  isLockWF = true;
	local h = UIParent:GetTop();
	  h = h - (h - WatchFrame:GetTop());
	WatchFrame:SetHeight(h);
	HookWatchFrame_Update(self);
	UpdateWatchFrameHeight();
	HookWatchFrame_Update(self);
	isLockWF = false;
	end

	WatchFrame_Update = SmartFrameMover_WatchFrame_Update;