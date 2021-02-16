if true then return end

local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_GUILD), 15000)
local TYPE = CA_Criterias.TYPE
local ach, previous

local general = L:Category():Name('CATEGORY_GENERAL', true):Build()
local featsOfStrength = L:Category(15099):Name('CATEGORY_FEATS_OF_STRENGTH', true):Build()
local pve = L:Category():Name('PvE'):Build()
