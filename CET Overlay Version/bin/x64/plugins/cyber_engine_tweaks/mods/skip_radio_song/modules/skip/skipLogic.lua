local Cron = require("modules/externals/Cron")
local utils = require("modules/utils/utils")

local skipLogic = {
    audioSystem = nil,
    delay = false,

    currentPlaylist = {},
    currentSongIndex = 1,
    station = nil,

    radioExt = nil,
    radioExtActiveStationData = nil,
    radioExtStation = nil,
    radioExtCurrentPlaylist = {},
    radioExtCurrentSongIndex = 1
}

function skipLogic.getNextSong(currentStation)
    if skipLogic.station ~= currentStation or #skipLogic.currentPlaylist == 0 or skipLogic.currentSongIndex > #skipLogic.currentPlaylist then
        skipLogic.currentPlaylist = utils.getStationSongs(currentStation)
        skipLogic.currentSongIndex = 1
        skipLogic.station = currentStation

        utils.shuffleTable(skipLogic.currentPlaylist)
    end

    local nextSong = skipLogic.currentPlaylist[skipLogic.currentSongIndex]

    skipLogic.currentSongIndex = skipLogic.currentSongIndex + 1
    return nextSong
end

function skipLogic.playPseudoRandomSong(currentStation, audioCueFeedback)
    local nextSong = skipLogic.getNextSong(currentStation)
    local nextSongInfo = utils.songCodeToInfo(nextSong)

    if audioCueFeedback then
        skipLogic.audioSystem:Play("dev_pocket_radio_off")
    end

    skipLogic.audioSystem:RequestSongOnRadioStation(currentStation, nextSongInfo[1])
end

function skipLogic.handleRadioExtSkip(audioCueFeedback)
    skipLogic.radioExtActiveStationData = skipLogic.radioExt.radioManager.managerV:getActiveStationData()

    if not skipLogic.radioExtActiveStationData then return end

    local stationName = skipLogic.radioExtActiveStationData.station
    local radioExtRadio = skipLogic.radioExt.radioManager.managerV:getRadioByName(stationName)

    if not radioExtRadio then return end

    if skipLogic.radioExtStation ~= stationName or skipLogic.radioExtCurrentSongIndex > #skipLogic.radioExtCurrentPlaylist then
        skipLogic.radioExtStation = stationName
        skipLogic.radioExtCurrentPlaylist = radioExtRadio.songs
        skipLogic.radioExtCurrentSongIndex = 1
        utils.shuffleTable(skipLogic.radioExtCurrentPlaylist)
    end

    if audioCueFeedback then
        skipLogic.audioSystem:Play("dev_pocket_radio_off")
    end

    radioExtRadio:currentSongDone()

    local nextSong = skipLogic.radioExtCurrentPlaylist[skipLogic.radioExtCurrentSongIndex]
    skipLogic.radioExtCurrentSongIndex = skipLogic.radioExtCurrentSongIndex + 1;

    radioExtRadio.currentSong = nextSong
    radioExtRadio.tick = 0

    radioExtRadio:startNewSong()
end

function skipLogic.skipSong(audioCueFeedback, radioOffAlert)
    if skipLogic.delay then return end

    skipLogic.delay = true

    if skipLogic.radioExt then
        skipLogic.handleRadioExtSkip(audioCueFeedback)
    end

    local player = Game.GetPlayer()
    local vehicle = Game.GetMountedVehicle(player)
    local isRadioActive = vehicle and vehicle:IsRadioReceiverActive()
    local pocketRadio = player:GetPocketRadio()
    local isPocketRadioActive = pocketRadio and pocketRadio:IsActive()

    if skipLogic.radioExtActiveStationData == nil then
        if vehicle and isRadioActive then
            local currentSong = tostring(vehicle:GetRadioReceiverTrackName()):sub(20, 29)
            local currentStation = utils.getStation(currentSong)

            if currentSong and currentStation then
                skipLogic.playPseudoRandomSong(currentStation, audioCueFeedback)
            end
        elseif isPocketRadioActive then
            local currentSong = tostring(pocketRadio:GetTrackName()):sub(20, 29)
            local currentStation = utils.getStation(currentSong)

            if currentSong and currentStation then
                skipLogic.playPseudoRandomSong(currentStation, audioCueFeedback)
            end
        else
            if radioOffAlert then
                local message
                if vehicle and not isRadioActive then
                    message = "Car Radio is Off"
                elseif not isPocketRadioActive then
                    message = "Pocket Radio is Off"
                end
                player:SetWarningMessage(message)
            end
        end
    end

    Cron.After(1, function()
        skipLogic.delay = false
    end)
end

function skipLogic.onInit()
    skipLogic.audioSystem = Game.GetAudioSystem()
    skipLogic.radioExt = GetMod("radioExt")
end

function skipLogic.onUpdate(deltaTime)
    math.randomseed(os.time())
    Cron.Update(deltaTime)
end

return skipLogic
