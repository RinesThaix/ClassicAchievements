local db = CA_Database
local criterias = CA_Criterias
local loc = SexyLib:Localization('Classic Achievements')

local tab = db:GetTab(db.TAB_ID_PLAYER)
local ach, previous = nil

local featsOfStrength = tab:CreateCategory('CATEGORY_FEATS_OF_STRENGTH', nil, true, 99)

-- GENERAL --
local general = tab:CreateCategory('CATEGORY_GENERAL', nil, true)

do
    for i = 1, 6 do
        local lvl = i * 10
        ach = general:CreateAchievement(loc:Get('AN_LVL', lvl), loc:Get('AD_LVL', lvl), 10, 'level_' .. lvl)
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_LEVEL, {lvl}))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
end

ach = general:CreateAchievement('AN_BANK', 'AD_BANK', 10, 'bank', true)
ach:AddCriteria(criterias:Create('AC_BANK', criterias.TYPE.BANK_SLOTS, nil, 6))

do
    previous = nil
    for i, count in pairs({100, 1000, 5000, 10000, 25000, 50000, 100000}) do
        ach = general:CreateAchievement(loc:Get('AN_MOB_KILLS_' .. i), loc:Get('AD_MOB_KILLS', count), 10, 'mob_kills_' .. i)
        ach:AddCriteria(criterias:Create(loc:Get('AC_MOB_KILLS', count), criterias.TYPE.KILL_NPCS, nil, count))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
end

-- QUESTS --
local quests = tab:CreateCategory('CATEGORY_QUESTS', nil, true)

do
    previous = nil
    for i, count in pairs({50, 100, 250, 500, 750, 1000}) do
        ach = quests:CreateAchievement(loc:Get('AN_QUESTS', count), loc:Get('AD_QUESTS', count), 10, 'quests_' .. i)
        ach:AddCriteria(criterias:Create(loc:Get('AC_QUESTS', count), criterias.TYPE.COMPLETE_QUESTS, nil, count))
        if previous then previous:SetNext(ach) end
        previous = ach
    end

    previous = nil
    for i, count in pairs({5, 10, 25, 50, 100}) do
        local texture
        if i == 1 then texture = 6
        elseif i < 4 then texture = 4
        else texture = 1 end
        ach = quests:CreateAchievement(loc:Get('AN_QUEST_GOLD' .. count), loc:Get('AD_QUEST_GOLD', count), 10, '-Inv_Misc_Coin_0' .. texture)
        ach:AddCriteria(criterias:Create(loc:Get('AC_QUEST_GOLD', count), criterias.TYPE.LOOT_QUEST_GOLD, nil, count * 10000):SetQuantityFormatter(function(current, required)
            return GetCoinTextureString(current) .. ' / ' .. GetCoinTextureString(required)
        end))
        if previous then previous:SetNext(ach) end
        previous = ach
    end
end

local function addZoneQuests(continent, parent, zoneName, questIDs, points)
    if type(questIDs) ~= 'table' then questIDs = {questIDs} end
    local zname1, zname2 = loc:Get(zoneName .. '_1'), loc:Get(zoneName .. '_2')
    local name = loc:Get('AN_QUESTS_ZONE', zname2)
    local description
    if #questIDs == 1 then
        description = loc:Get('AD_QUESTS_ZONE', loc:Get('QUEST_' .. questIDs[1]), zname1)
    else
        description = loc:Get('AD_QUESTS_ZONE_MULTI', zname1)
    end

    local ach = continent:CreateAchievement(name, description, points or 10, string.lower(zoneName))
    if #questIDs == 1 then
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.COMPLETE_QUEST, questIDs))
    else
        for _, questID in pairs(questIDs) do
            ach:AddCriteria(criterias:Create(loc:Get('AC_QUESTS_ZONE', loc:Get('QUEST_' .. questID)), criterias.TYPE.COMPLETE_QUEST, {questID}))
        end
    end

    parent:AddCriteria(criterias:Create(ach.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))

    return ach
end

do
    local questsKalimdor = tab:CreateCategory('CATEGORY_KALIMDOR', quests.id, true)
    local kach = questsKalimdor:CreateAchievement('AN_WISDOM_KEEPER_KALIMDOR', 'AD_WISDOM_KEEPER_KALIMDOR', 20, 'kalimdor', true)
    questsKalimdor.add = function(self, ...) return addZoneQuests(self, kach, ...) end
    
    questsKalimdor:add('DUROTAR', 835)
    questsKalimdor:add('BARRENS', {888, 902})
    questsKalimdor:add('STONETALON', 1096)
    questsKalimdor:add('DESOLACE', 6027)
    questsKalimdor:add('THOUSAND_NEEDLES', 1189)
    questsKalimdor:add('DUSTWALLOW', 1203)
    questsKalimdor:add('FELWOOD', {5165, 5385})
    questsKalimdor:add('TANARIS', {2662, 2874, 1691, 113})
    questsKalimdor:add('UNGORO', {3962, 4245, 4292})
    questsKalimdor:add('AZSHARA', 3602)
    questsKalimdor:add('WINTERSPRING', {975, 5082, 5121, 5163, 4842})
    questsKalimdor:add('SILITHUS', {8287, 8352, 8321, 8281})
    
    local questsEasternKingdoms = tab:CreateCategory('CATEGORY_EASTERN_KINGDOMS', quests.id, true)
    local ekach = questsEasternKingdoms:CreateAchievement('AN_WISDOM_KEEPER_EASTERN_KINGDOMS', 'AD_WISDOM_KEEPER_EASTERN_KINGDOMS', 20, 'eastern_kingdoms', true)
    questsEasternKingdoms.add = function(self, ...) return addZoneQuests(self, ekach, ...) end

    questsEasternKingdoms:add('ARATHI', 652)
    questsEasternKingdoms:add('STRANGLETHORN_VALLEY', {208, 600, 613, 628, 338})
    questsEasternKingdoms:add('BADLANDS', {737, 778, 656})
    questsEasternKingdoms:add('SEARING_GORGE', 3481)
    questsEasternKingdoms:add('BLASTED_LANDS', 3628)
    questsEasternKingdoms:add('WESTERN_PLAGUELANDS', {5944, 5051, 4985})
    questsEasternKingdoms:add('EASTERN_PLAGUELANDS', {5942, 6041, 5265})
    questsEasternKingdoms:add('BLACK_ROCK', 8996, 20)

    ach = quests:CreateAchievement('AN_WISDOM_KEEPER', 'AD_WISDOM_KEEPER', 30, '-Inv_Misc_Book_07', true)
    ach:AddCriteria(criterias:Create(kach.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {kach.id}))
    ach:AddCriteria(criterias:Create(ekach.name , criterias.TYPE.COMPLETE_ACHIEVEMENT, {ekach.id}))
end

local pve = tab:CreateCategory('PvE')

local createPvE = function(category)
    return function(instanceName, icon, npcIDs, points)
        ach = category:CreateAchievement('AN_' .. instanceName, 'AD_' .. instanceName, points or 10, icon, true)
        if type(npcIDs) == 'table' then
            for i, npcID in pairs(npcIDs) do
                if npcID > 0 then
                    ach:AddCriteria(criterias:CreateL('AC_' .. instanceName .. i, criterias.TYPE.KILL_NPC, {npcID}))
                else
                    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.KILL_NPC, {-npcID}))
                end
            end
        else
            ach:AddCriteria(criterias:Create(nil, criterias.TYPE.KILL_NPC, {npcIDs}))
        end
        return ach
    end
end

local instances = tab:CreateCategory('CATEGORY_INSTANCES', pve.id, true)

local brd, brs, defender
do
    local create = createPvE(instances)
    local rc = create('RAGEFIRE_CHASM', '-Racial_Orc_BerserkerStrength', 11518).id
    local wc = create('WAILING_CAVERNS', 'wailing_caverns', 3654).id
    local dm = create('DEAD_MINES', '-Inv_Pick_03', 639).id
    local sk = create('SHADOWFANG_KEEP', '-Inv_Weapon_Hand_01', 4275).id
    local bfd = create('BLACKFATHOM_DEEPS', 'blackfathom_deeps', 4829).id
    local jail = create('JAIL', '-Spell_Holy_Sealofprotection', 1666).id
    local gnom = create('GNOMREGAN', 'gnomregan', 7800).id
    local rk = create('RAZORFEN_KRAUL', 'razorfen_kraul', 4421).id
    local sm = create('SCARLET_MONASTERY', '-Spell_Holy_Resurrection', {4543, 6487, 3975, 3977}, 20).id
    local rd = create('RAZORFEN_DOWNS', 'razorfen_downs', {7358, 7356}).id
    local uldaman = create('ULDAMAN', 'uldaman', 2748).id
    local zf = create('ZULFARRAK', 'zulfarrak', 7267).id
    local mara = create('MARAUDON', 'maraudon', 12201).id
    local st = create('SUNKEN_TEMPLE', 'sunken_temple', 5709).id

    local id1 = create('NEW_EMPEROR', 'new_emperor', 9019).id
    local id2 = create('BLACKROCK_DEPTHS', '-Spell_Fire_Lavaspawn', {9018, 9319, 9033, 8983, 9017, 9041, 9016}, 20).id
    local id3 = create('BLACKROCK_PARTY', '-Inv_Misc_Food_31', {9543, 9499, 9537, 9502}, 10).id
    ach = instances:CreateAchievement('AN_ARMOR_SWORD', 'AD_ARMOR_SWORD', 10, '-Inv_Sword_47', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.OBTAIN_ITEM, {11786}))
    local id4 = ach.id
    ach = instances:CreateAchievement('AN_BLACKROCK_DEPTHS_FULL', 'AD_BLACKROCK_DEPTHS_FULL', 10, '-Inv_Misc_AhnQirajTrinket_03', true)
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id2}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_PARTY', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id3}))
    ach:AddCriteria(criterias:CreateL('AN_NEW_EMPEROR', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id1}))
    ach:AddCriteria(criterias:CreateL('AN_ARMOR_SWORD', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id4}))
    brd = ach.id

    id1 = create('BLACKROCK_SPIRE_BOTTOM', 'lbrs', 9568).id
    id2 = create('BLACKROCK_SPIRE_UPPER', 'ubrs', 10363).id
    ach = instances:CreateAchievement('AN_BLACKROCK_SPIRE', 'AD_BLACKROCK_SPIRE', 10, '-Inv_Sword_48', true)
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE_BOTTOM', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id1}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE_UPPER', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id2}))
    brs = ach.id

    local direm = create('DIRE_MAUL', '-Ability_Warrior_DecisiveStrike', {11492, 11486, 11501}).id

    id1 = create('STRATHOLME_LIVE', '-Inv_Jewelry_Necklace_01', 10813).id
    id2 = create('STRATHOLME_DEAD', '-Inv_Jewelry_Necklace_19', 10440).id
    ach = instances:CreateAchievement('AN_STRATHOLME', 'AD_STRATHOLME', 10, '-Inv_Shield_01', true)
    ach:AddCriteria(criterias:CreateL('AN_STRATHOLME_LIVE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id1}))
    ach:AddCriteria(criterias:CreateL('AN_STRATHOLME_DEAD', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id2}))
    local strat = ach.id

    local scholo = create('SCHOLOMANCE', '-Spell_Holy_Senseundead', 1853, 20).id

    ach = instances:CreateAchievement('AN_YOUNG_DEFENDER', 'AD_YOUNG_DEFENDER', 20, '-Inv_Helmet_03', true)
    ach:AddCriteria(criterias:CreateL('AN_RAGEFIRE_CHASM', criterias.TYPE.COMPLETE_ACHIEVEMENT, {rc}))
    ach:AddCriteria(criterias:CreateL('AN_WAILING_CAVERNS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {wc}))
    ach:AddCriteria(criterias:CreateL('AN_DEAD_MINES', criterias.TYPE.COMPLETE_ACHIEVEMENT, {dm}))
    ach:AddCriteria(criterias:CreateL('AN_SHADOWFANG_KEEP', criterias.TYPE.COMPLETE_ACHIEVEMENT, {sk}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKFATHOM_DEEPS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {bfd}))
    ach:AddCriteria(criterias:CreateL('AN_JAIL', criterias.TYPE.COMPLETE_ACHIEVEMENT, {jail}))
    ach:AddCriteria(criterias:CreateL('AN_GNOMREGAN', criterias.TYPE.COMPLETE_ACHIEVEMENT, {gnom}))
    ach:AddCriteria(criterias:CreateL('AN_RAZORFEN_KRAUL', criterias.TYPE.COMPLETE_ACHIEVEMENT, {rk}))
    ach:AddCriteria(criterias:CreateL('AN_SCARLET_MONASTERY', criterias.TYPE.COMPLETE_ACHIEVEMENT, {sm}))
    ach:AddCriteria(criterias:CreateL('AN_RAZORFEN_DOWNS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {rd}))
    ach:AddCriteria(criterias:CreateL('AN_ULDAMAN', criterias.TYPE.COMPLETE_ACHIEVEMENT, {uldaman}))
    ach:AddCriteria(criterias:CreateL('AN_ZULFARRAK', criterias.TYPE.COMPLETE_ACHIEVEMENT, {zf}))
    ach:AddCriteria(criterias:CreateL('AN_MARAUDON', criterias.TYPE.COMPLETE_ACHIEVEMENT, {mara}))
    ach:AddCriteria(criterias:CreateL('AN_SUNKEN_TEMPLE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {st}))
    
    id1 = ach.id
    ach = pve:CreateAchievement('AN_DEFENDER', 'AD_DEFENDER', 20, '-Inv_Helmet_01', true)
    ach:AddCriteria(criterias:CreateL('AN_YOUNG_DEFENDER', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id1}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS_FULL', criterias.TYPE.COMPLETE_ACHIEVEMENT, {brd}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {brs}))
    ach:AddCriteria(criterias:CreateL('AN_DIRE_MAUL', criterias.TYPE.COMPLETE_ACHIEVEMENT, {direm}))
    ach:AddCriteria(criterias:CreateL('AN_STRATHOLME', criterias.TYPE.COMPLETE_ACHIEVEMENT, {strat}))
    ach:AddCriteria(criterias:CreateL('AN_SCHOLOMANCE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {scholo}))
    ach:SetRewardText(loc:Get('AR_DEFENDER'))
    defender = ach.id
end

local raids = tab:CreateCategory('CATEGORY_RAIDS', pve.id, true)

do
    local create = createPvE(raids)

    local onyxia = create('ONYXIA', 'onyxia', 10184).id
    local aq20 = create('AQ20', 'aq20', 15339).id
    local zg = create('ZULGURUB', 'zulgurub', 14834).id
    local ragnaros = create('RAGNAROS', 'ragnaros', 11502, 20).id
    local bwl = create('BLACK_WING_LAIR', 'bwl', 11583, 20).id
    local aq40 = create('AQ40', 'aq40', 15727, 20).id
    local nx1 = create('NAXXRAMAS_SPIDERS', '-Inv_Trinket_Naxxramas04', 15952).id
    local nx2 = create('NAXXRAMAS_PLAGUE', '-Spell_Shadow_Deathcoil', 16011).id
    local nx3 = create('NAXXRAMAS_MILITARY', '-Inv_Sword_2h_AshbringerCorrupt', {-16062, -16063, -16064, -16065}).id
    local nx4 = create('NAXXRAMAS_CONSTRUCT', '-Ability_Creature_Poison_01', 15928).id
    local nx5 = create('NAXXRAMAS_LAIR', 'kelthuzad', 15990).id
    ach = raids:CreateAchievement('AN_NAXXRAMAS', 'AD_NAXXRAMAS', 10, 'naxxramas', true)
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_SPIDERS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx1}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_PLAGUE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx2}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_MILITARY', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx3}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_CONSTRUCT', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx4}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS_LAIR', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx5}))
    local nx = ach.id

    ach = raids:CreateAchievement('AN_YOUNG_HERO', 'AD_YOUNG_HERO', 20, 'young_hero', true)
    ach:AddCriteria(criterias:CreateL('AN_ONYXIA', criterias.TYPE.COMPLETE_ACHIEVEMENT, {onyxia}))
    ach:AddCriteria(criterias:CreateL('AN_AQ20', criterias.TYPE.COMPLETE_ACHIEVEMENT, {aq20}))
    ach:AddCriteria(criterias:CreateL('AN_ZULGURUB', criterias.TYPE.COMPLETE_ACHIEVEMENT, {zg}))
    local id = ach.id

    ach = pve:CreateAchievement('AN_BLACKROCK_MASTER', 'AD_BLACKROCK_MASTER', 20, 'blackrock_master', true)
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_DEPTHS_FULL', criterias.TYPE.COMPLETE_ACHIEVEMENT, {brd}))
    ach:AddCriteria(criterias:CreateL('AN_BLACKROCK_SPIRE', criterias.TYPE.COMPLETE_ACHIEVEMENT, {brs}))
    ach:AddCriteria(criterias:CreateL('AN_RAGNAROS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {ragnaros}))
    ach:AddCriteria(criterias:CreateL('AN_BLACK_WING_LAIR', criterias.TYPE.COMPLETE_ACHIEVEMENT, {bwl}))

    ach = pve:CreateAchievement('AN_HERO', 'AD_HERO', 20, 'hero', true)
    ach:AddCriteria(criterias:CreateL('AN_YOUNG_HERO', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id}))
    ach:AddCriteria(criterias:CreateL('AN_RAGNAROS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {ragnaros}))
    ach:AddCriteria(criterias:CreateL('AN_BLACK_WING_LAIR', criterias.TYPE.COMPLETE_ACHIEVEMENT, {bwl}))
    ach:AddCriteria(criterias:CreateL('AN_AQ40', criterias.TYPE.COMPLETE_ACHIEVEMENT, {aq40}))
    ach:AddCriteria(criterias:CreateL('AN_NAXXRAMAS', criterias.TYPE.COMPLETE_ACHIEVEMENT, {nx}))
    ach:SetRewardText(loc:Get('AR_HERO'))
    id = ach.id

    ach = pve:CreateAchievement('AN_GREAT_HERO', 'AD_GREAT_HERO', 20, 'great_hero', true)
    ach:AddCriteria(criterias:CreateL('AN_DEFENDER', criterias.TYPE.COMPLETE_ACHIEVEMENT, {defender}))
    ach:AddCriteria(criterias:CreateL('AN_HERO', criterias.TYPE.COMPLETE_ACHIEVEMENT, {id}))
    ach:SetRewardText(loc:Get('AR_GREAT_HERO'))
end

local pvp = tab:CreateCategory('PvP')

do
    previous = nil
    for i = 1, 14 do
        ach = pvp:CreateAchievement(loc:Get('AN_PVP_RANK', i), loc:Get('AD_PVP_RANK' .. i), 10, 'pvp_rank_' .. i)
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_PVP_RANK, {i}))
        if previous then previous:SetNext(ach) end
        previous = ach
    end

    previous = pvp:CreateAchievement('AN_PVP_FIRST_KILL', 'AD_PVP_FIRST_KILL', 10, 'pvp_kills_1', true)
    previous:AddCriteria(criterias:CreateL('AC_PVP_FIRST_KILL', criterias.TYPE.KILL_PLAYERS, nil, 1))
    for i, count in pairs({100, 250, 500, 1000, 2000, 5000, 10000}) do
        ach = pvp:CreateAchievement(loc:Get('AN_PVP_KILLS', count), loc:Get('AD_PVP_KILLS', count), 10, 'pvp_kills_' .. (i + 1))
        ach:AddCriteria(criterias:Create(loc:Get('AC_PVP_KILLS', count), criterias.TYPE.KILL_PLAYERS, nil, count))
        previous:SetNext(ach)
        previous = ach
    end
end

local professions = tab:CreateCategory('CATEGORY_PROFESSIONS', nil, true)

do
    ach = professions:CreateAchievement(loc:Get('AN_PROFS_ONE'), loc:Get('AD_PROFS_ONE'), 10, '-Inv_Misc_Note_01')
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_MAIN_PROFESSION_LEVEL, {300}))

    local twoMains = professions:CreateAchievement(loc:Get('AN_PROFS_TWO'), loc:Get('AD_PROFS_TWO'), 10, '-Inv_Misc_Note_02')
    twoMains:AddCriteria(criterias:Create(loc:Get('AC_PROFS_TWO'), criterias.TYPE.REACH_MAIN_PROFESSION_LEVEL, {300}, 2))
    ach:SetNext(twoMains)

    local firstAid = professions:CreateAchievement(loc:Get('AN_PROFS_FIRST_AID'), loc:Get('AD_PROFS_FIRST_AID'), 10, '-Inv_Fabric_Wool_01')
    firstAid:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FIRST_AID[1], 300}))

    local fishing = professions:CreateAchievement(loc:Get('AN_PROFS_FISHING'), loc:Get('AD_PROFS_FISHING'), 10, 'profs_fishing')
    fishing:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FISHING[1], 300}))

    local cooking = professions:CreateAchievement(loc:Get('AN_PROFS_COOKING'), loc:Get('AD_PROFS_COOKING'), 10, 'profs_cooking')
    cooking:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.COOKING[1], 300}))

    local secondary = professions:CreateAchievement(loc:Get('AN_PROFS_SECONDARY'), loc:Get('AD_PROFS_SECONDARY'), 10, '-Inv_Scroll_03')
    secondary:AddCriteria(criterias:Create(firstAid.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {firstAid.id}))
    secondary:AddCriteria(criterias:Create(fishing.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {fishing.id}))
    secondary:AddCriteria(criterias:Create(cooking.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {cooking.id}))
    
    ach = professions:CreateAchievement(loc:Get('AN_PROFS_FIVE'), loc:Get('AD_PROFS_FIVE'), 20, '-Spell_Magic_GreaterBlessingOfKings')
    ach:AddCriteria(criterias:Create(twoMains.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {twoMains.id}))
    ach:AddCriteria(criterias:Create(secondary.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {secondary.id}))
end

local reputation = tab:CreateCategory('CATEGORY_REPUTATION', nil, true)

do
    previous = nil
    for i, count in pairs({1, 2, 4, 8, 12, 16, 20}) do
        local desc, cname
        if i == 1 then
            desc = loc:Get('AD_REPS_1')
            cname = loc:Get('AC_REPS_1')
        else
            desc = loc:Get('AD_REPS', count)
            cname = loc:Get('AC_REPS', count)
        end
        ach = reputation:CreateAchievement(loc:Get('AN_REPS_' .. i), desc, 10, 'reps_' .. i)
        ach:AddCriteria(criterias:Create(cname, criterias.TYPE.REACH_ANY_REPUTATION, {8}, count))
        if i > 2 then ach:SetRewardText(loc:Get('AR_REPS')) end
        if previous then previous:SetNext(ach) end
        previous = ach
    end

    ach = reputation:CreateAchievement(loc:Get('AN_HORDE_REPS'), loc:Get('AD_HORDE_REPS'), 30, 'reps_horde')
    for i, fid in pairs({76, 530, 68, 81}) do
        ach:AddCriteria(criterias:Create(loc:Get('AC_HORDE_REPS_' .. i), criterias.TYPE.REACH_REPUTATION, {fid, 8}))
    end
    ach:SetHordeOnly()

    ach = reputation:CreateAchievement(loc:Get('AN_ALLIANCE_REPS'), loc:Get('AD_ALLIANCE_REPS'), 30, 'reps_alliance')
    for i, fid in pairs({72, 69, 54, 47}) do
        ach:AddCriteria(criterias:Create(loc:Get('AC_ALLIANCE_REPS_' .. i), criterias.TYPE.REACH_REPUTATION, {fid, 8}))
    end
    ach:SetAllianceOnly()

    local function add(factionID, factionName, points, icon, reputationLevel)
        local ach = reputation:CreateAchievement(loc:Get('AN_' .. factionName), loc:Get('AD_' .. factionName), points or 10, icon or string.lower(factionName))
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_REPUTATION, {factionID, reputationLevel or 8}))
    end

    add(749, 'HYDRAXIANS')
    add(270, 'ZANDALAR_TRIBE')
    add(609, 'CENARION_CIRCLE')
    add(910, 'BROOD_OF_NOZDORMU', 20, '-Inv_Misc_Head_Dragon_Bronze')
    add(529, 'ARGENT_DAWN', 20)
    add(576, 'TIMBERMAW_HOLD')
    add(909, 'DARKMOON_FAIRE', 20, '-Inv_Misc_MissileLarge_Red')
    add(87, 'PIRATES', 30, '-Inv_Helmet_66', 6)
    add(809, 'SHENDRALAR', 30)
end

local alterac = tab:CreateCategory('CATEGORY_BG_ALTERAC', pvp.id, true)
local alteracID = 1459
local warsong = tab:CreateCategory('CATEGORY_BG_WARSONG', pvp.id, true)
local warsongID = 1460
local arathi = tab:CreateCategory('CATEGORY_BG_ARATHI', pvp.id, true)
local arathiID = 1461

do
    local function add(category, factionID, factionName, points, icon)
        local ach = category:CreateAchievement(loc:Get('AN_' .. factionName), loc:Get('AD_' .. factionName), points or 10, icon or string.lower(factionName))
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_REPUTATION, {factionID, 8}))
        return ach
    end

    local ach1 = add(arathi, 510, 'DEFILERS', 10, '-Inv_Jewelry_Amulet_07')
    ach1:SetHordeOnly()
    local ach2 = add(alterac, 729, 'FROSTWOLF_CLAN', 10, '-Inv_Jewelry_FrostwolfTrinket_05')
    ach2:SetHordeOnly()
    local ach3 = add(warsong, 889, 'WARSONG_OUTRIDERS', 10, '-Inv_Misc_Rune_07')
    ach3:SetHordeOnly()
    ach = pvp:CreateAchievement(loc:Get('AN_HORDE_PVP_FRACTIONS'), loc:Get('AD_HORDE_PVP_FRACTIONS'), 10, '-Inv_Bannerpvp_01')
    ach:AddCriteria(criterias:Create(ach1.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:SetHordeOnly()

    ach1 = add(arathi, 509, 'LEAGUE_OF_ARATHOR', 10, '-Ability_Warrior_Revenge')
    ach1:SetAllianceOnly()
    ach2 = add(alterac, 730, 'STORMSPIKE_GUARD', 10, '-Inv_Jewelry_Stormpiketrinket_05')
    ach2:SetAllianceOnly()
    ach3 = add(warsong, 890, 'SILVERWING_SENTINELS', 10, '-Ability_Racial_Shadowmeld')
    ach3:SetAllianceOnly()
    ach = pvp:CreateAchievement(loc:Get('AN_ALLIANCE_PVP_FRACTIONS'), loc:Get('AD_ALLIANCE_PVP_FRACTIONS'), 10, '-Inv_Bannerpvp_02')
    ach:AddCriteria(criterias:Create(ach1.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:SetAllianceOnly()
    
    add = function(npcID, name, icon)
        local ach = pvp:CreateAchievement(loc:Get('AN_' .. name .. '_SLAYER'), loc:Get('AD_' .. name .. '_SLAYER'), 10, icon)
        ach:AddCriteria(criterias:Create(nil, criterias.TYPE.KILL_NPC, {npcID}))
        return ach
    end
    
    ach1 = add(1748, 'BOLVAR', '-Spell_Arcane_TeleportStormwind')
    ach1:SetHordeOnly()
    ach2 = add(2784, 'MAGNI', '-Spell_Arcane_TeleportIronforge')
    ach2:SetHordeOnly()
    ach3 = add(7937, 'MEKKATORQUE', '-Inv_Misc_Wrench_01')
    ach3:SetHordeOnly()
    local ach4 = add(7999, 'TYRANDE', '-Spell_Arcane_TeleportDarnassus')
    ach4:SetHordeOnly()
    ach = pvp:CreateAchievement(loc:Get('AN_ALLIANCE_KINGS_SLAYER'), loc:Get('AD_ALLIANCE_KINGS_SLAYER'), 10, '-Ability_Warrior_Warcry')
    ach:AddCriteria(criterias:Create(ach1.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:AddCriteria(criterias:Create(ach4.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach4.id}))
    ach:SetHordeOnly()

    ach1 = add(4949, 'THRALL', '-Spell_Arcane_TeleportOrgrimmar')
    ach1:SetAllianceOnly()
    ach2 = add(10540, 'VOLJIN', '-Spell_Nature_Astralrecalgroup')
    ach2:SetAllianceOnly()
    ach3 = add(10181, 'SYLVANAS', '-Spell_Arcane_TeleportUndercity')
    ach3:SetAllianceOnly()
    ach4 = add(3057, 'CAIRNE', '-Spell_Arcane_TeleportThunderBluff')
    ach4:SetAllianceOnly()
    ach = pvp:CreateAchievement(loc:Get('AN_HORDE_KINGS_SLAYER'), loc:Get('AD_HORDE_KINGS_SLAYER'), 10, '-Spell_Nature_Thunderclap')
    ach:AddCriteria(criterias:Create(ach1.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach1.id}))
    ach:AddCriteria(criterias:Create(ach2.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach2.id}))
    ach:AddCriteria(criterias:Create(ach3.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach3.id}))
    ach:AddCriteria(criterias:Create(ach4.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach4.id}))
    ach:SetAllianceOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_RACES_KILLER'), loc:Get('AD_ALLIANCE_RACES_KILLER'), 20, '-Ability_Gouge')
    for _, race in pairs({'HUMAN', 'NIGHTELF', 'DWARF', 'GNOME'}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. race .. '_KILLED', criterias.TYPE.KILL_PLAYER_OF_RACE, {race}))
    end
    ach:SetHordeOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_RACES_KILLER'), loc:Get('AD_HORDE_RACES_KILLER'), 20, '-Ability_Gouge')
    for _, race in pairs({'ORC', 'TROLL', 'SCOURGE', 'TAUREN'}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. race .. '_KILLED', criterias.TYPE.KILL_PLAYER_OF_RACE, {race}))
    end
    ach:SetAllianceOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_CLASSES_KILLER'), loc:Get('AD_CLASSES_KILLER'), 20, '-Ability_Cheapshot')
    for _, class in pairs({'WARRIOR', 'HUNTER', 'ROGUE', 'PRIEST', 'MAGE', 'WARLOCK', 'DRUID', 'PALADIN'}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. class .. '_KILLED', criterias.TYPE.KILL_PLAYER_OF_CLASS, {class}))
    end
    ach:SetHordeOnly()

    ach = pvp:CreateAchievement(loc:Get('AN_CLASSES_KILLER'), loc:Get('AD_CLASSES_KILLER'), 20, '-Ability_Cheapshot')
    for _, class in pairs({'WARRIOR', 'HUNTER', 'ROGUE', 'PRIEST', 'MAGE', 'WARLOCK', 'DRUID', 'SHAMAN'}) do
        ach:AddCriteria(criterias:CreateL('AC_' .. class .. '_KILLED', criterias.TYPE.KILL_PLAYER_OF_CLASS, {class}))
    end
    ach:SetAllianceOnly()
end

do
    local function _add(category, mapID, mapName, typeName, type, additionalParam, amounts, icon)
        previous = nil
        for _, amount in pairs(amounts) do
            local name, desc
            if amount == 1 then
                name = loc:Get('AN_' .. mapName .. '_' .. typeName)
                desc = loc:Get('AD_' .. mapName .. '_' .. typeName)
            else
                name = loc:Get('AN_' .. mapName .. '_' .. typeName .. 'S', amount)
                desc = loc:Get('AD_' .. mapName .. '_' .. typeName .. 'S', amount)
            end
            ach = category:CreateAchievement(name, desc, 10, icon)
            local params = {mapID}
            if additionalParam then params[2] = additionalParam end
            if amount == 1 then desc = nil end
            ach:AddCriteria(criterias:Create(desc, type, params, amount))
            if previous then previous:SetNext(ach) end
            previous = ach
        end
        return ach
    end

    local function add(category, mapID, mapName, icon)
        return _add(category, mapID, mapName, 'WIN', criterias.TYPE.BATTLEFIELD_WINS, nil, {1, 5, 10, 25, 50}, icon)
    end

    add(alterac, alteracID, 'ALTERAC', '-Spell_Frost_Frostbrand')
    add(warsong, warsongID, 'WARSONG', '-Inv_Axe_16')
    add(arathi, arathiID, 'ARATHI', '-Inv_Sword_39')

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(alterac, alteracID, 'ALTERAC', typeName, type, additionalParam, amounts, icon)
    end

    add('KILLING_BLOW', criterias.TYPE.BATTLEFIELD_SCORE_MAX, 1, {10, 25, 50, 100}, '-Spell_Shadow_Summonimp')
    add('GRAVEYARD_ASSAULT', criterias.TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3, 4}, '-Spell_Holy_Divinespirit')
    add('GRAVEYARD_DEFEND', criterias.TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 5, 8}, '-Spell_Holy_Prayerofspirit')
    add('TOWER_ASSAULT', criterias.TYPE.BATTLEFIELD_STAT_MAX, 3, {1, 2, 3, 4}, '-Ability_Thunderbolt')
    add('TOWER_DEFEND', criterias.TYPE.BATTLEFIELD_STAT_MAX, 4, {1, 2, 4, 6}, '-Inv_Shield_05')
    add('MINE_CAPTURE', criterias.TYPE.BATTLEFIELD_STAT_MAX, 5, {1, 2, 3, 4}, '-Inv_Pick_01')

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(warsong, warsongID, 'WARSONG', typeName, type, additionalParam, amounts, icon)
    end

    add('KILL', criterias.TYPE.BATTLEFIELD_SCORE_MAX, 2, {10, 25, 50, 75}, '-Ability_Rogue_Eviscerate')
    add('FLAG_CAPTURE', criterias.TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3}, '-Inv_Banner_03')
    add('FLAG_RETURN', criterias.TYPE.BATTLEFIELD_STAT_MAX, 2, {1, 3, 5}, '-Spell_Nature_Reincarnation')

    add = function(typeName, type, additionalParam, amounts, icon)
        return _add(arathi, arathiID, 'ARATHI', typeName, type, additionalParam, amounts, icon)
    end

    add('BASE_ASSAULT', criterias.TYPE.BATTLEFIELD_STAT_MAX, 1, {1, 2, 3, 4}, '-Ability_Eyeoftheowl')
    add('BASE_DEFEND', criterias.TYPE.BATTLEFIELD_STAT_MAX, 2, {1, 2, 4, 6}, '-Inv_Shield_06')

    add = function(typeName, type, param, amounts, icon)
        return _add(pvp, param, 'BGS', typeName, type, nil, amounts, icon)
    end

    add('KILLING_BLOW', criterias.TYPE.BATTLEFIELDS_SCORE, 1, {100, 250, 500, 750, 1000}, '-Spell_Shadow_Unholyfrenzy')
    add('KILL', criterias.TYPE.BATTLEFIELDS_SCORE, 2, {100, 250, 500, 750, 1000}, '-Ability_Warrior_Innerrage')
end

local exploration = tab:CreateCategory('CATEGORY_EXPLORATION', nil, true)

local exploreAzeroth = exploration:CreateAchievement('AN_EXPLORE_AZEROTH', 'AD_EXPLORE_AZEROTH', 30, '-Inv_Misc_Map_01', true)
local explorationKalimdor = tab:CreateCategory('CATEGORY_KALIMDOR', exploration.id, true)
local explorationEasternKingdoms = tab:CreateCategory('CATEGORY_EASTERN_KINGDOMS', exploration.id, true)

do
    local global = exploration:CreateAchievement('AN_EXPLORE_KALIMDOR', 'AD_EXPLORE_KALIMDOR', 20, string.lower('kalimdor'), true)
    local function add(areaID, areaIDs, icon)
        local areaName = AreaTableLocale[areaID]
        ach = explorationKalimdor:CreateAchievement(areaName, loc:Get('AD_EXPLORE', areaName), 10, icon or string.lower(AreaTable[areaID][3]))
        for _, childrenID in pairs(areaIDs) do
            if childrenID < 0 then
                ach:AddCriteria(criterias:Create(AreaTableLocale[-childrenID] .. ' (' .. loc:Get('NOT_WORKING') .. ')', criterias.TYPE.NOT_WORKING))
            else
                ach:AddCriteria(criterias:Create(AreaTableLocale[childrenID], criterias.TYPE.EXPLORE_AREA, {childrenID}))
            end
        end
        global:AddCriteria(criterias:Create(ach.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    end

    add(331, {441, 414, 2301, 413, 417, 416, 424, 415, 421, 418, 426, 419, -431, 422, 438, 430, 434, 437})
    add(16, {1228, 1230, 2497, 1229, 1226, 1219, 1220, 1225, 1216, 1237, 1236, 1235, 1221, 1231, 1232, 1234, 1256, 1233, 1227})
    add(148, {443, 444, 456, 446, 447, 448, 450, 449, 442})
    add(405, {608, 603, 599, 2407, 609, 2405, 607, 596, 2408, 606, 602, 604, 2198, 2406, 2404})
    add(14, {367, 366, 368, 372, 362, 816, 369, 370, 817, 1637, 363})
    add(15, {502, 496, 2302, 509, 511, 2079, 513}, 'dustwallow')
    add(361, {1998, 1762, 2618, 1767, 1765, 1766, 2481, 1763, 2479, 2480, 2478, 1761})
    add(357, {1137, 1111, 1114, 1113, 1108, 1119, 1105, 2577, 2522, 1106, 1099, 1101, 1103, 1100, 1121, 1120})
    add(493, {656}, '-Spell_Arcane_TeleportMoonglade')
    add(215, {818, 220, 396, 222, 360, 821, 820, 224, 404, 397, 819, 225, 1638, 398})
    add(1377, {3425, 2743, 2744, 2737, 2740})
    add(406, {2537, 2539, 1076, 2540, 2541, 461, 460, 465, 464, 467, 2538}, 'stonetalon')
    add(440, {979, 976, 977, 1937, 1336, 986, 1939, 985, 982, 1938, 1940, 983, 984, 981, 992, 987, 980, 990, 2300, 978})
    add(141, {736, 186, 261, 259, 478, 260, 264, 266, 1657, 702, 188}, 'darnassus')
    add(17, {382, 1703, 384, 383, 386, 1702, 1704, 379, 1699, 380, 388, 392, 391, 385, 1697, 387, 1700, 1698, 378, 390, 1701, 359, 1717, 1316, 381}, 'barrens')
    add(400, {2097, 483, 484, 481, 2303, 439, 480, 482, 485}, 'thousand_needles')
    add(490, {543, 539, 540, 1942, 1943, 538, 537}, 'ungoro')
    add(618, {2243, 2251, 2253, 2245, 2255, 2250, 2247, 2244, 2242, 2241, 2249, 2256, 2246})
    exploreAzeroth:AddCriteria(criterias:Create(global.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {global.id}))

    global = exploration:CreateAchievement('AN_EXPLORE_EASTERN_KINGDOMS', 'AD_EXPLORE_EASTERN_KINGDOMS', 20, string.lower('eastern_kingdoms'), true)
    add = function(areaID, areaIDs, icon)
        local areaName = AreaTableLocale[areaID]
        ach = explorationEasternKingdoms:CreateAchievement(areaName, loc:Get('AD_EXPLORE', areaName), 10, icon or string.lower(AreaTable[areaID][3]))
        for _, childrenID in pairs(areaIDs) do
            if childrenID < 0 then
                ach:AddCriteria(criterias:Create(AreaTableLocale[-childrenID] .. ' (' .. loc:Get('NOT_WORKING') .. ')', criterias.TYPE.NOT_WORKING))
            else
                ach:AddCriteria(criterias:Create(AreaTableLocale[childrenID], criterias.TYPE.EXPLORE_AREA, {childrenID}))
            end
        end
        global:AddCriteria(criterias:Create(ach.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {ach.id}))
    end

    add(36, {1679, 282, 279, 1682, 1357, 1677, 1683, 278, 1681, 281, 1678, 280, 1680, 284, 1684}, 'alterac_mountains')
    add(45, {313, 334, 1857, 1858, 327, 324, 880, 335, 320, 316, 317, 336, 315, 314, 321, 333}, 'arathi')
    add(3, {342, 339, 1879, 345, 337, 344, 1878, 340, 338, 1877, 346, 1898, 341, 1897})
    add(4, {1457, 1438, 1440, 72, 1441, 1439, 73, 2517, 1437}, 'blasted_lands')
    add(46, {2418, 249, 2417, 2420, 253, 250, 2421, 252, 254, 255}, 'burning_steppes')
    add(41, {2561, 2562, 2697}, 'deadwind_pass')
    add(1, {801, 800, -131, 802, 804, 138, 212, 803, 808, 134, 137, 135, 136, -77, 211, 806, 809, 133}, 'dun_morogh')
    add(10, {536, 94, 492, 93, 856, 245, 242, 241, 121, 42, 1098, 799, 1097})
    add(139, {2260, 2261, 2263, 2258, 2262, 2622, 2264, 1234, 2266, 2268, 2623, 2270, 2271, 2624, 2272, 2273, 2275, 2276, 2627, 2277, 2279, 2619}, 'eastern_plaguelands')
    add(12, {87, 9, 1519, 57, 797, 60, 62, 91, 798, 88, 86, 18}, 'elwynn_forest')
    add(267, {272, 1056, 290, 275, 294, 289, 286, 271, 288, 295, 896, 285}, 'hillsbrad')
    add(38, {146, 143, 149, 838, 147, 142, 936, 144, 923, 924, 556}, 'loch_modan')
    add(44, {68, 1002, 1001, 95, 97, 70, 997, 996, 71, 1000, 69}, 'redridge_mountains')
    add(51, {246, 1957, 1444, 1958, 247, 1959, 1442}, 'searing_gorge')
    add(130, {927, 240, 226, 928, 172, 237, 228, 213, 229, 233, 236, 204, 230, 231, 238}, 'silverpine_forest')
    add(33, {100, 117, 99, 101, 43, 1738, 1737, 1739, 311, 477, 310, 128, 1741, 103, 127, 129, 105, 1740, 37, 125, 123, 104, 122, 102, 297, 19, 35}, 'stranglethorn_valley')
    add(8, {116, 657, 1780, 1798, 75, 74, 1797, 1778, 76, 300, 1777}, 'swamp_of_sorrows')
    add(47, {1882, 348, 350, 1885, 1883, 353, 1886, 1884, 356, 355, 1917, 351, 307, 354}, 'hinterlands')
    add(85, {156, 154, 810, 157, 166, 811, 164, 159, 165, 162, 459, 167, 812, 160, 1497, 152}, 'tirisfal_glades')
    add(28, {2298, 197, 193, 813, 199, 200, 202, 192, 190, 201, 198, 2620, 2297}, 'western_plaguelands')
    add(40, {107, 108, 916, 109, 918, 111, 917, 113, 219, 20, 115, 921, 922, 920})
    add(11, {1018, 1022, 118, 1024, 1023, 309, 205, 1036, -836, 1025, 1020, 1016, 1017, 1037, 150}, 'wetlands')
    exploreAzeroth:AddCriteria(criterias:Create(global.name, criterias.TYPE.COMPLETE_ACHIEVEMENT, {global.id}))
end

do
    ach = featsOfStrength:CreateAchievement('AN_SULFURAS', 'AD_SULFURAS', 0, '-Inv_Hammer_Unique_Sulfuras', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.OBTAIN_ITEM, {17182}))

    ach = featsOfStrength:CreateAchievement('AN_THUNDER_FURY', 'AD_THUNDER_FURY', 0, '-Inv_Sword_39', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.OBTAIN_ITEM, {19019}))

    ach = featsOfStrength:CreateAchievement('AN_BLACK_SCARAB', 'AD_BLACK_SCARAB', 0, '-Inv_Misc_QirajiCrystal_05', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.OBTAIN_ITEM, {21176}))

    ach = featsOfStrength:CreateAchievement('AN_RED_SCARAB', 'AD_RED_SCARAB', 0, '-Inv_Misc_QirajiCrystal_02', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.OBTAIN_ITEM, {21321}))

    ach = featsOfStrength:CreateAchievement('AN_ATIESH', 'AD_ATIESH', 0, '-Inv_Staff_Medivh', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.ATIESH))
end

do
    ach = general:CreateAchievement('AN_UNARMED_SKILL', 'AD_UNARMED_SKILL', 10, '-Ability_GolemThunderClap', true)
    ach:AddCriteria(criterias:Create(nil, criterias.TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsSkills.UNARMED[1], 300}))

    local function add(previous, qualityName, quality, icon)
        local ach = general:CreateAchievement('AN_' .. qualityName .. '_GEAR', 'AD_' .. qualityName .. '_GEAR', 10, icon, true)
        for idx, name in pairs(criterias.GEAR_SLOT) do
            ach:AddCriteria(criterias:CreateL('GEAR_SLOT_' .. name, criterias.TYPE.GEAR_QUALITY, {idx, quality}))
        end
        if previous then previous:SetNext(ach) end
        return ach
    end

    ach = add(nil, 'UNCOMMON', 2, '-Inv_Enchant_EssenceNetherSmall')
    ach = add(ach, 'RARE', 3, '-Spell_Frost_WizardMark')
    ach = add(ach, 'EPIC', 4, '-Inv_Enchant_ShardNexusLarge')
end

-- local events = tab:CreateCategory('CATEGORY_EVENTS', nil, true)

CA_CompletionManager:PostLoad(db:GetTab(db.TAB_ID_PLAYER):GetCategories())