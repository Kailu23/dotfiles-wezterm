local M = {}

local wezterm = require("wezterm") ---@type Wezterm
local mux = wezterm.mux

function M.setup()
    wezterm.on("gui-startup", function(cmd)
        local tab, pane, window = mux.spawn_window(cmd or {})
        local gui_window = window:gui_window()
        gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
    end)
end

return M
