local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

local target = wezterm.target_triple

require("settings").apply(config)
require("keys").apply(config)
require("events")

if target:find("linux") then
    require("platform.linux").apply(config)
elseif target:find("windows") then
    require("platform.windows").apply(config)
end

return config
