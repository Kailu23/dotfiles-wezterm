local M = {}

function M.apply(config)
    local wezterm = require("wezterm")
    local act = wezterm.action

    config.leader = {
        key = "Space",
        mods = "CTRL",
        timeout_milliseconds = 2000,
    }
    config.keys = {
        { key = "Space", mods = "LEADER", action = act.SendKey({ key = "Space", mods = "CTRL" }) },
        { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
        { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
        { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
        { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
        { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
        { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
        { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
        { key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
        {
            key = "r",
            mods = "LEADER",
            action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
        },
        { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
        { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
        { key = "t", mods = "LEADER", action = act.ShowTabNavigator },
        {
            key = "m",
            mods = "LEADER",
            action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }),
        },
        { key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
        {
            key = ",",
            mods = "LEADER",
            action = act.PromptInputLine({
                description = "Enter new name for tab",
                initial_value = "",
                action = wezterm.action_callback(function(window, pane, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            }),
        },
        {
            key = "$",
            mods = "LEADER|SHIFT",
            action = act.PromptInputLine({
                description = wezterm.format({
                    { Attribute = { Intensity = "Bold" } },
                    { Foreground = { AnsiColor = "Fuchsia" } },
                    { Text = "Enter name for new workspace" },
                }),
                action = wezterm.action_callback(function(window, pane, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        window:perform_action(
                            act.SwitchToWorkspace({
                                name = line,
                            }),
                            pane
                        )
                    end
                end),
            }),
        },
        {
            key = "W",
            mods = "LEADER|SHIFT",
            action = wezterm.action_callback(function(window, pane)
                local tab = window:mux_window():active_tab()
                tab:set_title("nvim")

                local ssh_tab = window:mux_window():spawn_tab({})
                ssh_tab:set_title("ssh")

                local git_tab = window:mux_window():spawn_tab({})
                git_tab:set_title("git")
            end),
        },
        {
            key = "r",
            mods = "LEADER|CTRL",
            action = act.EmitEvent("restore-workspaces"),
        },
    }

    for i = 1, 9 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "LEADER",
            action = act.ActivateTab(i - 1),
        })
    end

    config.key_tables = {
        resize_pane = {
            { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
            { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
            { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
            { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
            { key = "Escape", action = "PopKeyTable" },
            { key = "Enter", action = "PopKeyTable" },
        },
        move_tab = {
            { key = "h", action = act.MoveTabRelative(-1) },
            { key = "l", action = act.MoveTabRelative(1) },
            { key = "Escape", action = "PopKeyTable" },
            { key = "Enter", action = "PopKeyTable" },
        },
    }
end

return M
