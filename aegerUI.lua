local aegerUI = ...
local MEDIAPATH = "Interface\\AddOns\\" .. aegerUI .. "\\Media\\"
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]

--Frames ------------------------------------------------------------------
local BottomBarFrame1 = CreateFrame("Frame", "BottomBarFrame1", UIParent)
BottomBarFrame1:Hide()

local Bar1BorderFrame = CreateFrame("Frame", "BottomBarFrame1", UIParent)
Bar1BorderFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
Bar1BorderFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
Bar1BorderFrame:Hide()

local BottomBarFrame2 = CreateFrame("Frame", "BottomBarFrame2", UIParent)
BottomBarFrame2:Hide()

local Bar2BorderFrame = CreateFrame("Frame", "Bar2BorderFrame", UIParent)
Bar2BorderFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
Bar2BorderFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
Bar2BorderFrame:Hide()

local DisplayBars = CreateFrame("Frame")
DisplayBars:RegisterEvent("ADDON_LOADED")
DisplayBars:RegisterEvent("ONUPDATE")
DisplayBars:RegisterEvent("ONLOAD")
DisplayBars:RegisterEvent("UNIT_ENTERING_VEHICLE")
DisplayBars:RegisterEvent("UNIT_ENTERED_VEHICLE")
DisplayBars:RegisterEvent("UNIT_EXITING_VEHICLE")
DisplayBars:RegisterEvent("UNIT_EXITED_VEHICLE")

--Functions -------------------------------------------------------------------
local function BbarDisplay()
if ( not MainMenuBar.busy and not UnitHasVehicleUI("player") ) then
  if Bbars == 1 then
    BottomBarFrame1:Show()
	Bar1BorderFrame:Show()
    BottomBarFrame2:Hide()
	Bar2BorderFrame:Hide()
 end
  
if Bbars == 2 then
  BottomBarFrame1:Hide()
  Bar1BorderFrame:Hide()
  BottomBarFrame2:Show()
  Bar2BorderFrame:Show()
end

elseif
  UnitHasVehicleUI("player") then
    BottomBarFrame1:Hide()
	Bar1BorderFrame:Hide()
    BottomBarFrame2:Hide()
	Bar2BorderFrame:Hide()
end
end

DisplayBars:SetScript("OnEvent", function(self, event, ...)
BbarDisplay()
end)

BottomBarFrame1:SetScript("OnShow", function(self)
  self:SetScript("OnShow", nil)
  PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
  PetBattleFrame:HookScript("OnHide",function() self:Show() end)
    
  local Bar1display = self:CreateTexture(nil, "BACKGROUND")
    Bar1display:SetWidth(943)
    Bar1display:SetHeight(43)
    Bar1display:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	Bar1display:SetPoint("CENTER", UIParent, "CENTER")
    Bar1display:SetTexture(MEDIAPATH .. "btrounded")
	Bar1display:SetVertexColor(0, 0, 0, .5)
end)

Bar1BorderFrame:SetScript("OnShow", function(self)

PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
PetBattleFrame:HookScript("OnHide",function() self:Show() end)

local Bar1tex = self:CreateTexture(nil, "BORDER")
Bar1tex:SetSize(947, 47)
Bar1tex:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -4)
Bar1tex:SetPoint("CENTER", UIParent, "CENTER")
Bar1tex:SetTexture(MEDIAPATH .. "btroundedborder")
Bar1tex:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
Bar1BorderFrame:HookScript("OnEvent", function(self, event)
if event == "PLAYER_REGEN_DISABLED" then
Bar1tex:SetVertexColor(1, 0, 0)
elseif event == "PLAYER_REGEN_ENABLED" then
Bar1tex:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)

end
end)
end)

BottomBarFrame2:SetScript("OnShow", function(self)
  self:SetScript("OnShow", nil)
  PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
  PetBattleFrame:HookScript("OnHide",function() self:Show() end)
  
    local Bar2display = self:CreateTexture(nil, "BACKGROUND")
    Bar2display:SetWidth(943)
    Bar2display:SetHeight(84)
    Bar2display:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -4)
	Bar2display:SetPoint("CENTER", UIParent, "CENTER")
    Bar2display:SetTexture(MEDIAPATH .. "btrounded")
	Bar2display:SetVertexColor(0, 0, 0, .5)
end)

Bar2BorderFrame:SetScript("OnShow", function(self)

PetBattleFrame:HookScript("OnShow",function() self:Hide() end)
PetBattleFrame:HookScript("OnHide",function() self:Show() end)

local Bar2tex = self:CreateTexture(nil, "BORDER")

Bar2tex:SetSize(947, 90)
Bar2tex:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -4)
Bar2tex:SetPoint("CENTER", UIParent, "CENTER")
Bar2tex:SetTexture(MEDIAPATH .. "btroundedborder")
Bar2tex:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
Bar2BorderFrame:HookScript("OnEvent", function(self, event)
if event == "PLAYER_REGEN_DISABLED" then
Bar2tex:SetVertexColor(1, 0, 0)
elseif event == "PLAYER_REGEN_ENABLED" then
Bar2tex:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
end
end)
end)

