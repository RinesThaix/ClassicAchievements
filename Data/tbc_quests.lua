local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local ach, previous

local quests = L:GetCategoryByName('CATEGORY_QUESTS', true)

local outlandQuests = L:Category()
:Name('CATEGORY_OUTLAND', true)
:Parent(quests)
:Build()

local function create(zoneName, questIDs)
    local builder = L:Achievement(outlandQuests, 10, zoneName)
    :NameDesc('AN_QUESTS_' .. string.upper(zoneName), 'AD_QUESTS_' .. string.upper(zoneName), true)
    
    for _, questID in pairs(questIDs) do
        if type(questID) == 'table' then
            local first = L:Criteria(TYPE.COMPLETE_QUEST, {questID[1]}):Build()
            local second = L:Criteria(TYPE.COMPLETE_QUEST, {questID[2]}):Build()
            builder:Criteria(TYPE.OR, {first, second}):Name('TBC_QUEST_' .. questID[1], true):Build()
        else
            builder:Criteria(TYPE.COMPLETE_QUEST, {questID}):Name('TBC_QUEST_' .. questID, true):Build()
        end
    end

    return builder:Build()
end

create('hellfire_peninsula', {10388, 10389, 10876, 10258, 9406, 9370, 10351}):SetHordeOnly()
create('hellfire_peninsula', {10397, 10400, 9545, 10935, 10937, 9383, 10630, 10351}):SetAllianceOnly()

create('zangarmash', {9772, 9904, 10118, 9709, 9732, 9788, 9726}):SetHordeOnly()
create('zangarmash', {9803, 9783, 9902, 9709, 9732, 9788, 9726}):SetAllianceOnly()

create('terrokar', {10879, 10881, 10915, 9951, 10043}):SetHordeOnly()
create('terrokar', {10879, 10881, 10915, 9951, 10042}):SetAllianceOnly()

create('nagrand', {10172, 9977, 9853, 9934, 9868, 9937, 9852, 9925}):SetHordeOnly()
create('nagrand', {9955, 9977, 9853, 9933, 9873, 10011, 9852, 9925}):SetAllianceOnly()

create('blades_edge_mtns', {10505, 10742, 10867, 10748}):SetHordeOnly()
create('blades_edge_mtns', {10504, 10671, 10806, 10748}):SetAllianceOnly()

create('netherstorm', {{10409, 10507}, 10240, 10249, 10439, 10221, 10276})

create('shadowmoon', {{10744, 10745}, 11052, {10645, 10639}, {10651, 10692}, 10588, 10679, 10808})

local function create(questIDs)
    local builder = L:Achievement(outlandQuests, 20, 'outland')
    :NameDesc('AN_WISDOM_KEEPER_OUTLAND', 'AD_WISDOM_KEEPER_OUTLAND', true)
    
    for _, achID in pairs(questIDs) do builder:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {achID}):Name(L:GetAchievementByID(achID).name):Build() end
    return builder:Build()
end

local hordeOutlandQuests = create({364, 366, 368, 370, 372, 374, 375})
hordeOutlandQuests:SetHordeOnly()

local allianceOutlandQuests = create({365, 367, 369, 371, 373, 374, 375})
allianceOutlandQuests:SetAllianceOnly()

L:Achievement(quests, 40, '-Inv_Misc_Book_07')
:NameDesc('AN_WISDOM_KEEPER', 'AD_WISDOM_KEEPER', true)
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {48}):Name(L:GetAchievementByID(48).name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {hordeOutlandQuests.id}):Name(hordeOutlandQuests.name):Build()
:Reward('AR_WISDOM_KEEPER', true)
:Build()
:SetHordeOnly()

L:Achievement(quests, 40, '-Inv_Misc_Book_07')
:NameDesc('AN_WISDOM_KEEPER', 'AD_WISDOM_KEEPER', true)
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {48}):Name(L:GetAchievementByID(48).name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {allianceOutlandQuests.id}):Name(allianceOutlandQuests.name):Build()
:Reward('AR_WISDOM_KEEPER', true)
:Build()
:SetAllianceOnly()