local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
    -- display current workspace in tab bar
    local ws = window:active_workspace()
    window:set_right_status(wezterm.format {
        { Text = ws },
    })
end)

return {
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font("Hack"),
    font_size = 17.0,
    -- window_background_opacity = 0.95,
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    warn_about_missing_glyphs = false,
    keys = {

        -- splits
        {
            key = "Return",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "Return",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },

        -- navigating splits
        {
            key = "j",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivatePaneDirection("Prev")
        },
        {
            key = "k",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivatePaneDirection("Next")
        },

        -- tabs (old habits)
        {
            key = "LeftArrow",
            mods = "SHIFT",
            action = wezterm.action.ActivateTabRelative(-1)
        },
        {
            key = "RightArrow",
            mods = "SHIFT",
            action = wezterm.action.ActivateTabRelative(1)
        },

        -- resizing splits
        {
            key = "h",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.AdjustPaneSize({ "Left", 5 })
        },
        {
            key = "l",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.AdjustPaneSize({ "Right", 5 })
        },
        {
            key = "j",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.AdjustPaneSize({ "Down", 5 })
        },
        {
            key = "k",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.AdjustPaneSize({ "Up", 5 })
        },

        -- workspaces
        --- find workspaces
        {
            key = "m",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
        },
        --- rename workspace
        {
            key = "m",
            mods = "CTRL|SHIFT|ALT",
            action = wezterm.action.PromptInputLine({
                description = 'Enter new name for workspace ' .. wezterm.mux.get_active_workspace(),
                action = wezterm.action_callback(
                    function(window, pane, line)
                        if line then
                            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
                        end
                    end
                )
            }),
        },
    }
}
