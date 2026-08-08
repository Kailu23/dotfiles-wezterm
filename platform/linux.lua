local M = {}

--- Config is passed from wezterm.lua
---@param config Config
function M.apply(config)
    config.default_prog = { "zsh", "--login", "-i" }
    config.enable_wayland = true
    config.window_decorations = "NONE"
end

return M
