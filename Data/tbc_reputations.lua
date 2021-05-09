local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local reputations = L:GetCategoryByID(10)

local tbcReputations = L:Category()
:Name('CATEGORY_TBC', true)
:Parent(reputations)
:Build()

previous = L:GetAchievementByID(129)
for i, count in pairs({25, 30, 35}) do
    local j = i + 7
    previous = L:Achievement(reputations, 10, 'reps_' .. (j - 2))
    :NameDesc(loc:Get('AN_REPS_MORE', count), loc:Get('AD_REPS', count))
    :Criteria(TYPE.REACH_ANY_REPUTATION, {8}, count):Name(loc:Get('AC_REPS', count)):Build()
    :Previous(previous)
    :Build()
end

local builder = L:Achievement(tbcReputations, 20, '-Spell_Fire_FelfireWard')
:NameDesc('AN_TBC_DUNGEON_REPUTATIONS', 'AD_TBC_DUNGEON_REPUTATIONS', true)
for _, factionID in pairs({947, 942, 1011, 989, 935}) do
    builder:Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Name('FACTION_' .. factionID, true):Build()
end
builder:Build():SetHordeOnly()

builder = L:Achievement(tbcReputations, 20, '-Spell_Fire_FelfireWard')
:NameDesc('AN_TBC_DUNGEON_REPUTATIONS', 'AD_TBC_DUNGEON_REPUTATIONS', true)
for _, factionID in pairs({946, 942, 1011, 989, 935}) do
    builder:Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Name('FACTION_' .. factionID, true):Build()
end
builder:Build():SetAllianceOnly()

local function create(factionName, factionID, icon, points)
    return L:Achievement(tbcReputations, points or 10, icon or factionName)
    :NameDesc('AN_' .. string.upper(factionName), 'AD_' .. string.upper(factionName), true)
    :Criteria(TYPE.REACH_REPUTATION, {factionID, 8}):Build()
    :Build()
end

L:Achievement(tbcReputations, 10, '-Spell_Arcane_PortalShattrath')
:NameDesc('AN_SHATTRATH_REP', 'AD_SHATTRATH_REP', true)
:Criteria(TYPE.OR, {
    L:Criteria(TYPE.REACH_REPUTATION, {932, 8}):Build(),
    L:Criteria(TYPE.REACH_REPUTATION, {934, 8}):Build()
}):Build()
:Build()
create('ogrila', 1038, '-Inv_Misc_Apexis_Crystal')
create('sporeggar', 970, '-Inv_Mushroom_11')
create('consortium', 933, '-Inv_Enchant_ShardPrismaticLarge')
create('maghar', 941, '-Inv_Misc_Foot_Centaur', 15):SetHordeOnly()
create('kurenai', 978, '-Inv_Misc_Foot_Centaur', 15):SetAllianceOnly()
create('netherwings', 1015, '-Ability_Mount_NetherdrakePurple'):SetUnavailable() -- P2
L:Achievement(tbcReputations, 10, '-Ability_Mount_NetherdrakePurple')
:NameDesc('AN_SKYSHATTERED', 'AD_SKYSHATTERED', true)
:Criteria(TYPE.COMPLETE_QUEST, {11071}):Build()
:Build()
:SetUnavailable() -- P2
create('amethyst_eye', 967, '-Spell_Holy_Mindsooth'):SetUnavailable() -- P3
create('scale_of_the_sands', 990, '-Inv_Enchant_DustIllusion'):SetUnavailable() -- P4
create('ashtongue_deathsworn', 1012):SetUnavailable() -- P4
create('shattered_sun', 1077, '-Inv_Shield_48'):SetUnavailable() -- P5

L:GetAchievementByID(130):AddCriteria(L:Criteria(TYPE.REACH_REPUTATION, {911, 8}):Name('AC_HORDE_REPS_5', true):Build())
L:GetAchievementByID(131):AddCriteria(L:Criteria(TYPE.REACH_REPUTATION, {930, 8}):Name('AC_ALLIANCE_REPS_5', true):Build())
