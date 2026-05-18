local M = {}

function M.apply(config)
    local wezterm = require("wezterm")

    config.color_scheme = "Catppuccin Macchiato"

    config.prefer_egl = true

    config.font_size = 12.0

    config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

    config.use_cap_height_to_scale_fallback_fonts = true

    config.window_close_confirmation = "NeverPrompt"

    config.font = wezterm.font_with_fallback({
        "Hack Nerd Font Mono",
        "Segoe UI Emoji",
    })
end

return M
