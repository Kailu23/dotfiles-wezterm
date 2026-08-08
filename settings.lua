local M = {}

--- Config is passed from wezterm.lua
---@param config Config
function M.apply(config)
    local wezterm = require("wezterm") ---@type Wezterm

    config.color_scheme = "Noctalia"

    config.prefer_egl = true

    config.font_size = 14.0

    -- config.font = wezterm.font_with_fallback({
    --     "Hack Nerd Font Mono",
    --     "Segoe UI Emoji",
    -- })

    config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

    config.use_cap_height_to_scale_fallback_fonts = true

    config.window_close_confirmation = "AlwaysPrompt"
    config.window_background_opacity = 0.9
    config.window_decorations = "RESIZE"

    config.inactive_pane_hsb = {
        saturation = 0.75,
        brightness = 0.5,
    }

    config.default_workspace = "home"
    config.set_environment_variables = {
        CHERE_INVOKING = "1",
    }
    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true

    config.status_update_interval = 1000
    wezterm.on("update-status", function(window, pane)
        local workspace = window:active_workspace()
        local status = ""

        if window:active_key_table() then
            status = window:active_key_table()
        end
        if window:leader_is_active() then
            status = "PREFIX "
        end

        window:set_left_status(wezterm.format({
            { Text = " " .. wezterm.nerdfonts.oct_table .. " " .. workspace .. " " },
        }))
        window:set_right_status(wezterm.format({
            { Text = status },
        }))
    end)
end

return M
