if not DBM or not DBM.LoadMod then return end

hooksecurefunc(DBM, 'LoadMod', function(that, initialMod)
    if type(initialMod) ~= 'table' then return end
    local modName = initialMod.modId
    if not modName then return end
    local savedStatsName = modName:gsub("-", "").."_SavedStats"
    local savedStats = _G[savedStatsName]
    if not savedStats then return end

    for _, mod in pairs(that.Mods) do
        if mod.modId == modName then
            if mod.combatInfo then
                local mobIDs
                if mod.combatInfo.multiMobPullDetection then
                    mobIDs = mod.combatInfo.multiMobPullDetection
                else
                    mobIDs = {mod.combatInfo.mob}
                end
                
                local bossName = mod.id
                if bossName and savedStats[bossName] then
                    local kills = savedStats[bossName].normalKills
                    if kills > 0 then
                        for _, mobID in pairs(mobIDs) do
                            CA_Criterias:Trigger(CA_Criterias.TYPE.KILL_NPC, {mobID}, kills, true)
                        end
                    end
                end
            end
        end
    end
end)