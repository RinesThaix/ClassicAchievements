CA_CompletionManager = {}

local struct = CA_CompletionManager
local mapping = {}

local requiresUpdate = false
C_Timer.NewTicker(1, function()
    if not requiresUpdate then return end
    requiresUpdate = false
    AchievementFrame_ForceUpdate()
end)

local function Completion(data)
    return {
        getData = function(self)
            if data == nil then
                if not CA_LocalData then CA_LocalData = {} end
                return CA_LocalData
            end
            return data
        end,
        AddAchievement = function(self, id)
            if self:getData()[id] then error('achievement completion ' .. id .. ' is already present') end
            self:getData()[id] = {false, 0, {}}
            return self:getData()[id]
        end,
        AddCriteria = function(self, achievementID, criteriaID)
            local achievement = self:GetAchievement(achievementID)
            if not achievement then
                achievement = self:AddAchievement(achievementID)
            end
            if achievement[3][criteriaID] then error('achievement criteria completion ' .. achievementID .. '/' .. criteriaID .. ' is already present') end
            local criteria = {false}
            achievement[3][criteriaID] = criteria
            
            return achievement[3][criteriaID]
        end,
        GetAchievement = function(self, id, createIfNotPresent)
            local result = self:getData()[id]
            if not result and createIfNotPresent then
                result = self:AddAchievement(id)
            end
            return result
        end,
        GetCriteria = function(self, achievementID, criteriaID, createIfNotPresent)
            local achievement = self:GetAchievement(achievementID)
            local criteria = nil
            if achievement then
                criteria = achievement[3][criteriaID]
            end
            if not criteria and createIfNotPresent then
                criteria = self:AddCriteria(achievementID, criteriaID)
            end
            return criteria
        end,
        IsAchievementCompleted = function(self, id)
            local achievement = self:GetAchievement(id)
            if not achievement then return false end
            return achievement[1]
        end,
        GetAchievementCompletionTime = function(self, id)
            local achievement = self:GetAchievement(id)
            if not achievement then return 0 end
            return achievement[2]
        end,
        IsCriteriaCompleted = function(self, achievementID, criteriaID, realCriteria)
            local criteria = self:GetCriteria(achievementID, criteriaID)
            realCriteria = realCriteria or CA_Criterias:GetCriteriaByID(criteriaID)
            if realCriteria and realCriteria.type == CA_Criterias.TYPE.OR then
                if self:IsCriteriaCompleted(achievementID, realCriteria.data[1].id) or self:IsCriteriaCompleted(achievementID, realCriteria.data[2].id) then
                    return true
                end
            end
            return criteria and criteria[1]
        end,
        AreAllCriteriasCompleted = function(self, achievementData)
            for id, criteria in pairs(achievementData:GetCriterias()) do
                if not self:IsCriteriaCompleted(achievementData.id, id, criteria) then return false end
            end
            return true
        end,
        isAchievementCompleted = function(self, achievementData)
            return achievementData and achievementData:IsAvailable() and (achievementData:IsAnyCompletable() or self:AreAllCriteriasCompleted(achievementData))
        end,
        GetCriteriaProgression = function(self, achievementID, criteriaID)
            local criteria = self:GetCriteria(achievementID, criteriaID)
            if not criteria then return 0 end
            return criteria[2] or 0
        end,
        CompleteAchievement = function(self, id)
            local achievement = self:GetAchievement(id, true)
            achievement[1] = true
            achievement[2] = GetServerTime()

            CA_Criterias:Trigger(CA_Criterias.TYPE.COMPLETE_ACHIEVEMENT, {id}, 1)
        end,
        completeAchievementGracefully = function(self, achievement, forcefully)
            local previousID = achievement:GetPreviousID()
            if previousID and not self:IsAchievementCompleted(previousID) then
                local previous = CA_Database:GetAchievement(previousID)
                if previous then self:completeAchievementGracefully(previous, true) end
            end

            if forcefully then
                for criteriaID, criteria in pairs(achievement:GetCriterias()) do
                    self:CompleteCriteria(achievement.id, criteriaID)
                    if criteria.quantity then
                        self:SetCriteriaProgression(achievement.id, criteriaID, criteria.quantity, criteria.quantity)
                    else
                        self:CompleteCriteria(achievement.id, criteriaID)
                    end
                end
            end

            self:CompleteAchievement(achievement.id)
            AchievementFrameAchievements_Update()
            AchievementAlertSystem:AddAlert(achievement.id)
            PlaySound(SOUNDKIT.UI_IG_STORE_PURCHASE_DELIVERED_TOAST_01)

            CA_ShareAchievement(achievement.id)
        end,
        CompleteCriteria = function(self, achievementID, criteriaID, withQuantity)
            if self:IsAchievementCompleted(achievementID) then return false end
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            if not criteria or criteria[1] then return false end
            criteria[1] = true
            return true
        end,
        SetCriteriaProgression = function(self, achievementID, criteriaID, value, requiredQuantity)
            if self:IsAchievementCompleted(achievementID) then return false end
            value = min(value, requiredQuantity)
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            if criteria and criteria[2] and (criteria[2] >= value or criteria[2] == requiredQuantity) then return false end
            criteria[2] = value
            if criteria[2] == requiredQuantity then
                return self:CompleteCriteria(achievementID, criteriaID)
            end
            return false
        end,
        IncrementCriteriaProgression = function(self, achievementID, criteriaID, requiredQuantity, count)
            if self:IsAchievementCompleted(achievementID) then return false end
            count = count or 0
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            criteria[2] = criteria[2] or 0
            if criteria[2] == requiredQuantity then return false end
            criteria[2] = min(criteria[2] + count, requiredQuantity)
            if criteria[2] == requiredQuantity then
                return self:CompleteCriteria(achievementID, criteriaID)
            end
            return false
        end,
        checkAndComplete = function(self, achievementID)
            if self:IsAchievementCompleted(achievementID) then return end
            local achievement = CA_Database:GetAchievement(achievementID)
            if self:isAchievementCompleted(achievement) then
                self:completeAchievementGracefully(achievement)
            end
        end,
        CompleteCriteriaGlobally = function(self, criteriaID)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:CompleteCriteria(achievementID, criteriaID) then
                    requiresUpdate = true
                    self:checkAndComplete(achievementID)
                end
            end
        end,
        SetCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:SetCriteriaProgression(achievementID, criteriaID, count, requiredQuantity) then
                    requiresUpdate = true
                    self:checkAndComplete(achievementID)
                end
            end
        end,
        IncrementCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:IncrementCriteriaProgression(achievementID, criteriaID, requiredQuantity, count) then
                    self:checkAndComplete(achievementID)
                end
            end
            requiresUpdate = true
        end,
        RecheckAchievements = function(self)
            for id, data in pairs(self:getData()) do
                if data[1] == false then
                    self:checkAndComplete(id)
                end
            end
        end,
        TakeIncompleteAchievements = function(self)
            for id, data in pairs(self:getData()) do
                if data[1] then
                    local ach = CA_Database:GetAchievement(id)
                    if self:isAchievementCompleted(ach) then
                        -- ok
                    else
                        data[1] = false
                        data[2] = 0
                    end
                end
            end
        end,
        UpdateNewCriteriasOfOldType = function(self)
            local data = self:getData()
            local copies = {
                {380, 25},
                {381, 25}
            }
            for _, pair in pairs(copies) do
                local to = pair[1]
                local from = pair[2]
                local cidFrom = CA_Database:GetAchievement(from):GetCriteriasSorted()[1].id
                if data[from] and data[from][3] and data[from][3][cidFrom] and data[from][3][cidFrom][2] then
                    local cidTo = CA_Database:GetAchievement(to):GetCriteriasSorted()[1].id
                    if not data[to] or not data[to][3] or not data[to][3][cidTo] or data[to][3][cidTo][2] < data[from][3][cidFrom][2] then
                        data[to] = {false, 0, {[cidTo] = {false, data[from][3][cidFrom][2]}}}
                    end
                end
            end
        end,
        Reset = function(self)
            CA_LocalData = {}
            data = CA_LocalData

            CA_FirstLogin = true
        end
    }
end

struct.localCompletion = Completion(CA_LocalData)

function struct:GetLocal()
    return struct.localCompletion
end

function struct:GetTarget()
    return struct.targetCompletion
end

function struct:SetTarget(data)
    struct.targetCompletion = Completion(data)
end

function struct:PostLoad(categories)
    local function processCriteria(achievementID, criteria)
        if criteria.type == CA_Criterias.TYPE.OR then
            processCriteria(achievementID, criteria.data[1])
            processCriteria(achievementID, criteria.data[2])
        else
            if not mapping[criteria.id] then mapping[criteria.id] = {} end
            local achievementIDs = mapping[criteria.id]
            achievementIDs[#achievementIDs + 1] = achievementID
        end
    end
    for _, category in pairs(categories) do
        for achievementID, achievement in pairs(category:GetAchievements()) do
            if achievement:IsAvailable() then
                for _, criteria in pairs(achievement:GetCriterias()) do
                    processCriteria(achievementID, criteria)
                end
            end
        end
    end
end
