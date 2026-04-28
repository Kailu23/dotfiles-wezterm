local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "C:/Program Files/Git/bin/bash.exe", "--login", "-i" }

config.font = wezterm.font_with_fallback({
        "Hack Nerd Font Mono",
        "Segoe UI Emoji",
})

config.color_scheme = "Monokai Soda (Gogh)"

config.prefer_egl = true

config.font_size = 12.0

config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.use_cap_height_to_scale_fallback_fonts = true

return config
