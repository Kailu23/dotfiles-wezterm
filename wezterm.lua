local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

local target = wezterm.target_triple

config.font = wezterm.font_with_fallback({
    "Hack Nerd Font Mono",
    "Segoe UI Emoji",
})

config.color_scheme = "Monokai Soda (Gogh)"

config.prefer_egl = true

config.font_size = 12.0

config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.use_cap_height_to_scale_fallback_fonts = true

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