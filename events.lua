local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

---@param ws string
---@param directory string
local function Spawn(ws, directory)
    local firstTab, firstPane, window = mux.spawn_window({
        workspace = ws,
        cwd = directory,
    })
    firstTab:set_title("nvim")

    local secondTab, secondPane = window:spawn_tab({
        cwd = directory,
    })
    secondTab:set_title("git")
end

local function SetupHome(window)
    local directory = wezterm.home_dir
    local muxWindow = window:mux_window()
    local tabs = muxWindow:tabs()

    if #tabs ~= 1 then
        return
    end

    tabs[1]:set_title("nvim")

    local gitTab = muxWindow:spawn_tab({ cwd = directory })
    gitTab:set_title("git")
end
wezterm.on("restore-workspaces", function(window, pane)
    local directory = wezterm.home_dir

    if window:active_workspace() == "home" then
        SetupHome(window)
    end

    Spawn("nvim", directory .. "/.config/nvim")
    Spawn("wezterm", directory .. "/.config/wezterm")
    Spawn("zsh", directory .. "/.config/zsh")
end)
