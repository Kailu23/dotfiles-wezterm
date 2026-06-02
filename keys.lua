local M = {}

function M.apply(config)
    local wezterm = require("wezterm")
    config.keys = {
        {
            key = "x",
            mods = "CTRL",
            action = wezterm.action.ActivateCopyMode,
        },
        {
            key = "W",
            mods = "CTRL",
            action = wezterm.action.CloseCurrentTab({ confirm = false }),
        },
    }
end

return M