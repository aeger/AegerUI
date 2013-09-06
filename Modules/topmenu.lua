local aegerUI = ...

local MEDIAPATH = "Interface\\AddOns\\aegerUI\\Media\\"
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]


local topmenu = CreateFrame("Frame", "topmenu", UIParent)
topmenu:RegisterEvent("ADDON_LOADED")
topmenu:RegisterEvent("ONUPDATE")
topmenu:RegisterEvent("ONLOAD")
topmenu:Hide()

local topmenuborder = CreateFrame("Frame", "topmenuborder", UIParent)
topmenuborder:RegisterEvent("PLAYER_REGEN_ENABLED")
topmenuborder:RegisterEvent("PLAYER_REGEN_DISABLED")
topmenuborder:Hide()

function topmenudisplay()

if TopmenuShow == 1 then
topmenu:Show()
topmenuborder:Show()
_G["BazookaBar_1"]:Show()
else
if TopmenuShow == nil then
topmenu:Hide()
topmenuborder:Hide()
_G["BazookaBar_1"]:Hide()
end
end
end 

topmenu:SetScript("OnEvent", function(self, event, ...)
local timeleft = 1 --set the countdown to w/e you want
local f = CreateFrame("Frame", nil, UIParent)
f:SetScript("OnUpdate", function(_,arg)
  timeleft = timeleft - arg
  if timeleft >= 0 then
    timeleft = nil
    f:SetScript("OnUpdate", nil)
    topmenudisplay()
  end
end)
end)

local function flip(texture,horizontal)
	local ULx,ULy,LLx,LLy,URx,URy,LRx,LRy = texture:GetTexCoord()
	if horizontal then
		texture:SetTexCoord(URx, URy, LRx, LRy, ULx, ULy, LLx, LLy)
	else
		texture:SetTexCoord(LLx, LLy,ULx, ULy, LRx, LRy, URx, URy)
	end
end

topmenu:SetScript("OnShow", function(self)
  self:SetScript("OnShow", nil)
  PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
  PetBattleFrame:HookScript("OnHide",function() self:Show() end)
  
  local tmdisplay = self:CreateTexture(nil, "BACKGROUND")
    tmdisplay:SetSize(500, 36)
	tmdisplay:SetPoint("TOP", UIParent, "TOP",0 ,10)
    tmdisplay:SetPoint("CENTER", UIParent, "CENTER")
	tmdisplay:SetTexture(MEDIAPATH .. "topmenu")
	tmdisplay:SetVertexColor(0, 0, 0, .5)
	flip(tmdisplay,false)
	
end)

topmenuborder:SetScript("OnShow", function(self)
  
  PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
  PetBattleFrame:HookScript("OnHide",function() self:Show() end)
  
  local tmborderdisplay = self:CreateTexture(nil, "BORDER")
    tmborderdisplay:SetSize(502, 46)
	tmborderdisplay:SetPoint("TOP", UIParent, "TOP", 0, 17)
    tmborderdisplay:SetPoint("CENTER", UIParent, "CENTER")
	tmborderdisplay:SetTexture(MEDIAPATH .. "topmenuborder")
	tmborderdisplay:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
	flip(tmborderdisplay,false)
	topmenuborder:HookScript("OnEvent", function(self, event)
	if event == "PLAYER_REGEN_DISABLED" then
    tmborderdisplay:SetVertexColor(1, 0, 0)
    elseif event == "PLAYER_REGEN_ENABLED" then
    tmborderdisplay:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
end
end)
end)

SlashCmdList.TOPMENUSHOW = function()
	TopmenuShow = 1
	ReloadUI()
end
SLASH_TOPMENUSHOW1 = "/tmshow"

SlashCmdList.TOPMENUHIDE = function()
	TopmenuShow = nil
	ReloadUI()
end
SLASH_TOPMENUHIDE1 = "/tmhide"
