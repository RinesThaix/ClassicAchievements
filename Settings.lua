local addon = 'Classic Achievements'
local loc = SexyLib:Localization(addon)
CA_Flags = CA_Flags or 0

SexyLib:InitLogger(addon, '&6')

local options = {
    type = 'group',
    args = {
        enableSharing = {
            name = loc:Get('OPTION_SHARING'),
            desc = loc:Get('OPTION_SHARING_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val) CA_Settings.sharing = val end,
            get = function(info) return CA_Settings.sharing end,
            order = 1
        },
        enableMicrobutton = {
            name = loc:Get('OPTION_MICROBUTTON'),
            desc = loc:Get('OPTION_MICROBUTTON_DESC'),
            type = 'toggle',
            width = 2,
            set = function(info, val) CA_Settings.microbutton = val end,
            get = function(info) return CA_IsMicrobuttonEnabled() end,
            order = 2
        },
        updateMapExploration = {
            name = loc:Get('OPTION_UPDATE_MAP_EXPLORATION'),
            desc = loc:Get('OPTION_UPDATE_MAP_EXPLORATION_DESC'),
            type = 'execute',
            width = 2,
            func = function() CA_UpdateExploredAreas() end,
            order = 3
        },
        resetAchievements = {
            name = loc:Get('OPTION_RESET_ACHIEVEMENTS'),
            desc = loc:Get('OPTION_RESET_ACHIEVEMENTS_DESC'),
            type = 'execute',
            width = 2,
            func = function()
                CA_CompletionManager:GetLocal():Reset()
                CA_performInitialCheck()
            end,
            order = 4
        }
    }
}

LibStub("AceConfig-3.0"):RegisterOptionsTable(addon, options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon)

SexyLib:Util():AfterLogin(function()
    if not CA_Settings then
        CA_Settings = {
            sharing = true,
            microbutton = true
        }
    end
end)

C_Timer.After(2, function()
    -- CA_Flags: 0x01: Whether first login with this addon installed happened
    --           0x02: Whether first login into TBCC with this addon installed happened
    CA_Flags = bit.bor(CA_Flags, 1)
    if (bit.band(CA_Flags, 2) == 0) then
        CA_Flags = bit.bor(CA_Flags, 2)
        CA_CompletionManager:GetLocal():TakeIncompleteAchievements()
    end
end)

function CA_IsSharingAchievementsInChat()
    return CA_Settings.sharing and bit.band(CA_Flags, 1) == 1
end

function CA_IsMicrobuttonEnabled()
    if CA_Settings.microbutton == nil then CA_Settings.microbutton = true end
    return CA_Settings.microbutton
end