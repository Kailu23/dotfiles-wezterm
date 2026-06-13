local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

local target = wezterm.target_triple

require("appearance").apply(config)
require("keys").apply(config)

require("platform").apply(config)
if target:find("linux") then
    require("platform.linux").apply(config)
elseif target:find("windows") then
    require("platform.windows").apply(config)
end

return config
