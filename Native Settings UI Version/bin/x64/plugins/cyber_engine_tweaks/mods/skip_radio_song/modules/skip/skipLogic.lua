
local Cron = require("modules/externals/Cron")
local utils = require("modules/utils/utils")

local skipLogic = {
    audioSystem = nil,
    delay = false,
    radioExt = nil,
    radioExtActiveStationData = nil
}

local function playPseudoRandomSong(currentStation, audioCueFeedback)

    local songs = utils.getStationSongs(currentStation)

    local count = utils.tableLength(songs)

    local nextSongIndex = math.random(1, count)
    local nextSongInfo = utils.songCodeToInfo(songs[nextSongIndex])

    if (audioCueFeedback) then
        skipLogic.audioSystem:Play("dev_pocket_radio_on")
    end

    skipLogic.audioSystem:RequestSongOnRadioStation(currentStation, nextSongInfo[1])
end

local function handleRadioExtSkip(audioCueFeedback) 
    skipLogic.radioExtActiveStationData = skipLogic.radioExt.radioManager.managerV:getActiveStationData()
    if skipLogic.radioExtActiveStationData ~= nil then

        local radioExtRadio = skipLogic.radioExt.radioManager.managerV:getRadioByName(skipLogic.radioExtActiveStationData.station)

        if (audioCueFeedback) then
            skipLogic.audioSystem:Play("dev_pocket_radio_on")
        end

        radioExtRadio:currentSongDone()

        radioExtRadio.currentSong = radioExtRadio.songs[math.random(1, #radioExtRadio.songs)]
        radioExtRadio.tick = 0

        radioExtRadio:startNewSong()
    end
end

function skipLogic.skipSong(audioCueFeedback, radioOffAlert)
    if (skipLogic.delay == false) then
        skipLogic.delay = true

        if (skipLogic.radioExt) then
            handleRadioExtSkip(audioCueFeedback)
        end

        if (skipLogic.radioExtActiveStationData == nil) then
            if (Game.GetMountedVehicle(Game.GetPlayer()) ~= nil) then

                local car = Game.GetMountedVehicle(Game.GetPlayer())
    
                if (car and car:IsRadioReceiverActive()) then

                    local currentSong = tostring(car:GetRadioReceiverTrackName()):sub(20, 29)
                    local currentStation = utils.getStation(currentSong)
                
                    if (currentStation ~= nil and currentSong ~= nil) then
                        playPseudoRandomSong(currentStation, audioCueFeedback)
                    end
                else 
                    if (radioOffAlert) then
                        Game.GetPlayer():SetWarningMessage("[Skip Radio Song] Car Radio is Off")
                    end
                end
            else
                local PocketRadio = Game.GetPlayer():GetPocketRadio()

                if (PocketRadio and PocketRadio:IsActive()) then

                    local currentSong = tostring(PocketRadio:GetTrackName()):sub(20, 29)
                    local currentStation = utils.getStation(currentSong)
                    
                    if (currentStation ~= nil and currentSong ~= nil) then
                        playPseudoRandomSong(currentStation)
                    end
                else
                    if (radioOffAlert) then
                        Game.GetPlayer():SetWarningMessage("[Skip Radio Song] Pocket Radio is Off")
                    end
                end
            end
        end

        Cron.After(1, function()
            skipLogic.delay = false
        end)
    end
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


