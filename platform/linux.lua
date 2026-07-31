local M = {}

function M.apply(config)
    config.default_prog = { "zsh", "--login", "-i" }
    config.enable_wayland = true
    config.window_decorations = "NONE"
    config.color_scheme = "Catppuccin Macchiato"
end

return M
