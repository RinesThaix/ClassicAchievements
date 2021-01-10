local addon = 'Classic Achievements'

SexyLib:InitMinimap(addon)

local minimap, loc = SexyLib:Minimap(addon), SexyLib:Localization(addon)

local description = {}
for i = 1, 100 do
    local key = 'MINIMAP_DESCRIPTION_' .. i
    if not loc:IsPresent(key) then break end
    description[i] = loc:Get(key)
end
minimap:SetDescription(description)

minimap:SetClickHandler(true, false, false, function()
    AchievementFrame_ToggleAchievementFrame()
end)