local config = require("modules/config/config")
local utils = require("modules/utils/utils")
local inputManager = require("modules/externals/inputManager")
local skipLogic = require("modules/skip/skipLogic")

local SkipRadioSong = {
    settings = {},
    defaultSettings = {
        keyboard = {
            ["mkbBinding_1"] = "IK_Mouse5",
            ["mkbBinding_hold_1"] = false,
            ["mkbBinding_keys"] = 1
        },
        pad = {
            ["padBinding_1"] = "IK_Pad_X_SQUARE",
            ["padBinding_2"] = "IK_Pad_LeftShoulder",
            ["padBinding_3"] = "IK_Pad_LeftThumb",
            ["padBinding_hold_1"] = false,
            ["padBinding_hold_2"] = false,
            ["padBinding_hold_3"] = false,
            ["padBinding_keys"] = 1
        },
        audioCueFeedback = true,
        radioOffAlert = true
    },
}

function SkipRadioSong:SetupMenu(nativeSettings)
    if not nativeSettings.pathExists("/skip_radio_song") then
        nativeSettings.addTab("/skip_radio_song", "Skip Radio Song")
    end

    nativeSettings.addSubcategory("/skip_radio_song/keyboard", "Keyboard Binding")
    nativeSettings.addSubcategory("/skip_radio_song/pad", "Gamepad Binding")
    nativeSettings.addSubcategory("/skip_radio_song/settings", "Settings")

    --Extra Settings
    nativeSettings.addSwitch("/skip_radio_song/settings", "Skip Audio Cue",
        "If enabled whenever you skip a song an audio cue will play.", self.settings.audioCueFeedback,
        self.defaultSettings.audioCueFeedback, function(state)
            self.settings.audioCueFeedback = state
            config.saveFile("config.json", self.settings)
        end)

    nativeSettings.addSwitch("/skip_radio_song/settings", "Radio Off Alert",
        "If enabled whenever you skip a song and the radio is off you will be notified by an alert.",
        self.settings.radioOffAlert, self.defaultSettings.radioOffAlert, function(state)
            self.settings.radioOffAlert = state
            config.saveFile("config.json", self.settings)
        end)
end

function SkipRadioSong:SetupBindings()
    local info = inputManager.createBindingInfo()                                                                         -- Create an info table that holds information for a binding, makes it easier to reuse later
    info.keybindLabel =
    "Skip Song Key"                                                                                                       -- Label of each key, will be followed by the key number, e.g. "Key 1"
    info.keybindDescription =
    "Skips the current song and plays a random one from the current radio station. Bind a key that is part of the hotkey" -- Description that'll be displayed for all the bindings keys
    info.supportsHold = false                                                                                             -- Whether to show the hold switches for this bindings keys
    info.id =
    "mkbBinding"                                                                                                          -- Unique id for the binding, used for the savedOptions/defaultOptions tables and the saveCallback. See above for more details
    info.maxKeys = 3                                                                                                      -- Maximum amount of keys for this binding, shows a slider if it is bigger than 1
    info.maxKeysLabel =
    "Hotkey Keys Amount"                                                                                                  -- Label for the binding's key amount slider
    info.maxKeysDescription =
    "Changes how many keys this hotkey has, all of them have to pressed for the hotkey to be activated"                   -- Description for the binding's key amount slider
    info.nativeSettingsPath =
    "/skip_radio_song/keyboard"                                                                                           -- Native settings path for where to add the bindigs options, if it is a multikey binding it has to be a seperate subcategory
    info.defaultOptions = self.defaultSettings
        .keyboard                                                                                                         -- Table containing the default options
    info.savedOptions = self.settings
        .keyboard                                                                                                         -- Table containing the current options

    info.saveCallback = function(name, value)                                                                             -- Callback for when anything about the binding gets changed, gets the changed variable's generated name + the value
        self.settings.keyboard[name] =
            value                                                                                                         -- Store changed value
        config.saveFile("config.json", self.settings)                                                                     -- Save to file
    end
    info.callback = function()                                                                                            -- Callback for when the binding has been activated
        --print("Keyboard binding was activated")
        skipLogic.skipSong(self.settings.audioCueFeedback, self.settings.radioOffAlert)
    end
    inputManager.addNativeSettingsBinding(info) -- Acutally create the bindings widgets etc.

    -- Gamepad
    info = utils.Deepcopy(info) -- Copy the previous info table, no reason to re-setup most of it
    info.supportsHold = true
    info.isHoldLabel =
    "Is Hold Key"                                                                              -- Label for the binding's key's hold switches
    info.isHoldDescription =
    "Controls whether the bound key below needs to be held down for some time to be activated" -- Description that'll be displayed for all the bindings keys hold toggle
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
        skipLogic.skipSong(self.settings.audioCueFeedback, self.settings.radioOffAlert)
    end
    inputManager.addNativeSettingsBinding(info)
end

function SkipRadioSong:new()
    local newInstance = setmetatable({}, { __index = SkipRadioSong })
    local self = newInstance

    registerForEvent("onInit", function()
        if not config then
            print("[Skip Radio Song] Error: Missing config module")
            return
        end

        config.tryCreateConfig("config.json", self.defaultSettings)
        self.settings = config.loadFile("config.json")

        local nativeSettings = GetMod("nativeSettings")
        if not nativeSettings then
            print("[Skip Radio Song] Error: Missing Native Settings")
            return
        end

        if inputManager and inputManager.onInit then
            inputManager.onInit()
        else
            print("[Skip Radio Song] Error: Missing inputManager or its onInit method")
            return
        end

        self:SetupMenu(nativeSettings)

        if skipLogic and skipLogic.onInit then
            skipLogic.onInit()
        else
            print("[Skip Radio Song] Error: Missing skipLogic or its onInit method")
            return
        end

        self:SetupBindings()

        print("[SkipRadioSong] Skip Radio Song - Native UI - v2.3.0 initialized")
    end)

    registerForEvent("onShutdown", function()
        if inputManager then
            inputManager.onShutdown()
        end
    end)

    registerForEvent("onUpdate", function(dt)
        if inputManager then
            inputManager.onUpdate(dt)
        end
        if skipLogic then
            skipLogic.onUpdate(dt)
        end
    end)

    return self
end

return SkipRadioSong:new()
