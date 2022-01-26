local L = CA_Loader:ForTab(CA_Database:GetTab(CA_Database.TAB_ID_PLAYER))
local TYPE = CA_Criterias.TYPE

local pve = L:GetCategoryByID(5)
local tbcInstances = L:GetCategoryByID(7)
local featsOfStrength = L:GetCategoryByID(99)

do

    local hyjal = L:Achievement(tbcInstances, 20, 'hyjal')
                   :NameDesc('AN_HYJAL', 'AD_HYJAL', true)
                   :Criteria(TYPE.KILL_NPC, { 17968 }):Build()
                   :Build()

    local btEntrance = L:Achievement(tbcInstances, 10, '-Spell_Fire_BlueImmolation')
                        :NameDesc('AN_BT_ENTRANCE', 'AD_BT_ENTRANCE', true)
                        :Criteria(TYPE.KILL_NPC, { 22887 }):Name('AC_KILL_NAJENTUS', true):Build()
                        :Criteria(TYPE.KILL_NPC, { 22898 }):Name('AC_KILL_SUPREMUS', true):Build()
                        :Build()

    local btSecondWing = L:Achievement(tbcInstances, 10, '-Spell_Shadow_ConeOfSilence')
                          :NameDesc('AN_BT_SECOND_WING', 'AD_BT_SECOND_WING', true)
                          :Criteria(TYPE.KILL_NPC, { 22841 }):Name('AC_KILL_SHADOW_OF_AKAMA', true):Build()
                          :Criteria(TYPE.KILL_NPC, { 22871 }):Name('AC_KILL_THERON', true):Build()
                          :Criteria(TYPE.KILL_NPC, { 22948 }):Name('AC_KILL_GURTOGG', true):Build()
                          :Criteria(TYPE.KILL_NPC, { 23420 }):Name('AC_KILL_RELIQUARY', true):Build()
                          :Build()

    local btLastWing = L:Achievement(tbcInstances, 10, '-Spell_Shadow_ShadowPower')
                        :NameDesc('AN_BT_LAST_WING', 'AD_BT_LAST_WING', true)
                        :Criteria(TYPE.KILL_NPC, { 22947 }):Name('AC_KILL_MOTHER_SHAHRAZ', true):Build()
                        :Criteria(TYPE.KILL_NPC, { 22949 }):Name('AC_KILL_BT_COUNCIL', true):Build()
                        :Criteria(TYPE.KILL_NPC, { 22917 }):Name('AC_KILL_ILLIDAN', true):Build()
                        :Build()

    local bt = L:Achievement(tbcInstances, 20, 'black_temple')
                :NameDesc('AN_BLACK_TEMPLE', 'AD_BLACK_TEMPLE', true)
                :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btEntrance.id }):Name(btEntrance.name):Build()
                :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btSecondWing.id }):Name(btSecondWing.name):Build()
                :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { btLastWing.id }):Name(btLastWing.name):Build()
                :Reward('AR_BLACK_TEMPLE', true)
                :Build()

    L:Achievement(pve, 20, '-Inv_Helmet_103')
     :NameDesc('AN_TBC_PHASE_3', 'AD_TBC_PHASE_3', true)
     :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { hyjal.id }):Name(hyjal.name):Build()
     :Criteria(TYPE.COMPLETE_ACHIEVEMENT, { bt.id }):Name(bt.name):Build()
     :Build()

    L:Achievement(featsOfStrength, 0, '-Inv_Weapon_Glave_01')
     :NameDesc('AN_AZZINOTH', 'AD_AZZINOTH', true)
     :Criteria(TYPE.OBTAIN_ITEM, { 32837 }):Name('AC_OBTAIN_MAINHAND_AZZINOTH', true):Build()
     :Criteria(TYPE.OBTAIN_ITEM, { 32838 }):Name('AC_OBTAIN_OFFHAND_AZZINOTH', true):Build()
     :Build()

    L:Achievement(featsOfStrength, 0, '-Inv_Helmet_96')
     :NameDesc('AN_P3_FIRST_WEEK', 'AD_P3_FIRST_WEEK', true)
     :Criteria(TYPE.P3_FIRST_WEEK, { 17968 }):Name('AC_KILL_ARCHIMONDE', true):Build()
     :Criteria(TYPE.P3_FIRST_WEEK, { 22917 }):Name('AC_KILL_ILLIDAN', true):Build()
     :Reward('AR_P3_FIRST_WEEK', true)
     :Build()

end