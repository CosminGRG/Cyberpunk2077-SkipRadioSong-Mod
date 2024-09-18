SkipRadioSong = {
    audioCueFeedback = true,
    radioOffAlert = true,
    isUIVisible = false,
    skipLogic = require("modules/skip/skipLogic"),
    UI = require("modules/ui/ui")
}

function SkipRadioSong:new()
    registerForEvent("onInit", function()
        SkipRadioSong.skipLogic.onInit()
        SkipRadioSong.UI.onInit(SkipRadioSong)

        print("[SkipRadioSong] Skip Radio Song - CET - v2.3.0 initialized")
    end)

    registerForEvent('onUpdate', function(delta)
        SkipRadioSong.skipLogic.onUpdate(delta)
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

-- Keybinds
registerInput("skipCurrentSong", "Skip Radio Song", function(keypress)
    if not keypress then
        return
    end

    SkipRadioSong.skipLogic.skipSong(SkipRadioSong.audioCueFeedback, SkipRadioSong.radioOffAlert)
end)


return SkipRadioSong:new()
