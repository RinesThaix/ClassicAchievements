SexyLib:Util():AfterLogin(function()
    if CA_IsMicrobuttonEnabled() then return end

    local tooltip = CreateFrame("GameTooltip", "ClassicAchievementsMinimapTooltip", UIParent, "GameTooltipTemplate")
    tooltip:ClearLines()
    tooltip:AddFontStrings(tooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"), tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText"))
    
    local button = CreateFrame("Button", "ClassicAchievementsMinimapButton", Minimap)
    LoadMicroButtonTextures(button, "Achievement")
	button.tooltipText = MicroButtonTooltipText(ACHIEVEMENT_BUTTON, "CLASSIC_ACHIEVEMENT")
	button.newbieText = SexyLib:Localization('Classic Achievements'):Get('ICON_DESCRIPTION')

    button:SetParent(Minimap)
    button:EnableMouse(true)
    button:SetMovable(true)
    button:SetSize(25, 50)
    button:SetPoint('CENTER')
    button:RegisterForDrag('LeftButton')
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:RegisterForDrag("LeftButton")
    
    local function positionUpdater()
        if not CA_Settings.minimapPos then return end
        button:SetPoint('CENTER', 'Minimap', 'CENTER', -85 * cos(CA_Settings.minimapPos), 85 * sin(CA_Settings.minimapPos) + 8)
    end
    
    SexyLib:Util():AfterLogin(positionUpdater)
    
    local frame = CreateFrame("FRAME", nil, button)
    frame:SetScript('OnUpdate', function()
        local xpos, ypos = GetCursorPosition()
        local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()
    
        xpos = xmin - xpos / UIParent:GetScale() + 70
        ypos = ypos / UIParent:GetScale() - ymin - 70
    
        CA_Settings.minimapPos = math.deg(math.atan2(ypos, xpos))
        positionUpdater()
    end)
    frame:Hide()
    button:SetScript('OnDragStart', function(self)
        self:LockHighlight()
        frame:Show()
        tooltip:Hide()
    end)
    button:SetScript('OnDragStop', function(self)
        self:UnlockHighlight()
        frame:Hide()
    end)
    button:SetScript('OnLeave', function(self)
        self:UnlockHighlight()
        tooltip:Hide()
    end)
    button:SetScript('OnEnter', function()
        tooltip:ClearLines()
        tooltip:SetOwner(button, "ANCHOR_LEFT")
        tooltip:SetText(MicroButtonTooltipText(ACHIEVEMENT_BUTTON, "CLASSIC_ACHIEVEMENT"))
        tooltip:AddLine(SexyLib:Localization('Classic Achievements'):Get('ICON_DESCRIPTION'))
        tooltip:Show()
    end)
    button:SetScript('OnClick', function(self, button)
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
    hooksecurefunc("UpdateMicroButtons", function()
        if AchievementFrame and AchievementFrame:IsShown() then
            button:SetButtonState('PUSHED', true)
        else
            button:SetButtonState('NORMAL')
        end
    end)
end)
