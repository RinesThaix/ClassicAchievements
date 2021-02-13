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
        IsCriteriaCompleted = function(self, achievementID, criteriaID)
            local criteria = self:GetCriteria(achievementID, criteriaID)
            if not criteria then return false end
            return criteria[1]
        end,
        AreAllCriteriasCompleted = function(self, achievementData)
            for id, _ in pairs(achievementData:GetCriterias()) do
                local criteria = self:GetCriteria(achievementData.id, id)
                if not criteria or not criteria[1] then return false end
            end
            return true
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

            ShareAchievement(achievement.id)
        end,
        CompleteCriteria = function(self, achievementID, criteriaID, withQuantity)
            local criteria = self:GetCriteria(achievementID, criteriaID, true)
            if not criteria or criteria[1] then return false end
            criteria[1] = true
            return true
        end,
        SetCriteriaProgression = function(self, achievementID, criteriaID, value, requiredQuantity)
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
        CompleteCriteriaGlobally = function(self, criteriaID)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:CompleteCriteria(achievementID, criteriaID) then
                    requiresUpdate = true
                    local achievement = CA_Database:GetAchievement(achievementID)
                    if achievement and self:AreAllCriteriasCompleted(achievement) then
                        self:completeAchievementGracefully(achievement)
                    end
                end
            end
        end,
        SetCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:SetCriteriaProgression(achievementID, criteriaID, count, requiredQuantity) then
                    requiresUpdate = true
                    local achievement = CA_Database:GetAchievement(achievementID)
                    if achievement and self:AreAllCriteriasCompleted(achievement) then
                        self:completeAchievementGracefully(achievement)
                    end
                end
            end
        end,
        IncrementCriteriaProgressionGlobally = function(self, criteriaID, requiredQuantity, count)
            local achievementIDs = mapping[criteriaID]
            if not achievementIDs then return end
            for _, achievementID in pairs(achievementIDs) do
                if self:IncrementCriteriaProgression(achievementID, criteriaID, requiredQuantity, count) then
                    local achievement = CA_Database:GetAchievement(achievementID)
                    if achievement and self:AreAllCriteriasCompleted(achievement) then
                        self:completeAchievementGracefully(achievement)
                    end
                end
            end
            requiresUpdate = true
        end,
        RecheckAchievements = function(self)
            for id, data in pairs(self:getData()) do
                if data[1] == false then
                    local achievement = CA_Database:GetAchievement(id)
                    if achievement and self:AreAllCriteriasCompleted(achievement) then
                        self:completeAchievementGracefully(achievement)
                    end
                end
            end
        end,
        Reset = function(self)
            CA_LocalData = {}
            data = CA_LocalData
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
    for _, category in pairs(categories) do
        for achievementID, achievement in pairs(category:GetAchievements()) do
            for criteriaID, _ in pairs(achievement:GetCriterias()) do
                if not mapping[criteriaID] then mapping[criteriaID] = {} end
                local achievementIDs = mapping[criteriaID]
                achievementIDs[#achievementIDs + 1] = achievementID
            end
        end
    end
end
