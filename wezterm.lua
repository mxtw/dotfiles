local wezterm = require("wezterm")

require("bar")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

local config = {
    color_scheme = "Catppuccin Mocha",
    colors = {
        tab_bar = {
            background = "rgba(30, 30, 46, 0.92)", -- "#1e1e2e"
            active_tab = {
                bg_color = "#b4befe",
                fg_color = "#1e1e2e",
            },
            inactive_tab = {
                bg_color = "rgba(30, 30, 46, 0.92)", -- #1e1e2e",
                fg_color = "#b4befe",
            }
        }
    },
    font = wezterm.font("Hack"),
    font_size = 17.0,
    window_background_opacity = 0.92,
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    warn_about_missing_glyphs = false,
    show_new_tab_button_in_tab_bar = false,
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

for i = 1, 8 do
    -- ALT + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = wezterm.action.ActivateTab(i - 1),
    })
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL|ALT',
        action = wezterm.action.MoveTab(i - 1),
    })
end

return config
