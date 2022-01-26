if not Bartender4 then return end

local module = Bartender4:GetModule('MicroMenu')
hooksecurefunc(module, 'OnEnable', function(that)
    if not CA_IsMicrobuttonEnabled() then return end
    CA_InitializeMicrobutton()
    local microButtons, anchors = {}, {}
    for _, button in pairs(MICRO_BUTTONS) do
        microButtons[#microButtons + 1] = _G[button]
        anchors[#anchors + 1] = _G[button]:GetPoint()
    end
    C_Timer.After(0.01, function()
        local self = that
        self.bar:Disable()
        self.bar.buttons = microButtons

        -- check if its owned by the UI on initial load
        if self.bar.buttons[1]:GetParent() ~= MainMenuBarArtFrame then
            self.ownedByUI = true
        end

        self.button_count = #microButtons

        self.bar.anchors = {}
        self.bar:SetFrameLevel(5)
        for i,v in pairs(microButtons) do
            self.bar.anchors[i] = { anchors[i] }	-- Save orig button anchors.
            v:SetFrameLevel(self.bar:GetFrameLevel() + 1)
            v.ClearSetPoint = self.bar.ClearSetPoint
        end

        self.bar:Enable()
        self:ToggleOptions()
        self:ApplyConfig()
        self:MicroMenuBarShow()
    end)
end)
