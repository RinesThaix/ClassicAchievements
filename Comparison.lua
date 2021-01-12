UnitPopupButtons['CLASSIC_ACHIEVEMENTS_TITLE'] = {
    isSubsection = true,
    isUninteractable = true,
    isTitle = true,
    text = 'Classic Achievements',
    isSubsectionSeparator = true,
    isSubsectionTitle = true
}
UnitPopupButtons['CLASSIC_ACHIEVEMENTS_COMPARISON'] = {
    text = SexyLib:Localization('Classic Achievements'):Get('COMPARE_ACHIEVEMENTS')
}

local function addToMenu(menuName)
    local menu = UnitPopupMenus[menuName]
    menu[#menu + 1] = 'CLASSIC_ACHIEVEMENTS_TITLE'
    menu[#menu + 1] = 'CLASSIC_ACHIEVEMENTS_COMPARISON'
end

SexyLib:Util():AfterLogin(function()
    for _, menuName in pairs({'PLAYER', 'SELF'}) do addToMenu(menuName) end
end)

local function handler(level, value, dropDownFrame, anchorName, xOffset, yOffset, menuList, button, autoHideDelay)
    if dropDownFrame and level then
        local buttonPrefix = "DropDownList" .. level .. "Button"
        local i = 2
        while true do
            local button = _G[buttonPrefix .. i]
            if not button then break end
            if button:GetText() == UnitPopupButtons["CLASSIC_ACHIEVEMENTS_COMPARISON"].text then
                button.func = function()
                    AchievementFrame_DisplayComparison('target')
                    AchievementFrameCategories_SelectButton(AchievementFrameCategoriesContainerButton1)
                end
                break
            end
            i = i + 1
        end
    end
end

hooksecurefunc("ToggleDropDownMenu", handler)