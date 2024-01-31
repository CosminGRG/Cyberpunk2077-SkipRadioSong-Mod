utils = {
    radioData = require("radioData.lua"),
}

function utils.getStation(song)

    for key, songList in pairs(radioData.radioStationSongs) do
        if(songList:find(song)) then
            return key
        end
    end
    return nil
end

function utils.getStationSongs(stationID)

    local songList = radioData.radioStationSongs[stationID]

    if(songList) then
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

return utils

