local localizations = {}

local function initLocalization(addonName, db)
    return {
        db = db,
        Add = function(self, db)
            if not self.db then self.db = db end
            for key, value in pairs(db) do
                self.db[key] = value
            end
        end,
        IsPresent = function(self, key)
            return self.db and self.db[key]
        end,
        GetRaw = function(self, key)
            if not self.db then
                SexyLib:Logger('Sexy Lib'):LogError('Localizations for addon ' .. addonName .. ' not loaded')
                return nil
            end
            if not self.db[key] then
                SexyLib:Logger('Sexy Lib'):LogErrorL('localization_not_present', addonName, key)
            end
            return self.db[key]
        end,
        Get = function(self, key, ...)
            local raw = self:GetRaw(key)
            if raw == nil then return nil end
            return SexyLib:Util():Format(raw, ...)
        end
    }
end

function SexyLib:InitLocalization(addonName, db)
    localizations[addonName] = initLocalization(addonName, db)
end

function SexyLib:IsLocalizationPresent(addonName)
    return localizations[addonName] ~= nil
end

function SexyLib:Localization(addonName)
    if not localizations[addonName] then SexyLib:InitLocalization(addonName) end
    return localizations[addonName]
end