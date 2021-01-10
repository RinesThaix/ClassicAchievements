CA_Criterias = {}

local struct = CA_Criterias
local loc = SexyLib:Localization('Classic Achievements')

struct.TYPE = {
    KILL_NPC = 1,
    KILL_NPCS = 2,
    COMPLETE_QUEST = 3,
    COMPLETE_QUESTS = 4,
    OBTAIN_ITEM = 5, -- not supported yet
    KILL_PLAYERS = 6,
    KILL_PLAYER_OF_RACE = 7, -- not supported yet
    KILL_PLAYER_OF_CLASS = 8, -- not supported yet
    KILL_PLAYER_OF_RANK = 9, -- not supported yet
    REACH_PVP_RANK = 10,
    GET_HONOR = 11, -- not supported yet
    REACH_PROFESSION_LEVEL = 12,
    REACH_MAIN_PROFESSION_LEVEL = 13,
    REACH_SECONDARY_PROFESSION_LEVEL = 14,
    CRAFT_ITEM = 15, -- not supported yet
    REACH_REPUTATION = 16,
    REACH_ANY_REPUTATION = 17,
    OPEN_ZONE = 18, -- not supported yet
    REACH_LEVEL = 19,
    COMPLETE_ACHIEVEMENT = 20,
    BANK_SLOTS = 21,
    LOOT_QUEST_GOLD = 22
}

struct.dataLengths = {
    [struct.TYPE.KILL_NPC] = 1,
    [struct.TYPE.KILL_NPCS] = 0,
    [struct.TYPE.COMPLETE_QUEST] = 1,
    [struct.TYPE.COMPLETE_QUESTS] = 0,
    [struct.TYPE.OBTAIN_ITEM] = 1,
    [struct.TYPE.KILL_PLAYERS] = 0,
    [struct.TYPE.KILL_PLAYER_OF_RACE] = 1,
    [struct.TYPE.KILL_PLAYER_OF_CLASS] = 1,
    [struct.TYPE.KILL_PLAYER_OF_RANK] = 1,
    [struct.TYPE.REACH_PVP_RANK] = 1,
    [struct.TYPE.GET_HONOR] = 1,
    [struct.TYPE.REACH_PROFESSION_LEVEL] = 2,
    [struct.TYPE.REACH_MAIN_PROFESSION_LEVEL] = 1,
    [struct.TYPE.REACH_SECONDARY_PROFESSION_LEVEL] = 1,
    [struct.TYPE.CRAFT_ITEM] = 1,
    [struct.TYPE.REACH_REPUTATION] = 2,
    [struct.TYPE.REACH_ANY_REPUTATION] = 1,
    [struct.TYPE.OPEN_ZONE] = 1,
    [struct.TYPE.REACH_LEVEL] = 1,
    [struct.TYPE.COMPLETE_ACHIEVEMENT] = 1,
    [struct.TYPE.BANK_SLOTS] = 0,
    [struct.TYPE.LOOT_QUEST_GOLD] = 0
}

struct.criterias = {}
for _, type in pairs(struct.TYPE) do
    struct.criterias[type] = {}
end

local completion = CA_CompletionManager:GetLocal()
local lastID = 0

function struct:CreateL(name, ...)
    return struct:Create(loc:Get(name), ...)
end

function struct:Create(name, type, data, quantity)
    lastID = lastID + 1
    local id = lastID
    local result = {
        id = id,
        name = name,
        type = type,
        data = data,
        flags = 0,
        SetQuantityFormatter = function(self, formatter)
            self.quantityFormat = formatter
            return self
        end
    }
    if quantity and quantity > 0 then
        result.quantity = quantity
        result.flags = EVALUATION_TREE_FLAG_PROGRESS_BAR
    end

    local length = struct.dataLengths[type]
    if not length then return nil end
    local criterias = struct.criterias[type]
    if not criterias then return nil end
    if length > 0 and not data then return nil end
    for i = 1, length do
        if not data[i] then return nil end
        if not criterias[data[i]] then criterias[data[i]] = {} end
        criterias = criterias[data[i]]
    end
    criterias[#criterias + 1] = result

    return result
end

function struct:Trigger(type, data, count, const)
    local length = struct.dataLengths[type]
    if not length then return end
    local criterias = struct.criterias[type]
    if not criterias then return end
    if length > 0 and not data then return end
    for i = 1, length do
        if not data[i] then return end
        criterias = criterias[data[i]]
        if not criterias then return end
    end
    count = count or 1
    for _, criteria in pairs(criterias) do
        if criteria.quantity then
            if const then
                completion:SetCriteriaProgressionGlobally(criteria.id, criteria.quantity, count)
            else
                completion:IncrementCriteriaProgressionGlobally(criteria.id, criteria.quantity, count)
            end
        else
            completion:CompleteCriteriaGlobally(criteria.id)
        end
    end
end