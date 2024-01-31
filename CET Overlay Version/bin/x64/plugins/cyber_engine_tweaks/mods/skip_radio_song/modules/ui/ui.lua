
UI = {
    SkipRadioSong = nil,
}

function UI.init(SkipRadioSong)
    UI.SkipRadioSong = SkipRadioSong
end

function UI.draw()
    ImGui.Begin("Skip Radio Song")

    UI.SkipRadioSong.soundFeedback = ImGui.Checkbox("Song Skip Sound Feedback", UI.SkipRadioSong.soundFeedback)

    UI.SkipRadioSong.radioOffAlert = ImGui.Checkbox("Radio Off Alert", UI.SkipRadioSong.radioOffAlert)

    ImGui.End()
end

return UI