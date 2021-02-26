local damageEvents = {}
local prefixes = {'SWING', 'RANGE', 'SPELL', 'SPELL_PERIODIC', 'SPELL_BUILDING'}
local suffixes = {'DAMAGE', 'DRAIN', 'LEECH', 'INSTAKILL'}
for _, prefix in pairs(prefixes) do
    for _, suffix in pairs(suffixes) do
        damageEvents[prefix .. '_' .. suffix] = true
    end
end

local units = {'target', 'targetpet', 'focus', 'focuspet', 'pet', 'mouseover', 'mouseoverpet'}
for i = 1, 40 do
    if i <= 4 then
        units[#units + 1] = 'party' .. i
        units[#units + 1] = 'partypet' .. i
    end
    units[#units + 1] = 'raid' .. i
    units[#units + 1] = 'raidpet' .. i
end
for i = 1, #units * 2 do
    units[#units + 1] = units[i] .. 'target'
end

local inRaidBits = {
    COMBATLOG_OBJECT_AFFILIATION_MINE,
    COMBATLOG_OBJECT_AFFILIATION_PARTY,
    COMBATLOG_OBJECT_AFFILIATION_RAID
}

local function strstartsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

local firstDamagesFromRaid = {}
local tapped = {}

CA_CreatureKillingTracker = {
    handlers = {},
    playerHandlers = {},
    HandleCombatEvent = function(self)
        local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, raidFlags, targetGUID, targetName, targetFlags, destRaidFlags = select(1, CombatLogGetCurrentEventInfo())
        if damageEvents[type] then
            if firstDamagesFromRaid[targetGUID] == nil then firstDamagesFromRaid[targetGUID] = self:IsInRaid(sourceFlags) end
            if not tapped[targetGUID] then
                local unit = self:FindUnitByGUID(targetGUID)
                if unit then tapped[targetGUID] = not UnitIsTapDenied(unit) end
            end
        elseif type == 'UNIT_DIED' then
            local count
            if tapped[targetGUID] ~= nil then
                count = tapped[targetGUID]
                tapped[targetGUID] = nil
            else
                count = firstDamagesFromRaid[targetGUID] or false
            end
            firstDamagesFromRaid[targetGUID] = nil
            if count then self:HandleKill(targetGUID) end
        end
    end,
    HandleKill = function(self, targetGUID)
        if self:IsCreatureGUID(targetGUID) then
            local targetID = self:GetCreatureID(targetGUID)
            for _, handler in pairs(self.handlers) do
                if handler:predicate(targetID) then handler:accept(targetID) end
            end
        elseif self:IsPlayerGUID(targetGUID) then
            for _, handler in pairs(self.playerHandlers) do handler(targetGUID) end
        end
    end,
    AddHandler = function(self, predicate, acceptor)
        if type(predicate) == 'number' then
            local id = predicate
            predicate = function(targetID) return targetID == id end
        elseif type(predicate) == 'table' then
            local ids = {}
            for _, id in pairs(predicate) do ids[id] = true end
            predicate = function(targetID) return ids[targetID] == true end
        end
        self.handlers[#self.handlers + 1] = {
            predicate = function(self, targetID)
                return predicate(targetID)
            end,
            accept = function(self, targetID)
                return acceptor(targetID)
            end
        }
    end,
    AddPlayerHandler = function(self, acceptor)
        self.playerHandlers[#self.playerHandlers + 1] = acceptor
    end,
    IsPlayerGUID = function(self, guid)
        return strstartsWith(guid, 'Player-')
    end,
    IsCreatureGUID = function(self, guid)
        return strstartsWith(guid, 'Creature-')
    end,
    GetCreatureID = function(self, guid)
        local id = select(6, strsplit('-', guid))
        return tonumber(id)
    end,
    FindUnitByGUID = function(self, guid)
        for _, unit in pairs(units) do
            if UnitGUID(unit) == guid then return unit end
        end
        return nil
    end,
    IsInRaid = function(self, sourceFlags)
        for _, raidBit in pairs(inRaidBits) do
            if bit.band(sourceFlags, raidBit) == 1 then return true end
        end
        return false
    end
}
