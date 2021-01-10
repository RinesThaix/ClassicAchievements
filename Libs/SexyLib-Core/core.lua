SexyLib = {}

-- Util

local colors = {}
colors['&a'] = '|cff00ff00'
colors['&6'] = '|cfffac414'
colors['&e'] = '|cfffff000'
colors['&c'] = '|cffff0000'
colors['&7'] = '|cffaaaaaa'
colors['&3'] = '|cff30d5c8'
colors['&r'] = '|r'

local function strReplace(str, this, that)
	local result, amount = string.gsub(str, this, that)
	return result
end

local util = {
    Version = '1.0.0',
    Colorize = function(self, str)
        for tag, color in pairs(colors) do str = strReplace(str, tag, color) end
        return str
    end,
    Format = function(self, message, ...)
        if ... ~= nil then message = string.format(message, ...) end
        return self:Colorize(message)
    end,
    Print = function(self, message, ...)
        print(self:Format(message, ...))
    end,
    Millis = function(self, from)
        local time = debugprofilestop()
        if not from then return time end
        return math.floor(time - from)
    end,
    Explode = function(self, strings, delimiter)
        if delimiter == nil then delimiter = "%s" end
        local result = {}
        for str in string.gmatch(strings, "([^" .. delimiter .. "]+)") do
            result[#result + 1] = str
        end
        return result
    end,
    Implode = function(self, strings, delimiter, fromIndex, toIndex)
        fromIndex = fromIndex or 1
        toIndex = (toIndex or #strings) + 1
        local result = ''
        for i, str in pairs(strings) do
            if i == fromIndex then
                result = str
            elseif i == toIndex then
                break
            elseif i > fromIndex then
                result = result .. delimiter .. str
            end
        end
        return result
    end,
    FilterPlayerName = function(self, playerName)
        if not playerName then
            playerName = playerName or UnitName('player')
            return self:Explode(playerName, '-')
        end
        playerName = self:Explode(playerName, '-')
        return playerName:sub(1, 1):upper() .. playerName:sub(2):lower()
    end,
    IsInGuild = function(self)
        if self.isInGuild ~= nil then return self.isInGuild end
        local guildName = GetGuildInfo('player')
        if guildName then
            self.isInGuild = true
        else
            self.isInGuild = false
        end
        return self.isInGuild
    end,
    FromRadix = function(self, num, radix)
        return tonumber(num, radix)
    end,
    ToRadix = function(self, num, radixTo, radixFrom)
        if radixFrom then num = self:FromRadix(radixFrom) end
        num = math.floor(num)
        if not radix or radix == 10 then return tostring(num) end
        local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        local t = {}
        local sign = ""
        if num < 0 then
            sign = "-"
            num = -num
        end
        repeat
            local d = (num % radix) + 1
            num = math.floor(num / radix)
            table.insert(t, 1, digits:sub(d, d))
        until num == 0
        return sign .. table.concat(t, "")
    end,
    CopyTable = function(self, tabl)
        if type(tabl) ~= 'table' then return tabl end
        local result = {}
        for key, value in pairs(tabl) do
            if type(key) == 'table' then key = self:CopyTable(key) end
            if type(value) == 'table' then value = self:CopyTable(value) end
            result[key] = value
        end
        return result
    end,
    NewTimer = function(self, callback)
        if not self.timers then self.timers = 0 end
        local frame = CreateFrame('Frame', 'SexyLibTimer' .. self.timers, UIParent)
        self.timers = self.timers + 1
        frame:SetScript('OnUpdate', function(self, sinceLastUpdate)
            self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate
            if callback(self.sinceLastUpdate) then
                self.sinceLastUpdate = 0
            end
        end)
    end
}

function SexyLib:Util()
    return util
end

-- Logger

local loggers = {}

local function initLogger(addonName, colorCode)
    local util = SexyLib:Util()
    local coloredAddonName = '&7[' .. (colorCode or '&3') .. addonName .. '&7]'
    local logger = {
        Settings = {
            Debug = false,
            Error = true,
            Info = true
        },
        log = function(self, message, ...)
            util:Print(coloredAddonName .. ' %s', util:Format(message, ...))
        end,
        LogDebug = function(self, message, ...)
            if not self.Settings.Debug then return end
            self:log(message, ...)
        end,
        LogError = function(self, message, ...)
            if not self.Settings.Error then return end
            self:log('&c%s', util:Format(message, ...))
        end,
        LogInfo = function(self, message, ...)
            if not self.Settings.Info then return end
            self:log('&e%s', util:Format(message, ...))
        end
    }
    if SexyLib.Localization then
        local localization = SexyLib:Localization('Sexy Lib')
        logger.supportsLocalization = true
        logger.LogErrorL = function(self, messageKey, ...)
            self:LogError(localization:Get(messageKey, ...))
        end
        logger.LogInfoL = function(self, messageKey, ...)
            self:LogInfo(localization:Get(messageKey, ...))
        end
    else
        logger.supportsLocalization = false
        local formatter = function(messageKey, ...)
            local message = messageKey
            if ... ~= nil then message = message .. ': ' .. self:Implode(..., ', ') end
            return message
        end
        logger.LogErrorL = function(self, messageKey, ...)
            self:LogError(formatter(messageKey, ...))
        end
        logger.LogInfoL = function(self, messageKey, ...)
            self:LogInfo(formatter(messageKey, ...))
        end
    end
    return logger
end

function SexyLib:InitLogger(addonName, colorCode)
    loggers[addonName] = initLogger(addonName, colorCode)
end

function SexyLib:Logger(addonName)
    if not loggers[addonName] then SexyLib:InitLogger(addonName, '&c') end
    return loggers[addonName]
end

SexyLib:InitLogger('Sexy Lib', '&a')