local M = {}

function M.apply(config)
    config.default_prog = { "bash.exe", "--login", "-i" }
    require("platform.windows.fullscreen").setup()
end

return M
