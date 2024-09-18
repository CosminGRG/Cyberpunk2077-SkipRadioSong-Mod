UI = {
    SkipRadioSong = nil,
}

function UI.onInit(SkipRadioSong)
    UI.SkipRadioSong = SkipRadioSong
end

function UI.draw()
    ImGui.Begin("Skip Radio Song")

    UI.SkipRadioSong.audioCueFeedback = ImGui.Checkbox("Skip Audio Cue", UI.SkipRadioSong.audioCueFeedback)

    UI.SkipRadioSong.radioOffAlert = ImGui.Checkbox("Radio Off Alert", UI.SkipRadioSong.radioOffAlert)

    ImGui.End()
end

return UI
