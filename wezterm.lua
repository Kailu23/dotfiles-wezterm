local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.default_prog = { "bash.exe", "--login", "-i" }

config.font = wezterm.font_with_fallback({
    "Hack Nerd Font Mono",
    "Segoe UI Emoji",
})

config.color_scheme = "Monokai Soda (Gogh)"

config.prefer_egl = true

config.font_size = 12.0

config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.use_cap_height_to_scale_fallback_fonts = true

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    local gui_window = window:gui_window()
    gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.keys = {
    {
        key = "x",
        mods = "CTRL",
        action = wezterm.action.ActivateCopyMode,
    },
}
return config