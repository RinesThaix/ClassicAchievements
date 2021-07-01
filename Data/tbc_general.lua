local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local ach, previous

local general = L:GetCategoryByName('CATEGORY_GENERAL', true)

L:Achievement(general, 10, 'level_70')
:Name('AN_LVL', true, 70)
:Desc('AD_LVL', true, 70)
:Criteria(TYPE.REACH_LEVEL, {70}):Build()
:Previous(L:GetAchievementByID(6))
:Build()

L:GetAchievementByID(159):AddCriteria(L:Criteria(TYPE.KILL_PLAYER_OF_RACE, {'DRAENEI'}):Name('AC_DRAENEI_KILLED', true):Build())
L:GetAchievementByID(160):AddCriteria(L:Criteria(TYPE.KILL_PLAYER_OF_RACE, {'BLOODELF'}):Name('AC_BLOODELF_KILLED', true):Build())
L:GetAchievementByID(161):AddCriteria(L:Criteria(TYPE.KILL_PLAYER_OF_CLASS, {'SHAMAN'}):Name('AC_SHAMAN_KILLED', true):Build())
L:GetAchievementByID(162):AddCriteria(L:Criteria(TYPE.KILL_PLAYER_OF_CLASS, {'PALADIN'}):Name('AC_PALADIN_KILLED', true):Build())

L:Delay('riding', function()
    local function riding(icon, skillPoints, previous)
        local builder = L:Achievement(general, 10, icon)
        :Name('AN_RIDING_' .. skillPoints, true)
        :Desc('AD_RIDING_' .. skillPoints, true)
        :Criteria(TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsSkills.RIDING[1], skillPoints}):Build()
        if previous then builder:Previous(previous) end
        return builder:Build()
    end
    ach = nil
    for _, data in pairs({
        {'-Ability_Mount_RidingHorse', 75},
        {'-Ability_Mount_BlackPanther', 150},
        {'-Ability_Mount_Gryphon_01', 225},
        {'-Ability_Mount_RocketMount', 300}
    }) do ach = riding(data[1], data[2], ach) end
end)