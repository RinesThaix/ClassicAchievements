SexyLib_Minimaps = SexyLib_Minimaps or {}

local minimaps = {}

function SexyLib:InitMinimap(addonName, iconPath)
    local minimapTooltip = CreateFrame("GameTooltip", addonName .. "MinimapTooltip", UIParent, "GameTooltipTemplate")
    minimapTooltip:ClearLines()
    minimapTooltip:AddFontStrings(minimapTooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"), minimapTooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText"))

    local minimap = CreateFrame("Button", addonName .. "MinimapButton", Minimap)
    minimap:EnableMouse(true)
    minimap:SetMovable(true)
    minimap:SetSize(33, 33)
    minimap:SetPoint("TOPLEFT")
    minimap:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    minimap:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    minimap:RegisterForDrag("LeftButton")

    local t = minimap:CreateTexture(nil, "OVERLAY")
    t:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    t:SetSize(56, 56)
    t:SetPoint("TOPLEFT")

    t = minimap:CreateTexture(nil, "background")
    t:SetTexture(iconPath or "Interface\\Icons\\inv_misc_head_dragon_red")
    t:SetSize(21, 21)
    t:SetPoint("CENTER")

    SexyLib_Minimaps[addonName] = SexyLib_Minimaps[addonName] or {}
    local data = SexyLib_Minimaps[addonName]

    local positionUpdater = function()
        if not data.pos then return end
        minimap:SetPoint('TOPLEFT', 'Minimap', 'TOPLEFT', 52 - 80 * cos(data.pos), 80 * sin(data.pos) - 52)
    end

    local minimapFrame = CreateFrame("FRAME", nil, minimap)
    minimapFrame:SetScript('OnUpdate', function()
        local xpos, ypos = GetCursorPosition()
        local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()

        xpos = xmin - xpos / UIParent:GetScale() + 70
        ypos = ypos / UIParent:GetScale() - ymin - 70

        data.pos = math.deg(math.atan2(ypos, xpos))
        positionUpdater()
    end)
    minimapFrame:Hide()

    minimap:SetScript("OnDragStart", function(self)
        self:LockHighlight()
        minimapFrame:Show()
        minimapTooltip:Hide()
    end)
    
    minimap:SetScript("OnDragStop", function(self)
        self:UnlockHighlight()
        minimapFrame:Hide()
    end)

    minimap:SetScript("OnLeave", function()
        minimapTooltip:Hide()
    end)

    local handler = {
        clicks = {},
        getTitle = function() return addonName end,
        SetTitle = function(self, title)
            if type(title) == 'function' then
                self.getTitle = title
            else
                self.getTitle = function() return title end
            end
        end,
        getDescription = function() return {} end,
        SetDescription = function(self, description)
            if type(description) == 'function' then
                self.getDescription = description
            elseif type(description) == 'table' then
                self.getDescription = function() return description end
            else
                self.getDescription = function() return {description} end
            end
        end,
        getClickHandler = function(self, left, shift, ctrl)
            local array = self.clicks
            if not array[left] then return nil end
            array = array[left]

            if not array[shift] then return nil end
            array = array[shift]

            return array[ctrl]
        end,
        SetClickHandler = function(self, left, shift, ctrl, handler)
            local array = self.clicks
            if not array[left] then array[left] = {} end
            array = array[left]

            if not array[shift] then array[shift] = {} end
            array = array[shift]
            
            array[ctrl] = handler
        end
    }

    minimap:SetScript('OnEnter', function()
        minimapTooltip:ClearLines()
        minimapTooltip:SetOwner(minimap, "ANCHOR_LEFT")
        minimapTooltip:SetText(handler.getTitle())
        for _, line in pairs(handler.getDescription()) do
            minimapTooltip:AddLine(line)
        end
        minimapTooltip:Show()
    end)

    minimap:SetScript('OnClick', function(self, button)
        local left
        if button == 'LeftButton' then
            left = true
        elseif button == 'RightButton' then
            left = false
        else
            return
        end
        local shift = false
        local ctrl = false
        local clickHandler = handler:getClickHandler(left, shift, ctrl)
        if clickHandler ~= nil then clickHandler() end
    end)

    minimaps[addonName] = handler
end

function SexyLib:Minimap(addonName)
    return minimaps[addonName]
end