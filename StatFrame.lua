local width = 60;
local height = 25;

local haste = (floor(UnitSpellHaste("player") + 0.05));
local crit = (floor(GetCritChance() + 0.05));

local function eventHandler(self, event, ...)
  local haste = (floor(UnitSpellHaste("player") + 0.05));
  local crit = (floor(GetCritChance() + 0.05));
  local f = StatFrame;
  
  f.HasteData:SetText(haste);
  f.CritData:SetText(crit);
end

local f = CreateFrame("Frame", "StatFrame", UIParent);
f:SetWidth(width);
f:SetHeight(height);
f:SetAlpha(1.0);
f:SetClampedToScreen(true);
f:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
f:SetMovable(true);
f:EnableMouse(true);
f:RegisterForDrag("LeftButton");
f:SetScript("OnDragStart", f.StartMoving);
f:SetScript("OnDragStop", f.StopMovingOrSizing);
f:SetUserPlaced(true);
f:SetScript("OnEvent", eventHandler);
f:RegisterEvent("UNIT_AURA");

local t = f:CreateTexture("StatFrame_Texture", "BACKGROUND");
t:SetAllPoints(f);
t:SetWidth(width);
t:SetHeight(height);
t:SetColorTexture(0.0, 0.0, 0.0, 1);

f.HasteLabel = f:CreateFontString(nil, "ARTWORK", "GameFontNormal");
f.HasteLabel:SetPoint("TopLeft");
f.HasteLabel:SetText("Haste:")

f.HasteData = f:CreateFontString(nil, "ARTWORK", "GameFontNormal");
f.HasteData:SetPoint("TopRight");
f.HasteData:SetText(haste)

f.CritLabel = f:CreateFontString(nil, "ARTWORK", "GameFontNormal");
f.CritLabel:SetPoint("BottomLeft");
f.CritLabel:SetText("Crit:")

f.CritData = f:CreateFontString(nil, "ARTWORK", "GameFontNormal");
f.CritData:SetPoint("BottomRight");
f.CritData:SetText(crit)