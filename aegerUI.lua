local aegerUI = ...
local MEDIAPATH = "Interface\\AddOns\\" .. aegerUI .. "\\Media\\"
local classcolor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[(select(2, UnitClass("player")))]

local BottomBarFrame1 = CreateFrame("Frame", "BottomBarFrame1", UIParent)
BottomBarFrame1:Hide()

local BottomBarFrame2 = CreateFrame("Frame", "BottomBarFrame2", UIParent)
BottomBarFrame2:Hide()

local DisplayBars = CreateFrame("Frame")
DisplayBars:RegisterEvent("ADDON_LOADED")
DisplayBars:RegisterEvent("ONUPDATE")
DisplayBars:RegisterEvent("ONLOAD")
DisplayBars:RegisterEvent("UNIT_ENTERING_VEHICLE")
DisplayBars:RegisterEvent("UNIT_ENTERED_VEHICLE")
DisplayBars:RegisterEvent("UNIT_EXITING_VEHICLE")
DisplayBars:RegisterEvent("UNIT_EXITED_VEHICLE")

local function BbarDisplay()
if ( not MainMenuBar.busy and not UnitHasVehicleUI("player") ) then
  if Bbars == 1 then
    BottomBarFrame1:Show()
    BottomBarFrame2:Hide()
 end
  
if Bbars == 2 then
  BottomBarFrame2:Show()
  BottomBarFrame1:Hide()
end

elseif
  UnitHasVehicleUI("player") then
    BottomBarFrame1:Hide()
    BottomBarFrame2:Hide()
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
	
  local Bar1BorderDisplay = self:CreateTexture(nil, "BORDER")
    Bar1BorderDisplay:SetWidth(947)
	Bar1BorderDisplay:SetHeight(47)
	Bar1BorderDisplay:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -3)
	Bar1BorderDisplay:SetPoint("CENTER", UIParent, "CENTER")
	Bar1BorderDisplay:SetTexture(MEDIAPATH .. "btroundedborder")
	Bar1BorderDisplay:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
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
	
	local Bar2BorderDisplay = self:CreateTexture(nil, "BORDER")
    Bar2BorderDisplay:SetWidth(947)
	Bar2BorderDisplay:SetHeight(90)
	Bar2BorderDisplay:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, -4)
	Bar2BorderDisplay:SetPoint("CENTER", UIParent, "CENTER")
	Bar2BorderDisplay:SetTexture(MEDIAPATH .. "btroundedborder")
	Bar2BorderDisplay:SetVertexColor(classcolor.r, classcolor.g, classcolor.b, 1.0)
end)