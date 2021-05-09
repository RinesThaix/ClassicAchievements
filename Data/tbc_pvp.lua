local tab = CA_Database:GetTab(CA_Database.TAB_ID_PLAYER)
local L = CA_Loader:ForTab(tab)
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local pvp = L:GetCategoryByName('PvP')

local bgEye = L:Category()
:Name('CATEGORY_BG_EYE', true)
:Parent(pvp)
:Build()

local openWorldPVP = L:GetCategoryByID(26)
tab:SkipCategories(1)

local velen = L:Achievement(openWorldPVP, 10, '-Spell_Arcane_TeleportExodar')
:NameDesc('AN_VELEN_SLAYER', 'AD_VELEN_SLAYER', true)
:Criteria(TYPE.KILL_NPC, {17468}):Build()
:Build()
velen:SetHordeOnly()

local lorthemar = L:Achievement(openWorldPVP, 10, '-Spell_Arcane_TeleportSilvermoon')
:NameDesc('AN_LORTHEMAR_SLAYER', 'AD_LORTHERMAR_SLAYER', true)
:Criteria(TYPE.KILL_NPC, {16802}):Build()
:Build()
lorthemar:SetAllianceOnly()

L:GetAchievementByID(153):AddCriteria(L:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {velen.id}):Name(velen.name):Build())
L:GetAchievementByID(158):AddCriteria(L:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {lorthemar.id}):Name(lorthemar.name):Build())