local db = CA_Database
local cmanager = CA_CompletionManager
local loc = SexyLib:Localization('Classic Achievements')

function GetAchievementLink(achievementID)
    local ach = db:GetAchievement(achievementID)
    if not ach then return nil end
    local completion = cmanager:GetLocal()
    local finished = 0
    local month, day, year = 0, 0, 0
    local criterias = 0
    if completion:IsAchievementCompleted(ach.id) then
        finished = 1
        local time = completion:GetAchievementCompletionTime(ach.id)
        month, day, year = tonumber(date('%m', time)), tonumber(date('%d', time)), tonumber(date('%y', time))
    end
    local index = 0
    for _, criteria in pairs(ach:GetCriterias()) do
        if completion:IsCriteriaCompleted(ach.id, criteria.id) then
            criterias = bit.bor(criterias, bit.lshift(1, index))
        end
        index = index + 1
    end
    return string.format('[ClassicAchievement:%d:%s:%d:%d:%d:%d:%d]', achievementID, UnitGUID('player'), finished, month, day, year, criterias)
end

local function strstartsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

local function filterFunc(_, event, msg, player, l, cs, t, flag, channelId, ...)
    if flag == "GM" or flag == "DEV" or event == "CHAT_MSG_CHANNEL" and type(channelId) == "number" and channelId > 0 then return end

    local newMsg, remaining, done = '', msg, false
    repeat
        local start, finish, data = remaining:find('%[ClassicAchievement:(%d+:[^%]]+:%d:%d+:%d+:%d+:%d+)%]')
        if data then
            local link
            local aid, guid, finished, month, day, year, criterias = strsplit(':', data)
            if criterias == nil then link = ''
            else
                local ach = db:GetAchievement(tonumber(aid))
                if not ach then link = ''
                else
                    link = string.format('|cffffff00|Hgarrmission:clach:%d#%s#%d#%d#%d#%d#%d|h[%s]|h|r', aid, guid, finished, month, day, year, criterias, ach.name)
                end
            end
            newMsg = newMsg .. remaining:sub(1, start - 1)
            newMsg = newMsg .. link
            remaining = remaining:sub(finish + 1)
        else
            done = true
        end
    until(done)
    newMsg = newMsg .. remaining

    if newMsg ~= '' then
        return false, newMsg, player, l, cs, t, flag, channelId, ...
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", filterFunc)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", filterFunc)

local function ShowTooltip(lines, linesFromTop, activeCategories)
    ItemRefTooltip:Show();
    if not ItemRefTooltip:IsVisible() then
      ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
    end
    ItemRefTooltip:ClearLines();
    for i, line in ipairs(lines) do
      local sides, a1, a2, a3, a4, a5, a6, a7, a8 = unpack(line);
      if(sides == 1) then
        ItemRefTooltip:AddLine(a1, a2, a3, a4, a5);
      elseif(sides == 2) then
        ItemRefTooltip:AddDoubleLine(a1, a2, a3, a4, a5, a6, a7, a8);
      end
    end
    ItemRefTooltip:Show()
end

local function formatCriteriaCompletion(criteria)
    local color
    if criteria[2] then color = '&a' else color = '&7' end
    return SexyLib:Util():Colorize(color .. criteria[1])
end

local shownAchievementID = 0

hooksecurefunc('SetItemRef', function(link)
    local linkType, addon, params = strsplit(':', link)
    if linkType ~= 'garrmission' or addon ~= 'clach' then return end
    local aid, guid, finished, month, day, year, criterias = strsplit('#', params)
    aid, finished, month, day, year, criterias = tonumber(aid), tonumber(finished), tonumber(month), tonumber(day), tonumber(year), tonumber(criterias)
    local ach = db:GetAchievement(aid)
    if ach == nil then return end
    if IsShiftKeyDown() then
        local editbox = GetCurrentKeyBoardFocus()
        if editbox then
            editbox:Insert('[ClassicAchievements: ' .. ach.name .. ']')
        end
    else
        if shownAchievementID == aid and ItemRefTooltip:IsVisible() then
            shownAchievementID = 0
            ItemRefTooltip:Hide()
            return
        end
        local lines = {
            {1, '|cffffffff' .. ach.name},
            {1, ' '}
        }

        local _, _, _, _, _, playerName = GetPlayerInfoByGUID(guid)
        if not playerName then playerName = '???' end
        if finished == 1 then
            lines[#lines + 1] = {1, loc:Get('achievement_earned', '|3-4(' .. playerName .. ')', day, month, year)}
        else
            lines[#lines + 1] = {1, loc:Get('achievement_in_progress', playerName)}
        end
        lines[#lines + 1] = {1, ' '}

        local words = SexyLib:Util():Explode(ach.description, ' ')
        local sublines, subline = {}, ''
        for _, word in pairs(words) do
            if strlen(subline) + 1 + strlen(word) <= 100 then
                if subline == '' then
                    subline = word
                else
                    subline = subline .. ' ' .. word
                end
            else
                sublines[#sublines + 1] = subline
                subline = word
            end
        end
        if subline ~= '' then sublines[#sublines + 1] = subline end
        for _, subline in pairs(sublines) do
            lines[#lines + 1] = {1, subline}
        end
        
        local clist, index = {}, 0
        for _, criteria in pairs(ach:GetCriterias()) do
            if criteria.name and not criteria.quantity then
                local bt = bit.lshift(1, index)
                local completed = bit.band(criterias, bt) == bt
                clist[#clist + 1] = {criteria.name, completed}
            end
            index = index + 1
        end
        local size = #clist
        if size > 0 then
            lines[#lines + 1] = {1, ' '}
            local i = 1
            while i <= size do
                local inserted = false
                if i ~= size then
                    local a, b = formatCriteriaCompletion(clist[i]), formatCriteriaCompletion(clist[i + 1])
                    if strlen(a) + strlen(b) <= 100 then
                        inserted = true
                        i = i + 1
                        lines[#lines + 1] = {2, a, b}
                    end
                end
                if not inserted then lines[#lines + 1] = {1, formatCriteriaCompletion(clist[i])} end
                i = i + 1
            end
        end

        shownAchievementID = aid
        ShowTooltip(lines)
    end
end)

function CA_ShareAchievement(achievementID)
    if CA_IsSharingAchievementsInChat() then
        local gender = UnitSex('player')
        if gender > 1 then
            if gender == 2 then gender = 'MALE'
            else gender = 'FEMALE' end
            local message = SexyLib:Localization('Classic Achievements'):Get('GOT_ACHIEVEMENT_MESSAGE_' .. gender, GetAchievementLink(achievementID))
            if SexyLib:Util():IsInGuild() then SendChatMessage(message, 'GUILD') end
            if IsInRaid() then SendChatMessage(message, 'RAID')
            elseif IsInGroup() then SendChatMessage(message, 'PARTY')
            else SendChatMessage(message, 'SAY') end
        end
    end
end