local addon = 'Classic Achievements'
local loc = SexyLib:Localization(addon)

local options = {
    type = 'group',
    args = {
        enableSharing = {
            name = loc:Get('OPTION_SHARING'),
            desc = loc:Get('OPTION_SHARING_DESC'),
            type = 'toggle',
            set = function(info, val) CA_Settings.sharing = val end,
            get = function(info) return CA_Settings.sharing end
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