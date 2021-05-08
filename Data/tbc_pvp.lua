local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local pvp = L:GetCategoryByName('PvP')

local bgEye = L:Category()
:Name('CATEGORY_BG_EYE', true)
:Parent(pvp)
:Build()
