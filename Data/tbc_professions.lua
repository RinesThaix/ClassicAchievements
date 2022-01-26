local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local profs = L:GetCategoryByName('CATEGORY_PROFESSIONS', true)

local cooking = L:GetCategoryByID(17)
local a1 = L:Achievement(cooking, 10, 'profs_cooking')
:NameDesc('AN_COOKING_OUTLAND_MASTER', 'AD_COOKING_OUTLAND_MASTER', true)
:Criteria(TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.COOKING[1], 375}):Build()
:Previous(L:GetAchievementByID(120))
:Build()

local fishing = L:GetCategoryByID(18)
local a2 = L:Achievement(fishing, 10, 'profs_fishing')
:NameDesc('AN_FISHING_OUTLAND_MASTER', 'AD_FISHING_OUTLAND_MASTER', true)
:Criteria(TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FISHING[1], 375}):Build()
:Previous(L:GetAchievementByID(119))
:Build()

local firstAid = L:GetCategoryByID(19)
local a3 = L:Achievement(firstAid, 10, '-Inv_Fabric_Wool_01')
:NameDesc('AN_FIRST_AID_OUTLAND_MASTER', 'AD_FIRST_AID_OUTLAND_MASTER', true)
:Criteria(TYPE.REACH_PROFESSION_LEVEL, {ClassicAchievementsProfessions.FIRST_AID[1], 375}):Build()
:Previous(L:GetAchievementByID(118))
:Build()

a1 = L:Achievement(profs, 10, '-Inv_Scroll_04')
:NameDesc('AN_PROFS_SECONDARY_OUTLAND', 'AD_PROFS_SECONDARY_OUTLAND', true)
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {a1.id}):Name(a1.name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {a2.id}):Name(a2.name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {a3.id}):Name(a3.name):Build()
:Previous(L:GetAchievementByID(121))
:Build()

L:Achievement(profs, 10, '-Inv_Misc_Note_01')
:NameDesc('AN_PROFS_ONE_OUTLAND', 'AD_PROFS_ONE_OUTLAND', true)
:Criteria(TYPE.REACH_MAIN_PROFESSION_LEVEL, {375}):Build()
:Previous(L:GetAchievementByID(116))
:Build()

a2 = L:Achievement(profs, 10, '-Inv_Misc_Note_02')
:NameDesc('AN_PROFS_TWO_OUTLAND', 'AD_PROFS_TWO_OUTLAND', true)
:Criteria(TYPE.REACH_MAIN_PROFESSION_LEVEL, {375}, 2):Name('AC_PROFS_TWO_OUTLAND', true):Build()
:Previous(L:GetAchievementByID(117))
:Build()

L:Achievement(profs, 10, '-Spell_Magic_GreaterBlessingOfKings')
:NameDesc('AN_PROFS_FIVE_OUTLAND', 'AD_PROFS_FIVE', true)
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {a2.id}):Name(a2.name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {a1.id}):Name(a1.name):Build()
:Previous(L:GetAchievementByID(122))
:Build()

a1 = L:Achievement(firstAid, 10, '-Inv_Misc_Bandage_Netherweave')
:NameDesc('AN_STOCKING_UP_OUTLAND', 'AD_STOCKING_UP_OUTLAND', true)
:Criteria(TYPE.CRAFT_ITEM, {21991}, 100):Name('AC_STOCKING_UP_OUTLAND', true):Build()
:Build()

L:Achievement(firstAid, 10, '-Inv_Misc_Bandage_Netherweave_Heavy')
:NameDesc('AN_STOCKING_UP_2_OUTLAND', 'AD_STOCKING_UP_2_OUTLAND', true)
:Criteria(TYPE.CRAFT_ITEM, {21991}, 500):Name('AC_STOCKING_UP_2_OUTLAND', true):Build()
:Previous(a1)
:Build()

L:Achievement(fishing, 10, '-Inv_Misc_Fish_14')
:NameDesc('AN_MR_PINCHY', 'AD_MR_PINCHY', true)
:Criteria(TYPE.FISH_AN_ITEM, {27388}):Build()
:Build()

local builder = L:Achievement(fishing, 10, '-Inv_Misc_Fish_37')
:NameDesc('AN_FISHING_OUTLAND_COLLECTION', 'AD_FISHING_OUTLAND_COLLECTION', true)

for _, itemID in pairs({35285, 27422, 27439, 27438, 27437, 27429, 27425, 27435, 33824, 33823, 35286}) do
    builder:Criteria(TYPE.FISH_AN_ITEM, {itemID}):ItemName(itemID):Build()
end

builder:Build()

do
    local function create(name, icon, itemID, count)
        local ach = L:Achievement(cooking, 10, icon)
        :Name('AN_COOKING_' .. name, true)
        :Desc('create itemID ' .. itemID)
        :Criteria(TYPE.CRAFT_ITEM, {itemID}, count):Name(loc:Get('AC_COOKING_CREATE', count)):Build()
        :Build()
        local item = Item:CreateFromItemID(itemID)
        item:ContinueOnItemLoad(function()
            ach.description = loc:Get('AD_COOKING_CREATE', item:GetItemName(), count)
        end)
        return ach
    end

    create('FISHERMANS_FEAST', '-Inv_Misc_Food_88_RavagerNuggets', 33052, 100)
    create('SPICY_HOT_TALBUK', '-Inv_Misc_Food_84_RoastcleftHoof', 33872, 100)
    create('SKULLFISH_SOUP', '-Inv_Misc_Food_63', 33825, 100)
    create('RAVAGER_DOG', '-Inv_Misc_Food_53', 27655, 100)
end