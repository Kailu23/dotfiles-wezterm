local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

local target = wezterm.target_triple

require("appearance").apply(config)

config.keys = {
    {
        key = "x",
        mods = "CTRL",
        action = wezterm.action.ActivateCopyMode,
    },
}

if target:find("linux") then
    require("platform.linux").apply(config)
elseif target:find("windows") then
    require("platform.windows").apply(config)
end

return config