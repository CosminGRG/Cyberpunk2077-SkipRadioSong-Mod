utils = {
    radioData = require("modules/utils/radioData"),
}

function utils.getStation(song)
    for key, songList in pairs(radioData.radioStationSongs) do
        if (songList:find(song)) then
            return key
        end
    end
    return nil
end

function utils.getStationSongs(stationID)
    local songList = radioData.radioStationSongs[stationID]

    if (songList) then
        local songCodes = {}
        for val in string.gmatch(songList, "(%w+),") do
            table.insert(songCodes, val)
        end
        return songCodes
    end
    return nil
end

function utils.songCodeToInfo(code)
    local songInfoString = radioData.songHashToInfo[code]
    local songInfo = {}
    for info in string.gmatch(songInfoString, "[^%|]+") do
        table.insert(songInfo, info)
    end
    return songInfo
end

function utils.tableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function utils.shuffleTable(t)
    local n = #t
    for i = n, 2, -1 do
        local j = math.random(1, i)
        t[i], t[j] = t[j], t[i]
    end
end

function utils.Deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utils.Deepcopy(orig_key)] = utils.Deepcopy(orig_value)
        end
        setmetatable(copy, utils.Deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return utils
