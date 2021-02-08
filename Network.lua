local CHANNEL_COMPLETION = 'C'

SexyLib:InitNetwork('ClAch', 1)
local network = SexyLib:Network('ClAch')

network:NewChannel(CHANNEL_COMPLETION, 'WHISPER', function(sender, _, callbackID)
    local completion = CA_CompletionManager:GetLocal():getData()
    network:ResponseCallback(sender, completion, callbackID)
end)

function GetAndProcessRemoteAchievementsCompletion(playerName, successCallback, timeoutCallback)
    network:SendWithCallback(CHANNEL_COMPLETION, playerName, false, successCallback, 10, timeoutCallback)
end