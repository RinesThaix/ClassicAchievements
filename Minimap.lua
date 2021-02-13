local addon = 'Classic Achievements'

SexyLib:InitMinimap(addon, nil, "hud-microbutton-Achievement-Up", false)

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

minimap:SetClickHandler(false, false, false, function()
    InterfaceOptionsFrame_OpenToCategory(addon)
    InterfaceOptionsFrame_OpenToCategory(addon) -- not a bug, two calls required
end)