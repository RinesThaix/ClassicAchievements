local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local pve = L:GetCategoryByID(5)

local tbcInstances = L:Category(7)
:Name('CATEGORY_TBC', true)
:Parent(pve)
:Build()

-- DUNGEONS

local function preBuilder(zoneName, bossIDs, isHeroic)
    local points
    if isHeroic then points = 20
    else points = 10 end

    local builder = L:Achievement(tbcInstances, points, zoneName)

    local upperZoneName = string.upper(zoneName)
    local achievementName = loc:Get('AN_' .. upperZoneName)
    local achievementDesc = loc:Get('AD_' .. upperZoneName)
    if isHeroic then
        builder:NameDesc(loc:Get('HEROIC_NAME_PATTERN', achievementName), loc:Get('HEROIC_DESCRIPTION_PATTERN', achievementDesc) .. '.')
        if type(bossIDs) == 'table' then
            for _, bossID in pairs(bossIDs) do
                builder:Criteria(TYPE.KILL_NPC_HEROIC, {bossID}):Name('AC_BOSS_' .. bossID, true):Build()
            end
        else
            builder:Criteria(TYPE.KILL_NPC_HEROIC, {bossIDs}):Build()
        end
    else
        builder:NameDesc(achievementName, achievementDesc .. '.')
        if type(bossIDs) == 'table' then
            for _, bossID in pairs(bossIDs) do
                builder:Criteria(TYPE.KILL_NPC, {bossID}):Name('AC_BOSS_' .. bossID, true):Build()
            end
        else
            builder:Criteria(TYPE.KILL_NPC, {bossIDs}):Build()
        end
    end
    return builder
end

do
    local function create(zoneName, bossIDs)
        local normal = preBuilder(zoneName, bossIDs, false):Build()
        local heroic = preBuilder(zoneName, bossIDs, true):Previous(normal):Build()
        return heroic
    end

    local starting = create('hellfire_ramparts', {17308, 17537})
    create('blood_furnace', 17377)
    create('slave_pens', 17942)
    create('underbog', 17882)
    create('mana_tombs', 18344)
    create('auchenai_crypts', 18373)
    create('old_hillsbrad', 18096)
    create('sethekk_halls', 18473)
    create('steamvault', 17798)
    create('shadow_labyrinth', 18708)
    create('shattered_halls', 16808)
    create('black_morass', 17881)
    create('botanica', 17977)
    create('mechanar', 19220)
    local ending = create('arcatraz', 20912)
    
    local builder = L:Achievement(pve, 20, '-Ability_Creature_Cursed_02')
    :NameDesc('AN_TBC_DUNGEONS', 'AD_TBC_DUNGEONS', true)
    
    for i = starting.id, ending.id, 2 do
        builder:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {i}):Name(L:GetAchievementByID(i).name):Build()
    end
    builder:Build()
end

L:Achievement(tbcInstances, 20, '-Inv-Mount_Raven_54')
:NameDesc('AN_RAVEN_LORD', 'AD_RAVEN_LORD', true)
:Criteria(TYPE.OBTAIN_ITEM, {32768}):Build()
:Build()

do

    local karazhan = L:Achievement(tbcInstances, 20, 'karazhan')
    :NameDesc('AN_KARAZHAN', 'AD_KARAZHAN', true)
    :Criteria(TYPE.KILL_NPC, {15690}):Build()
    :Build()

    local gruul = L:Achievement(tbcInstances, 20, 'gruul')
    :NameDesc('AN_GRUUL', 'AD_GRUUL', true)
    :Criteria(TYPE.KILL_NPC, {19044}):Build()
    :Build()

    local magtheridon = L:Achievement(tbcInstances, 20, 'magtheridon')
    :NameDesc('AN_MAGTHERIDON', 'AD_MAGTHERIDON', true)
    :Criteria(TYPE.KILL_NPC, {17257}):Build()
    :Build()

    L:Achievement(pve, 20, '-Inv_Helmet_90')
    :NameDesc('AN_TBC_PHASE_1', 'AD_TBC_PHASE_1', true)
    :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {karazhan.id}):Name(karazhan.name):Build()
    :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {gruul.id}):Name(gruul.name):Build()
    :Criteria(TYPE.COMPLETE_ACHIEVEMENT, {magtheridon.id}):Name(magtheridon.name):Build()
    :Build()

end

L:Achievement(tbcInstances, 10, 'kazzak')
:NameDesc('AN_WB_KAZZAK_OUTLAND', 'AD_WB_KAZZAK_OUTLAND', true)
:Criteria(TYPE.KILL_NPC, {18728}):Build()
:Build()

L:Achievement(tbcInstances, 10, '-Inv_Misc_EngGizmos_06')
:NameDesc('AN_WB_DOOMWALKER', 'AD_WB_DOOMWALKER', true)
:Criteria(TYPE.KILL_NPC, {17711}):Build()
:Build()
