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

-- Define locals and local functions up here so they're in scope for the whole file
	local DoChatOptions
	
--  Event logic  --------------------------------------------------------------
    local EventFrame = CreateFrame('Frame')
     
    EventFrame:RegisterEvent('PLAYER_LOGIN')
     
    EventFrame:SetScript('OnEvent',function(self, event_name, ...)
            local func = self[event_name]
            if func then
                    func(self, ...)  -- I don't think you need the event_name -- you already know what it is -- it's the name of the function!
            else
                    -- If you don't have a function EventFrame:EVENT_NAME() then it errors to
                    -- let you know you forgot to define it (see below, "events").
                    error(('could not find function for `%s`: forgot to define?'):format(event_name))
            end
    end)     
     
--  Events  ---------------------------------------------------------------------
    function EventFrame:PLAYER_LOGIN()
		DoChatOptions()	
    end
	
	function aegerUI:ChatFade()
		if aegerUI.db.global.DisableChatFade == true then
			for i=1,7 do _G["ChatFrame"..i]:SetFading(0) end
		end
	end
	
	function aegerUI:ChatClassColors()
		if aegerUI.db.global.EnableChatClassColors == true then
			for i in pairs(ChatTypeInfo) do   -- Enable All ColorNameByClass
				SetChatColorNameByClass(i,1)
			end
		end
	end
	
	function aegerUI:HideChatButtons()
		if aegerUI.db.global.HideChatbuttons == true then
	-- Code from Leatrix Plus to Hide Chat Buttons:

	-- Create hidden frame to store unwanted frames (more efficient than creating functions)
	local tframe = CreateFrame("FRAME")
	tframe:Hide()
	
	-- Function to add CTRL key and SHIFT key modifiers to mousescroll functionality
	local function AddChatModKeys(chtfrm)
		_G[chtfrm]:HookScript("OnMouseWheel", function(self, direction)
			if IsControlKeyDown() then
				if direction == 1 then self:ScrollToTop() else self:ScrollToBottom() end
			elseif IsShiftKeyDown() then 
				if direction == 1 then self:PageUp() else self:PageDown() end
			end
		end)
	end
	
	-- Function to hide chat buttons
	local function HideButtons(chtfrm)
		_G[chtfrm .. "ButtonFrameUpButton"]:SetParent(tframe)
		_G[chtfrm .. "ButtonFrameDownButton"]:SetParent(tframe)
		_G[chtfrm .. "ButtonFrameMinimizeButton"]:SetParent(tframe)
		_G[chtfrm .. "ButtonFrameUpButton"]:Hide();
		_G[chtfrm .. "ButtonFrameDownButton"]:Hide();
		_G[chtfrm .. "ButtonFrameMinimizeButton"]:Hide();
		_G[chtfrm .. "ButtonFrame"]:SetSize(0.1,0.1)
	end
	
	-- Function to highlight chat tabs and click to scroll to bottom
	local function HighlightTabs(chtfrm)
		-- Set position of bottom button
		_G[chtfrm .. "ButtonFrameBottomButtonFlash"]:SetTexture("Interface/BUTTONS/GRADBLUE.png")
		_G[chtfrm .. "ButtonFrameBottomButton"]:ClearAllPoints()
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetPoint("BOTTOM",_G[chtfrm .. "Tab"],6,0)
		_G[chtfrm .. "ButtonFrameBottomButton"]:Show()
		_G[chtfrm .. "ButtonFrameBottomButtonFlash"]:SetAlpha(0.5)
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetSize(60, 22)
		
		-- Resize bottom button according to tab size
		_G[chtfrm .. "Tab"]:SetScript("OnSizeChanged", function()
			for j = 1, NUM_CHAT_WINDOWS, 1 do
				-- Resize bottom button to tab width
				_G["ChatFrame" .. j .. "ButtonFrameBottomButton"]:SetWidth(_G["ChatFrame" .. j .. "Tab"]:GetWidth()-10)
			end
		end)
	
		-- Remove click from the bottom button
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetScript("OnClick", nil)
	
		-- Remove textures
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetNormalTexture("")
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetHighlightTexture("")
		_G[chtfrm .. "ButtonFrameBottomButton"]:SetPushedTexture("")
	
		-- Always scroll to bottom when clicking a tab
		_G[chtfrm .. "Tab"]:HookScript("OnClick", function(self,arg1)
			if arg1 == "LeftButton" then
				_G[chtfrm]:ScrollToBottom();
			end
		end)
	
	end
	
	-- Enable mouse scrolling and prevent changes
		SetCVar("chatMouseScroll", "1")
		InterfaceOptionsSocialPanelChatMouseScroll:Disable()
		InterfaceOptionsSocialPanelChatMouseScrollText:SetAlpha(0.3)
		InterfaceOptionsSocialPanelChatMouseScroll_SetScrolling("1")
	
	-- Hide chat menu button and friends button
	ChatFrameMenuButton:SetParent(tframe)
	FriendsMicroButton:SetParent(tframe)
	
	-- Set options for normal chat frames
	for i = 1, NUM_CHAT_WINDOWS, 1 do
		AddChatModKeys("ChatFrame" .. i);
		HideButtons("ChatFrame" .. i);
		HighlightTabs("ChatFrame" .. i)
	end
	
	-- Do the functions above for temporary chat frames
	hooksecurefunc("FCF_OpenTemporaryWindow", function(chatType)
		local cf = FCF_GetCurrentChatFrame():GetName() or nil
		if cf then
			-- Set options for temporary frame
			AddChatModKeys(cf);
			HideButtons(cf)
			HighlightTabs(cf)
			-- Resize flashing alert to match tab width
			_G[cf .. "Tab"]:SetScript("OnSizeChanged", function()
				_G[cf .. "ButtonFrameBottomButton"]:SetWidth(_G[cf .. "Tab"]:GetWidth()-10)
			end)
		end
	end)
	
	-- Hide conversation buttons that appear during battle.net chats
	hooksecurefunc("BNConversationButton_UpdateAttachmentPoint", function(self)
		if self:IsShown() then
			self:Hide()
		end
	end)
	
	for i = 1, NUM_CHAT_WINDOWS, 1 do
		_G["ChatFrame" .. i]:SetClampRectInsets(0, 0, 0, 0);
	end
	end
	end
	
	function DoChatOptions()
		if aegerUI.db.global.EnableChatMods == true then
			aegerUI:ChatFade()
			aegerUI:HideChatButtons()
			aegerUI:ChatClassColors()
		end
	end