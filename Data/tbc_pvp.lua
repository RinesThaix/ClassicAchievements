local tab = CA_Database:GetTab(CA_Database.TAB_ID_PLAYER)
local L = CA_Loader:ForTab(tab)
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')
local ach, previous

local pvp = L:GetCategoryByName('PvP')
local bgEye = L:GetCategoryByID(26)
local bgEyeID = 1956
local openWorldPVP = L:GetCategoryByID(27)
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

L:Call('riding')
L:Call('attunes')
L:Call('bg_eye')

local function flagCapture(count, prev)
    local desc
    if count == 1 then
        desc = loc:Get('AD_EYE_CAPTURE')
    else
        desc = loc:Get('AD_EYE_CAPTURES', count)
    end
    local builder = L:Achievement(bgEye, 10, 'bg_eye_flag_capture')
    :Name('AN_EYE_CAPTURE', true)
    :Desc(desc)
    :Criteria(TYPE.BATTLEFIELD_STAT_MAX, {bgEyeID, 1}, count):Name(desc):Build()
    if prev then builder:Previous(prev) end
    return builder:Build()
end
ach = flagCapture(1)
ach = flagCapture(2, ach)
ach = flagCapture(3, ach)

L:Achievement(bgEye, 10, '-Spell_Arcane_MassDispel')
:NameDesc('AN_EYE_GLORY', 'AD_EYE_GLORY', true)
:Criteria(TYPE.BG_EYE_GLORY, {}):Build()
:Build()

L:Achievement(bgEye, 10, '-Spell_Nature_BloodLust')
:NameDesc('AN_EYE_BERSERK', 'AD_EYE_BERSERK', true)
:Criteria(TYPE.BG_EYE_BERSERK, {}):Build()
:Build()

L:Achievement(bgEye, 10, 'bg_eye_ideal_victory')
:NameDesc('AN_EYE_IDEAL_VICTORY', 'AD_EYE_IDEAL_VICTORY', true)
:Criteria(TYPE.BG_POINTS, {bgEyeID, 1500, 0}):Build()
:Build()

L:Achievement(bgEye, 10, 'bg_eye_fast_win')
:NameDesc('AN_EYE_FAST_WIN', 'AD_EYE_FAST_WIN', true)
:Criteria(TYPE.BATTLEFIELD_FAST_WIN, {bgEyeID}):Build()
:Build()

local ach = L:Achievement(bgEye, 10, '-Spell_Nature_EyeoftheStorm')
:NameDesc('AN_EYE_BOSS', 'AD_EYE_BOSS', true)
:CompleteAchievementCriteria(488)
:CompleteAchievementCriteria(491)
:CompleteAchievementCriteria(492)
:CompleteAchievementCriteria(493)
:CompleteAchievementCriteria(494)
:CompleteAchievementCriteria(495)
:Build()

L:GetAchievementByID(354):AddCriteria(L:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {ach.id}):Name(ach.name):Build())