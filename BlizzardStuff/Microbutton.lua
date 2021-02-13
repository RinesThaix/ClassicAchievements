BINDING_NAME_CLASSIC_ACHIEVEMENT = 'Classic Achievements'

local width = 24

local microButtons = {}
for _, value in pairs(MICRO_BUTTONS) do
    microButtons[#microButtons + 1] = value
    if value == 'QuestLogMicroButton' then
        microButtons[#microButtons + 1] = 'AchievementMicroButton'
    end
end

MICRO_BUTTONS = microButtons

MainMenuBar:SetWidth(MainMenuBar:GetWidth() + width * 2)

do
    local point, relativeTo, relativePoint, xOfs, yOfs = SocialsMicroButton:GetPoint()
    SocialsMicroButton:SetPoint(point, AchievementMicroButton, relativePoint, xOfs, yOfs)
end

local function move(thing, delta)
    local point, relativeTo, relativePoint, xOfs, yOfs = thing:GetPoint()
    thing:SetPoint(point, relativeTo, relativePoint, xOfs + delta, yOfs)
end

move(MainMenuBarLeftEndCap, -width)
move(MainMenuBarTexture0, -width)
move(MainMenuBarTexture1, -width)
move(MainMenuBarPageNumber, -width + 1.5)
move(MainMenuBarTexture2, -width/2)
MainMenuBarTexture2:SetWidth(MainMenuBarTexture2:GetWidth() + width)
AchievementMicroButton:SetFrameStrata('HIGH')
C_Timer.After(0.01, function()
    move(MainMenuBarPerformanceBarFrame, -width)
end)
move(MainMenuBarBackpackButton, -width)

move(MultiBarBottomRight, width)

hooksecurefunc("UpdateMicroButtons", function()
    if AchievementFrame and AchievementFrame:IsShown() then
        AchievementMicroButton:SetButtonState('PUSHED', true)
    else
        AchievementMicroButton:SetButtonState('NORMAL')
    end
end)

AchievementMicroButton:SetScript('OnClick', function(self, button)
    if button == 'RightButton' then
        if InterfaceOptionsFrame:IsShown() then
            InterfaceOptionsFrame:Hide()
        else
            InterfaceOptionsFrame_OpenToCategory('Classic Achievements')
            InterfaceOptionsFrame_OpenToCategory('Classic Achievements') -- not a bug, two calls required
        end
    else
        AchievementFrame_ToggleAchievementFrame()
    end
end)