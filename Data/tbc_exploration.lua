local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE
local loc = SexyLib:Localization('Classic Achievements')

local exploration = L:GetCategoryByID(14)

local outlandExploration = L:Category()
:Name('CATEGORY_OUTLAND', true)
:Parent(exploration)
:Build()

local function create(zoneName, zoneID, subzoneIDs)
    local builder = L:Achievement(outlandExploration, 10, zoneName)
    :Name(loc:Get('EXPLORE_OUTLAND_NAME_PATTERN', AreaTableLocale[zoneID]))
    :Desc('AD_EXPLORE_' .. string.upper(zoneName), true)
    for _, subzoneID in pairs(subzoneIDs) do
        builder:Criteria(TYPE.EXPLORE_AREA, {subzoneID}):Name(AreaTableLocale[subzoneID]):Build()
    end
    return builder:Build()
end

local starting = create('hellfire_peninsula', 3483, {3539, 3546, 3554, 3545, 3538, 3555, 3553, 3551, 3552, 3804, 3536, 3547, 3582, 3556, 3797, 3802, 3796, 3541})
create('zangarmash', 3521, {3565, 3650, 3642, 3667, 3656, 3646, 3644, 3648, 3659, 3720, 3641, 3649, 3651, 3818, 3766, 3647, 3645, 3841})
create('terrokar', 3519, {3719, 3684, 3674, 3681, 3682, 3683, 3675, 3703, 3860, 3696, 3858, 3685, 3894, 3891, 3887, 3893, 3888, 3886, 3889, 3892, 3679})
create('nagrand', 3518, {3624, 3613, 3628, 3637, 3616, 3631, 3622, 3626, 3638, 3615, 3617, 3610, 3611, 3625, 3629, 3764, 3762, 3634, 3763})
create('blades_edge_mtns', 3522, {3864, 3867, 3773, 3777, 3776, 3863, 3775, 3831, 3787, 3784, 3785, 3781, 3774, 3768, 3844, 3830, 3833, 3828, 3866, 3772, 3865, 3769, 3782, 3829, 3827, 3832})
create('netherstorm', 3523, {3712, 3726, 3730, 3734, 3722, 3736, 3741, 3842, 3729, 3723, 3737, 3732, 3850, 3725, 3837, 3738, 3868, 3874, 3877, 3878, 3742, 3739})
local ending = create('shadowmoon', 3520, {3750, 3822, 3743, 3759, 3744, 3840, 3748, 3746, 3821, 3745, 3754, 3752, 3758})

local builder = L:Achievement(exploration, 20, 'outland')
:NameDesc('AN_EXPLORE_OUTLAND', 'AD_EXPLORE_OUTLAND', true)
for i = starting.id, ending.id do
    builder:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {i}):Name(L:GetAchievementByID(i).name):Build()
end
local ach = builder:Build()

L:Achievement(exploration, 30, '-Inv_Misc_Map_01')
:NameDesc('AN_EXPLORER', 'AD_EXPLORER', true)
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {231}):Name(L:GetAchievementByID(231).name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {250}):Name(L:GetAchievementByID(250).name):Build()
:Criteria(TYPE.COMPLETE_ACHIEVEMENT, {ach.id}):Name(ach.name):Build()
:Reward('AR_EXPLORER', true)
:Build()

do
    local rareIDs = {18695, 18682, 18697, 18681, 18694, 18689, 18686, 18698, 18678, 17144, 18692, 18696, 18680, 18677, 18690, 20932, 18685, 18693, 18683, 18679}
    local function preBuild(name, points)
        local builder = L:Achievement(outlandExploration, points, '-Spell_Shadow_DeathScream')
        :NameDesc('AN_' .. name, 'AD_' .. name, true)
        for _, npcID in pairs(rareIDs) do
            builder:Criteria(TYPE.KILL_NPC, {npcID}):Name('TBC_NPC_' .. npcID, true):Build()
        end
        return builder
    end

    local ach = preBuild('MIDDLE_RARE', 10):Build()
    ach:SetAnyCompletable()

    preBuild('BLOODY_RARE', 25):Previous(ach):Build()
end