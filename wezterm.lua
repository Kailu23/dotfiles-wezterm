local wezterm = require("wezterm")
local mux = wezterm.mux
local settings = require("settings")
local keys = require("keys")
local events = require("events")
local linux = require("platform.linux")
local windows = require("platform.windows")


local config = wezterm.config_builder()

local target = wezterm.target_triple

settings.apply(config)
keys.apply(config)

if target:find("linux") then
    linux.apply(config)
elseif target:find("windows") then
    windows.apply(config)
end

return config
