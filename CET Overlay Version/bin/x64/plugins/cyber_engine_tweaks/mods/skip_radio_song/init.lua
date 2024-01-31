SkipRadioSong = {
    audioSystem = nil,
    soundFeedback = true,
    radioOffAlert = true,
    isUIVisible = false,
    delay = false,
    radioExt = nil,
    radioExtActiveStationData = nil,

    UI = require("modules/ui/ui.lua"),
    utils = require("modules/utils/utils"),
    radioData = require("modules/utils/radioData.lua"),
}

Cron = require("modules/external/Cron")

function SkipRadioSong:new()

    registerForEvent("onInit", function ()
        SkipRadioSong.audioSystem = Game.GetAudioSystem()
        SkipRadioSong.UI.init(SkipRadioSong)
        SkipRadioSong.radioExt = GetMod("radioExt")
    end)

    registerForEvent('onUpdate', function(delta)
        math.randomseed(os.time())
		Cron.Update(delta)
	end)

    registerForEvent("onDraw", function()
        if (SkipRadioSong.isUIVisible) then
            SkipRadioSong.UI.draw()
        end
    end)

    registerForEvent("onOverlayOpen", function()
        SkipRadioSong.isUIVisible = true
    end)
    
    registerForEvent("onOverlayClose", function()
        SkipRadioSong.isUIVisible = false
    end)

    return SkipRadioSong
end

local function playPseudoRandomSong(currentStation)

    local songs = utils.getStationSongs(currentStation)

    local count = utils.tableLength(songs)

    local nextSongIndex = math.random(1, count)
    local nextSongInfo = utils.songCodeToInfo(songs[nextSongIndex])

    if (SkipRadioSong.soundFeedback) then
        SkipRadioSong.audioSystem:Play("dev_pocket_radio_on")
    end

    SkipRadioSong.audioSystem:RequestSongOnRadioStation(currentStation, nextSongInfo[1])
end

local function handleRadioExtSkip() 
    SkipRadioSong.radioExtActiveStationData = SkipRadioSong.radioExt.radioManager.managerV:getActiveStationData()
    if SkipRadioSong.radioExtActiveStationData ~= nil then

        local radioExtRadio = SkipRadioSong.radioExt.radioManager.managerV:getRadioByName(SkipRadioSong.radioExtActiveStationData.station)

        if (SkipRadioSong.soundFeedback) then
            SkipRadioSong.audioSystem:Play("dev_pocket_radio_on")
        end

        radioExtRadio:currentSongDone()

        radioExtRadio.currentSong = radioExtRadio.songs[math.random(1, #radioExtRadio.songs)]
        radioExtRadio.tick = 0

        radioExtRadio:startNewSong()
    end
end

function SkipRadioSong.skipSong()
    if (SkipRadioSong.delay == false) then
        SkipRadioSong.delay = true

        if (SkipRadioSong.radioExt) then
            handleRadioExtSkip()
        end

        if (SkipRadioSong.radioExtActiveStationData == nil) then
            if (Game.GetMountedVehicle(Game.GetPlayer()) ~= nil) then

                local car = Game.GetMountedVehicle(Game.GetPlayer())
    
                if (car and car:IsRadioReceiverActive()) then

                    local currentSong = tostring(car:GetRadioReceiverTrackName()):sub(20, 29)
                    local currentStation = utils.getStation(currentSong)
                
                    if (currentStation ~= nil and currentSong ~= nil) then
                        playPseudoRandomSong(currentStation)
                    end
                else 
                    if (SkipRadioSong.radioOffAlert) then
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
                    if (SkipRadioSong.radioOffAlert) then
                        Game.GetPlayer():SetWarningMessage("[Skip Radio Song] Pocket Radio is Off")
                    end
                end
            end
        end

        Cron.After(1, function()
            SkipRadioSong.delay = false
        end)
    end
end

-- Keybinds
registerHotkey("skipCurrentSong", "Skip Radio Song", function()
    SkipRadioSong.skipSong()
end)


return SkipRadioSong:new()