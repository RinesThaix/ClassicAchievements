SexyLibNetworkAddon = LibStub("AceAddon-3.0"):NewAddon("Sexy Lib Network", "AceComm-3.0")

local networks = {}

local function encode(data)
    local libS = LibStub:GetLibrary("AceSerializer-3.0")
    local libC = LibStub:GetLibrary("LibCompress")
    local libCE = libC:GetAddonEncodeTable()
    local encoded = libS:Serialize(data)
    encoded = libC:CompressHuffman(encoded)
    return libCE:Encode(encoded)
end

local function decode(data)
    local libS = LibStub:GetLibrary("AceSerializer-3.0")
    local libC = LibStub:GetLibrary("LibCompress")
    local libCE = libC:GetAddonEncodeTable()
    data = libCE:Decode(data)
    local decrypted, err = libC:Decompress(data)
    if not decrypted then
        SexyLib:Logger('Sexy Lib'):LogErrorL('network_error_packet_decompression', err)
        return nil
    end
    local success, result = libS:Deserialize(decrypted)
    if not success then
        SexyLib:Logger('Sexy Lib'):LogErrorL('network_error_packet_deserialization')
        return nil
    end
    return result
end

-- blacklistCheckingFunc args: playerName
function SexyLib:InitNetwork(addonName, prefixLength, defaultCallbacksTimeout, blacklistCheckingFunc)
    local channel = addonName
    SexyLibNetworkAddon:RegisterComm(channel)

    networks[addonName] = {
        channel = channel,
        zeroChannel = string.rep('0', prefixLength),
        prefixLength = prefixLength,
        defaultTimeout = defaultCallbacksTimeout,
        blacklistChecker = blacklistCheckingFunc,
        callbacks = {},
        initCallbacksTimer = function(self)
            local time = 0
            local callbacks = self.callbacks
            SexyDKP:Util():NewTimer(function(sinceLastUpdate)
                if sinceLastUpdate - time < 0.05 then return false end
                time = sinceLastUpdate
                local toBeRemoved = {}
                for key, callbackData in pairs(callbacks) do
                    if callbackData[2] == 0 then
                        callbackData[2] = time
                    elseif time - callbackData[2] >= callbackData[3] then
                        toBeRemoved[key] = {true, callbackData[4]}
                    end
                end
                for callbackID, _ in pairs(toBeRemoved) do
                    callbacks[callbackID] = nil
                end
                for _, data in pairs(toBeRemoved) do
                    if data[2] then data[2]() end
                end
                return false
            end)
        end,
        sendRaw = function(self, techChannel, ingameChannel, target, data, messageType)
            if ingameChannel == 'GUILD' and not SexyLib:Util():IsInGuild() then return end
            messageType = messageType or 'BULK'
            local encoded = encode(data)
            SexyLibNetworkAddon:SendCommMessage(self.channel, techChannel .. '-' .. encoded, ingameChannel, target, messageType)
        end,
        Send = function(self, techChannel, ingameChannel, target, data, messageType)
            self:sendRaw(techChannel, ingameChannel, target, {0, data}, messageType)
        end,
        SendWithCallback = function(self, techChannel, target, data, callback, timeout, timeoutHandler)
            local callbackID = math.random(1, 1000000)
            while self.callbacks[callbackID] do
                callbackID = math.random(1, 1000000)
            end
            self.callbacks[callbackID] = {callback, 0, timeout or self.defaultTimeout, timeoutHandler}
            if not self.callbacksTimer then
                self:initCallbacksTimer()
                self.callbacksTimer = true
            end
            self:sendRaw(techChannel, 'WHISPER', target, {callbackID, data}, 'NORMAL')
        end,
        ResponseCallback = function(self, target, data, callbackID)
            self:sendRaw(self.zeroChannel, 'WHISPER', target, {callbackID, data})
        end,
        Channels = {},
        -- arguments of func are: sender, parsed (data), callbackID, distribution (ingameChannel)
        NewChannel = function(self, channelPrefix, ingameChannel, func)
            if not channelPrefix or channelPrefix:len() ~= self.prefixLength then
                SexyLib:Logger('Sexy Lib'):LogErrorL('network_error_channel_prefix_length', channelPrefix, addonName)
                return
            end
            self.Channels[channelPrefix] = {func, ingameChannel}
        end
    }
end

function SexyLib:Network(addonName)
    return networks[addonName]
end

function SexyLibNetworkAddon:OnCommReceived(channel, message, distribution, sender)
    local network = networks[channel]
    if not network then return end
    if network.blacklistChecker and network.blacklistChecker(sender) then return end
    local prefix = string.sub(message, 1, network.prefixLength)
    local suffix = string.sub(message, network.prefixLength + 2)
    local parsed = decode(suffix)
    if parsed == nil then return end
    local callbackID, parsed = parsed[1], parsed[2]
    if prefix == network.zeroChannel then
        if callbackID == 0 or not network.callbacks[callbackID] or distribution ~= 'WHISPER' then return end
        network.callbacks[callbackID][1](sender, parsed)
        network.callbacks[callbackID] = nil
    else
        local channelData = network.Channels[prefix]
        if not channelData or channelData[2] ~= nil and distribution ~= channelData[2] then return end
        if channelData[1] then channelData[1](sender, parsed, callbackID, distribution) end
    end
end