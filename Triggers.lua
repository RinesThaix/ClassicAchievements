local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')

local function trigger(...)
    CA_Criterias:Trigger(...)
end

local function strstartsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

local function isPlayer(guid)
    return strstartsWith(guid, 'Player-')
end

local function isCreature(guid)
    return strstartsWith(guid, 'Creature-')
end

local function getCreatureID(guid)
    local id = select(6, strsplit('-', guid))
    return tonumber(id)
end

local function updateQuests()
    local questsCompleted, total = GetQuestsCompleted(), 0
    for questID, isCompleted in pairs(questsCompleted) do
        if isCompleted then
            trigger(TYPE.COMPLETE_QUEST, {questID}, 1, true)
            total = total + 1
        end
    end
    trigger(TYPE.COMPLETE_QUESTS, nil, total, true)
end

local function updateBankSlots()
    local bankSlots = GetNumBankSlots()
    trigger(TYPE.BANK_SLOTS, nil, bankSlots, true)
end

local function updateReputations()
    local totals = {}
    for factionIndex = 1, GetNumFactions() do
        local name, description, standingId, bottomValue, topValue, earnedValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID = GetFactionInfo(factionIndex)
        if not isHeader then
            for level = 1, standingId do
                trigger(TYPE.REACH_REPUTATION, {factionID, level}, 1, true)
                totals[level] = (totals[level] or 0) + 1
            end
        end
    end
    for standingId, total in pairs(totals) do
        trigger(TYPE.REACH_ANY_REPUTATION, {standingId}, total, true)
    end
end

ClassicAchievementsProfessions = {
    FIRST_AID = {1, false},
    FISHING = {2, false},
    COOKING = {3, false},
    ENCHANTING = {4, true},
    TAILORING = {5, true},
    ENGINEERING = {6, true},
    LEATHERWORKING = {7, true},
    ALCHEMY = {8, true},
    BLACKSMITHING = {9, true},
    HERBALISM = {10, true},
    MINING = {11, true},
    SKINNING = {12, true}
}

for idx, data in pairs(ClassicAchievementsProfessions) do
    ClassicAchievementsProfessions[idx] = {data[1], data[2], loc:Get('PROF_' .. idx)}
end

local function triggerProfessions(array, type)
    local size = #array
    if size == 0 then return end
    if size == 1 then trigger(type, array, 1, true) end
    table.sort(array, function(a, b) return a < b end)
    trigger(type, {array[1]}, size, true)
    for i = 2, size do
        if array[i - 1] ~= array[i] then
            trigger(type, {array[i]}, size - i + 1, true)
        end
    end
end

local function updateProfessions()
    local main, secondary = {}, {}
    for i = 1, GetNumSkillLines() do
        local skillName, isHeader, _, points, tempPoints = GetSkillLineInfo(i)
        if not isHeader then
            points = min(300, points - tempPoints)
            for idx, data in pairs(ClassicAchievementsProfessions) do
                if data[3] == skillName then
                    trigger(TYPE.REACH_PROFESSION_LEVEL, {data[1], points}, 1, true)
                    if data[2] then
                        main[#main + 1] = points
                    else
                        secondary[#secondary + 1] = points
                    end
                    break
                end
            end
        end
    end
    triggerProfessions(main, TYPE.REACH_MAIN_PROFESSION_LEVEL)
    triggerProfessions(secondary, TYPE.REACH_SECONDARY_PROFESSION_LEVEL)
end

local function updateItemsInInventory()
    local items = {}
    for i = 0, NUM_BAG_SLOTS do
        for j = 1, GetContainerNumSlots(i) do
            local _, quantity, _, _, _, _, _, _, _, itemID = GetContainerItemInfo(i, j)
            if itemID and quantity then
                if not items[itemID] then items[itemID] = 0 end
                items[itemID] = items[itemID] + quantity
            end
        end
    end
    for id, quantity in pairs(items) do trigger(TYPE.OBTAIN_ITEM, {id}, quantity, true) end
end

local AREA_COORD_ADDITION = 0.01
local updatingExploredAreas = false

local function updateExploredAreas(mapIDs)
    for _, mapID in pairs(mapIDs) do
        if C_Map.GetMapInfo(mapID) then
            for x = 0, 1, AREA_COORD_ADDITION do
                for y = 0, 1, AREA_COORD_ADDITION do
                    local areaIDs = C_MapExplorationInfo.GetExploredAreaIDsAtPosition(mapID, CreateVector2D(x, y))
                    if areaIDs then
                        trigger(TYPE.EXPLORE_AREA, {areaIDs[1]}, 1, true)
                    end
                end
            end
        end
    end
end

function ClassicAchievements_UpdateExploredAreas()
    if updatingExploredAreas then return end
    updatingExploredAreas = true

    SexyLib:Logger('Classic Achievements'):LogInfoL('UPDATING_EXPLORED_AREAS')
    local callback = function()
        updatingExploredAreas = false
        SexyLib:Logger('Classic Achievements'):LogInfoL('UPDATED_EXPLORED_AREAS')
    end

    local mapIDs = {}
    for mapID = 1411, 1458 do
        mapIDs[#mapIDs + 1] = mapID
        if #mapIDs == 10 then
            local batch = mapIDs
            mapIDs = {}
            local previous = callback
            callback = function()
                updateExploredAreas(batch)
                C_Timer.After(1, previous)
            end
        end
    end
    
    if #mapIDs > 0 then
        updateExploredAreas(mapIDs)
        C_Timer.After(1, callback)
    else
        callback()
    end
end

C_Timer.After(5, function()
    local kills, _, maxRank = GetPVPLifetimeStats()
    local _, maxRank = GetPVPRankInfo(maxRank)
    trigger(TYPE.KILL_PLAYERS, nil, kills, true)
    for rank = 1, maxRank do trigger(TYPE.REACH_PVP_RANK, {rank}, 1, true) end

    local level = UnitLevel('player')
    for lvl = 1, level do trigger(TYPE.REACH_LEVEL, {lvl}, 1, true) end

    updateQuests()
    updateBankSlots()
    updateReputations()
    updateProfessions()
    updateItemsInInventory()
end)

local ITEM_CREATION_PATTERN = LOOT_ITEM_CREATED_SELF:gsub("%%s","%(.*%)")
local ITEM_CREATION_PATTERN_MULTIPLE = LOOT_ITEM_CREATED_SELF_MULTIPLE:gsub('%%s', '%(.*%)'):gsub('%%d', '%(%%d%+%)')

local ZONE_EXPLORED_PATTERN = ERR_ZONE_EXPLORED:gsub('%%s', '%(.*%)')
local ZONE_EXPLORED2_PATTERN = ERR_ZONE_EXPLORED_XP:gsub('%%s', '%(.*%)'):gsub('%%d', '%%d')

local events = {
    COMBAT_LOG_EVENT_UNFILTERED = function()
        local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceFlags2, targetGUID, targetName, targetFlags, targetFlags2 = select(1, CombatLogGetCurrentEventInfo())
        if type == 'PARTY_KILL' then
            if isCreature(targetGUID) then
                trigger(TYPE.KILL_NPC, {getCreatureID(targetGUID)}, 1)
                trigger(TYPE.KILL_NPCS, nil, 1)
            elseif isPlayer(targetGUID) then
                local kills = GetPVPLifetimeStats()
                trigger(TYPE.KILL_PLAYERS, nil, kills, true)

                local _, className, _, raceName = GetPlayerInfoByGUID(targetGUID)
                trigger(TYPE.KILL_PLAYER_OF_CLASS, {string.upper(className)}, 1)
                trigger(TYPE.KILL_PLAYER_OF_RACE, {string.upper(raceName)}, 1)
            end
        end
    end,
    PLAYER_PVP_KILLS_CHANGED = function()
        local kills = GetPVPLifetimeStats()
        trigger(TYPE.KILL_PLAYERS, nil, kills, true)
    end,
    PLAYER_LEVEL_UP = function(level, healthDelta, powerDelta, numNewTalents, numNewPvpTalentSlots, strengthDelta, agilityDelta, staminaDelta, intellectDelta)
        trigger(TYPE.REACH_LEVEL, {level}, 1, true)
    end,
    QUEST_TURNED_IN = function(questID, xpReward, moneyReward)
        trigger(TYPE.LOOT_QUEST_GOLD, nil, moneyReward)
        C_Timer.After(1, updateQuests)
    end,
    PLAYERBANKBAGSLOTS_CHANGED = function()
        C_Timer.After(1, updateBankSlots)
    end,
    UPDATE_FACTION = function()
        C_Timer.After(1, updateReputations)
    end,
    SKILL_LINES_CHANGED = function()
        C_Timer.After(1, updateProfessions)
    end,
    CHAT_MSG_LOOT = function(msg, initiator, langName, channelName, playerName, flags)
        if flag == 'GM' or flag == 'DEV' then return end
        if not playerName then playerName = initiator end
        if not playerName or playerName ~= UnitName('player') then return end

        C_Timer.After(1, updateItemsInInventory)

        local item, quantity = msg:match(ITEM_CREATION_PATTERN_MULTIPLE)
        if not item then
            item = msg:match(ITEM_CREATION_PATTERN)
            if not item then return end
            quantity = 1
        else
            quantity = tonumber(quantity)
        end
        A = item
        local id = tonumber(item:match("\124Hitem:(%d+):"))
        if not id then return end
        trigger(TYPE.CRAFT_ITEM, {id}, quantity)
    end,
    UPDATE_BATTLEFIELD_SCORE = function()
        if not InActiveBattlefield() then return end
        local winner = GetBattlefieldWinner()
        if not winner then return end
        
        local mapID = C_Map.GetBestMapForUnit('player')
        if mapID ~= 1459 and mapID ~= 1460 and mapID ~= 1461 then return end

        local numStats, numScores = GetNumBattlefieldStats(), GetNumBattlefieldScores()
        local myName = UnitName('player')
        for i = 1, numScores do
            local name, killingBlows, honorableKills = GetBattlefieldScore(i)
            if name == myName then
                local scores = {killingBlows, honorableKills}
                for j = 1, numStats do
                    local stat = GetBattlefieldStatData(i, j)
                    trigger(TYPE.BATTLEFIELD_STAT_MAX, {mapID, j}, stat, true)
                end
                for j, score in pairs(scores) do
                    trigger(TYPE.BATTLEFIELD_SCORE_MAX, {mapID, j}, score, true)
                    trigger(TYPE.BATTLEFIELDS_SCORE, {j}, score)
                end
                break
            end
        end

        local myFaction = UnitFactionGroup('player')
        if myFaction == 'Horde' then myFaction = 0 else myFaction = 1 end
        if winner == myFaction then
            trigger(TYPE.BATTLEFIELD_WINS, {mapID}, 1)
        end
    end,
    UI_INFO_MESSAGE = function(type, message)
        if type ~= 372 then return end
        local areaName = message:match(ZONE_EXPLORED_PATTERN)
        if not areaName then areaName = message:match(ZONE_EXPLORED2_PATTERN) end
        if not areaName then return end
        for areaID, name in pairs(AreaTableLocale) do
            if name == areaName then
                trigger(TYPE.EXPLORE_AREA, {areaID}, 1, true)
            end
        end
    end
}
local eventsHandler = CreateFrame('FRAME', 'ClassicAchievementsEventHandlingFrame')
eventsHandler:SetScript('OnEvent', function(self, event, ...)
    events[event](...)
end)
for k, _ in pairs(events) do eventsHandler:RegisterEvent(k) end