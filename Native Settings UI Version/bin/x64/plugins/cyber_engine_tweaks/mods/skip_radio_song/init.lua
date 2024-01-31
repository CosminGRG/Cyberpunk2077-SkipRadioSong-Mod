-- Requires Codeware (https://github.com/psiberx/cp2077-codeware), config.lua and inputManager.lua to work

local config = require("modules/config/config")
local utils = require("modules/utils/utils")

local SkipRadioSong = {
    settings = {},

    defaultSettings = { -- Default settings
        keyboard = {
            ["mkbBinding_1"] = "IK_Mouse5",
            ["mkbBinding_2"] = "IK_Mouse4",
            ["mkbBinding_hold_1"] = false,
            ["mkbBinding_hold_2"] = false,
            ["mkbBinding_keys"] = 1
        },
        pad = {
            ["padBinding_1"] = "IK_Pad_X_SQUARE",
            ["padBinding_2"] = "IK_Pad_LeftShoulder",
            ["padBinding_3"] = "IK_Pad_LeftThumb",
            ["padBinding_hold_1"] = false,
            ["padBinding_hold_2"] = false,
            ["padBinding_hold_3"] = false,
            ["padBinding_keys"] = 2
        },
        audioCueFeedback = true,
        radioOffAlert = true
    },
}

function SkipRadioSong:new()
    registerForEvent("onInit", function()
        config.tryCreateConfig("config.json", self.defaultSettings) -- Create config file
        self.settings = config.loadFile("config.json")

        if not Codeware then -- Required codeware for the inputs
            print("[Skip Radio Song] Error: Missing Codeware")
        end

        local nativeSettings = GetMod("nativeSettings")
        if not nativeSettings then print("[Skip Radio Song] Error: Missing Native Settings") end

        nativeSettings.addTab("/skip_radio_song", "Skip Radio Song")
        nativeSettings.addSubcategory("/skip_radio_song/keyboard", "Keyboard Binding")
        nativeSettings.addSubcategory("/skip_radio_song/pad", "Gamepad Binding")
        nativeSettings.addSubcategory("/skip_radio_song/settings", "Settings")

        self.inputManager = require("modules/input/inputManager") -- Load input manager
        self.inputManager.onInit()

        self.skipLogic = require("modules/skip/skipLogic") -- Load input manager
        self.skipLogic.onInit()

        -- Keyboard
        local info = self.inputManager.createBindingInfo() -- Create an info table that holds information for a binding, makes it easier to reuse later
        info.keybindLabel = "Skip Song Key" -- Label of each key, will be followed by the key number, e.g. "Key 1"
        info.keybindDescription = "Skips the current song and plays a random one from the current radio station. Bind a key that is part of the hotkey" -- Description that'll be displayed for all the bindings keys
        info.supportsHold = false -- Whether to show the hold switches for this bindings keys
        info.id = "mkbBinding" -- Unique id for the binding, used for the savedOptions/defaultOptions tables and the saveCallback. See above for more details
        info.maxKeys = 3 -- Maximum amount of keys for this binding, shows a slider if it is bigger than 1
        info.maxKeysLabel = "Hotkey Keys Amount" -- Label for the binding's key amount slider
        info.maxKeysDescription = "Changes how many keys this hotkey has, all of them have to pressed for the hotkey to be activated" -- Description for the binding's key amount slider
        info.nativeSettingsPath = "/skip_radio_song/keyboard" -- Native settings path for where to add the bindigs options, if it is a multikey binding it has to be a seperate subcategory
        info.defaultOptions = self.defaultSettings.keyboard -- Table containing the default options
        info.savedOptions = self.settings.keyboard -- Table containing the current options

        info.saveCallback = function(name, value) -- Callback for when anything about the binding gets changed, gets the changed variable's generated name + the value
            self.settings.keyboard[name] = value -- Store changed value
            config.saveFile("config.json", self.settings) -- Save to file
        end
        info.callback = function() -- Callback for when the binding has been activated
            --print("Keyboard binding was activated")
            self.skipLogic.skipSong(self.settings.audioCueFeedback, self.settings.radioOffAlert)
        end
        self.inputManager.addNativeSettingsBinding(info) -- Acutally create the bindings widgets etc.

        -- Gamepad
        info = utils.Deepcopy(info) -- Copy the previous info table, no reason to re-setup most of it
        info.supportsHold = true
        info.isHoldLabel = "Is Hold Key" -- Label for the binding's key's hold switches
        info.isHoldDescription = "Controls whether the bound key below needs to be held down for some time to be activated" -- Description that'll be displayed for all the bindings keys hold toggle
        info.id = "padBinding"
        info.maxKeys = 3
        info.nativeSettingsPath = "/skip_radio_song/pad"
        info.defaultOptions = self.defaultSettings.pad
        info.savedOptions = self.settings.pad
        info.saveCallback = function(name, value)
            self.settings.pad[name] = value
            config.saveFile("config.json", self.settings)
        end
        info.callback = function()
            --print("Gamepad binding was activated")
            self.skipLogic.skipSong(self.settings.audioCueFeedback, self.settings.radioOffAlert)
        end
        self.inputManager.addNativeSettingsBinding(info)

        --Extra Settings
        nativeSettings.addSwitch("/skip_radio_song/settings", "Song Skip Audio Cue", "If enabled whenever you skip a song an audio cue will play.", self.settings.audioCueFeedback, self.defaultSettings.audioCueFeedback, function(state)
            self.settings.audioCueFeedback = state
            config.saveFile("config.json", self.settings)
        end)
    
        nativeSettings.addSwitch("/skip_radio_song/settings", "Radio Off Alert", "If enabled whenever you skip a song and the radio is off you will be notified by an alert.", self.settings.radioOffAlert, self.defaultSettings.radioOffAlert, function(state)
            self.settings.radioOffAlert = state
            config.saveFile("config.json", self.settings)
        end)
    end)

    registerForEvent("onShutdown", function ()
        self.inputManager.onShutdown()
    end)

    registerForEvent("onUpdate", function(dt)
        self.inputManager.onUpdate(dt)
        self.skipLogic.onUpdate(dt)
    end)

    return self
end

return SkipRadioSong:new()