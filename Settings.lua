local addon = 'Classic Achievements'
local loc = SexyLib:Localization(addon)

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
            get = function(info) return CA_Settings.sharing end
        },
        updateMapExploration = {
            name = loc:Get('OPTION_UPDATE_MAP_EXPLORATION'),
            desc = loc:Get('OPTION_UPDATE_MAP_EXPLORATION'),
            type = 'execute',
            width = 2,
            func = function() ClassicAchievements_UpdateExploredAreas() end
        },
        resetAchievements = {
            name = loc:Get('OPTION_RESET_ACHIEVEMENTS'),
            desc = loc:Get('OPTION_RESET_ACHIEVEMENTS_DESC'),
            type = 'execute',
            width = 2,
            func = function()
                CA_CompletionManager:GetLocal():Reset()
                ClassicAchievements_performInitialCheck()
            end
        }
    }
}

LibStub("AceConfig-3.0"):RegisterOptionsTable(addon, options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon)

SexyLib:Util():AfterLogin(function()
    if not CA_Settings then
        CA_Settings = {
            sharing = true
        }
    end
end)

function IsSharingAchievementsInChat()
    return CA_Settings.sharing
end