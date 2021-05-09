local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local ach, previous

local pve = L:GetCategoryByName('CATEGORY_PVE', true)
local instances = L:GetCategoryByName('CATEGORY_VANILLA', true)

local pvp = L:GetCategoryByName('PvP')
local openWorldPVP = L:GetCategoryByID(26)
local alterac = L:GetCategoryByName('CATEGORY_BG_ALTERAC', true)
local alteracID = 1459
local warsong = L:GetCategoryByName('CATEGORY_BG_WARSONG', true)
local warsongID = 1460
local arathi = L:GetCategoryByName('CATEGORY_BG_ARATHI', true)
local arathiID = 1461

local exploration = L:GetCategoryByName('CATEGORY_EXPLORATION', true)

local featsOfStrength = L:GetCategoryByID(99)

ach = L:Achievement(pvp, 10, 'duels')
:NameDesc('AN_DUEL', 'AD_DUEL', true)
:Criteria(TYPE.DUELS):Build()
:Build()

for _, wins in pairs({10, 25, 100}) do
    ach = L:Achievement(pvp, 10, 'duels')
            :Name('AN_DUELS_' .. wins, true)
            :Desc('AD_DUELS', true, wins)
            :Criteria(TYPE.DUELS, nil, wins):Name('AC_DUELS', true, wins):Build()
            :Previous(ach)
            :Build()
end

ach = L:Achievement(openWorldPVP, 10, '-Inv_Misc_ArmorKit_14')
:NameDesc('AN_GURUBASHI_1', 'AD_GURUBASHI_1', true)
:Criteria(TYPE.COMPLETE_QUEST, {7810}):Build()
:Build()
ach.priority = 2

L:Achievement(openWorldPVP, 10, '-Inv_Misc_ArmorKit_04')
:NameDesc('AN_GURUBASHI_2', 'AD_GURUBASHI_2', true)
:Criteria(TYPE.OBTAIN_ITEM, {19024}):Build()
:Previous(ach)
:Build()
.priority = 2

ach = nil
for _, bgs in pairs({10, 50, 100}) do
    ach = L:Achievement(pvp, 10, '-Inv_Musket_02')
            :Name('AN_PARTICIPATE_IN_BGS', true)
            :Desc('AD_PARTICIPATE_IN_BGS', true, bgs)
            :Criteria(TYPE.BATTLEFIELD_MAX_LEVEL_PARTICIPATION, nil, bgs):Name('AC_PARTICIPATE_IN_BGS', true, bgs):Build()
            :Previous(ach)
            :Build()
end

ach = L:Achievement(exploration, 20, 'love')
:NameDesc('AN_LOVE', 'AD_LOVE', true)
for _, creatureID in pairs({3444, 620, 1420, 13321, 2620, 9600, 5951, 9699, 4953, 721, 9700, 15476, 2914, 16030, 4075, 1412, 7390, 15475, 15010, 4076, 13016, 14881, 2110, 4166, 1933, 890, 2098, 2442, 6368, 10582, 385, 10685, 3300}) do
    ach:Criteria(TYPE.EMOTE, {'LOVE', creatureID}):Name('NPC_' .. creatureID, true):Build()
end
ach:Build().priority = 1

L:Achievement(arathi, 10, 'arathi_cats')
:NameDesc('AN_ARATHI_CATS', 'AD_ARATHI_CATS', true)
:Criteria(TYPE.EMOTE, {'PAT', 15071}):Name('NPC_15071', true):Build()
:Criteria(TYPE.EMOTE, {'PAT', 15066}):Name('NPC_15066', true):Build()
:Build()

L:Achievement(alterac, 10, 'alterac_fast_win')
:NameDesc('AN_ALTERAC_FAST_WIN', 'AD_ALTERAC_FAST_WIN', true)
:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {alteracID}):Build()
:Build()

L:Achievement(warsong, 10, 'warsong_fast_win')
:NameDesc('AN_WARSONG_FAST_WIN', 'AD_WARSONG_FAST_WIN', true)
:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {warsongID}):Build()
:Build()

L:Achievement(arathi, 10, 'arathi_fast_win')
:NameDesc('AN_ARATHI_FAST_WIN', 'AD_ARATHI_FAST_WIN', true)
:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {arathiID}):Build()
:Build()

local function add(category, mapID, statID, name, icon, count)
    L:Achievement(category, 10, icon)
    :Name('AN_' .. name .. '_TOTAL', true)
    :Desc('AD_' .. name .. '_TOTAL', true, count)
    :Criteria(TYPE.BATTLEFIELD_STAT, {mapID, statID}, count):Name('AD_' .. name .. '_TOTAL', true, count):Build()
    :Build()
end

add(alterac, alteracID, 4, 'ALTERAC_TOWER_DEFEND', 'alterac_towers', 50)
add(alterac, alteracID, 1, 'ALTERAC_GRAVEYARD_ASSAULT', 'arathi_graveyards', 50)
add(warsong, warsongID, 1, 'WARSONG_FLAG_CAPTURE', 'warsong_flags', 50)
add(warsong, warsongID, 2, 'WARSONG_FLAG_RETURN', 'warsong_returns', 50)
add(arathi, arathiID, 1, 'ARATHI_BASE_ASSAULT', 'arathi_flags', 50)
add(arathi, arathiID, 2, 'ARATHI_BASE_DEFEND', 'arathi_defends', 50)

L:Achievement(alterac, 10, '-Inv_Misc_Horn_01')
:NameDesc('AN_ALTERAC_MOUNT_HORDE', 'AD_ALTERAC_MOUNT_HORDE', true)
:Criteria(TYPE.OBTAIN_ITEM, {19029}):Build()
:Build():SetHordeOnly()

L:Achievement(alterac, 10, '-Ability_Mount_MountainRam')
:NameDesc('AN_ALTERAC_MOUNT_ALLIANCE', 'AD_ALTERAC_MOUNT_ALLIANCE', true)
:Criteria(TYPE.OBTAIN_ITEM, {19030}):Build()
:Build():SetAllianceOnly()

local function add(category, name, icon, ids)
    ach = L:Achievement(category, 10, icon)
            :NameDesc('AN_' .. name, 'AD_' .. name, true)
    for _, id in pairs(ids) do ach:CompleteAchievementCriteria(id) end
    return ach:Build()
end

local alteracBoss = add(alterac, 'ALTERAC_BOSS', '-Inv_Sword_03', {167, 181, 183, 187, 191, 195, 199, 340, 343, 344})
local warsongBoss = add(warsong, 'WARSONG_BOSS', 'warsong_master', {172, 205, 208, 210, 341, 345, 346})
local arathiBoss = add(arathi, 'ARATHI_BOSS', '-Inv_Sword_56', {177, 215, 218, 339, 342, 347, 348})

L:Achievement(pvp, 20, 'battlemaster')
:NameDesc('AN_BATTLEMASTER', 'AD_BATTLEMASTER', true)
:CompleteAchievementCriteria(alteracBoss)
:CompleteAchievementCriteria(warsongBoss)
:CompleteAchievementCriteria(arathiBoss)
:Reward('AR_BATTLEMASTER', true)
:Build()

L:Achievement(instances, 20, 'drake_red')
:NameDesc('AN_LEEROY', 'AD_LEEROY', true)
:Criteria(TYPE.SPECIAL, {1}):Build()
:Reward('AR_LEEROY', true)
:Build()

L:Achievement(instances, 20, 'drake_twilight')
:NameDesc('AN_BWL_DUO', 'AD_BWL_DUO', true)
:Criteria(TYPE.SPECIAL, {2}):Build()
:Build()

L:Achievement(instances, 10, 'anubrekhan_without_mobs')
:NameDesc('AN_ANUBREKHAN_WITHOUT_MOBS', 'AD_ANUBREKHAN_WITHOUT_MOBS', true)
:Criteria(TYPE.BOSS_WITHOUT_MOBS, {15956}):Build()
:Build()

L:Achievement(instances, 10, 'faerlina_without_mobs')
:NameDesc('AN_FAERLINA_WITHOUT_MOBS', 'AD_FAERLINA_WITHOUT_MOBS', true)
:Criteria(TYPE.BOSS_WITHOUT_MOBS, {15953}):Build()
:Build()

L:Achievement(instances, 10, 'arachnophobia')
:NameDesc('AN_ARACHNOPHOBIA', 'AD_ARACHNOPHOBIA', true)
:Criteria(TYPE.SPECIAL, {3}):Build()
:Build()

L:Achievement(instances, 10, 'four_together')
:NameDesc('AN_FOUR_TOGETHER', 'AD_FOUR_TOGETHER', true)
:Criteria(TYPE.SPECIAL, {4}):Build()
:Build()

L:Achievement(instances, 20, 'sapphirone_with_all_alive')
:NameDesc('AN_SAPPHIRONE_WITH_ALL_ALIVE', 'AD_SAPPHIRONE_WITH_ALL_ALIVE', true)
:Criteria(TYPE.BOSS_WITH_ALL_ALIVE, {15989}):Build()
:Build()

L:Achievement(featsOfStrength, 0, '-Inv_Helmet_47')
:NameDesc('AN_THANKS', 'AD_THANKS', true)
:Criteria(TYPE.SPECIAL, {5}):Build()
:Reward('AR_THANKS', true)
:Build()