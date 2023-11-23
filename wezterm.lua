local wezterm = require("wezterm")
local act = wezterm.action

require("bar")

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

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
            action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "Return",
            mods = "CTRL|SHIFT|ALT",
            action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
        },

        -- navigating splits
        {
            key = "j",
            mods = "CTRL|SHIFT",
            action = act.ActivatePaneDirection("Prev")
        },
        {
            key = "k",
            mods = "CTRL|SHIFT",
            action = act.ActivatePaneDirection("Next")
        },

        -- tabs (old habits)
        {
            key = "LeftArrow",
            mods = "SHIFT",
            action = act.ActivateTabRelative(-1)
        },
        {
            key = "RightArrow",
            mods = "SHIFT",
            action = act.ActivateTabRelative(1)
        },

        -- resizing splits
        {
            key = "h",
            mods = "CTRL|SHIFT|ALT",
            action = act.AdjustPaneSize({ "Left", 5 })
        },
        {
            key = "l",
            mods = "CTRL|SHIFT|ALT",
            action = act.AdjustPaneSize({ "Right", 5 })
        },
        {
            key = "j",
            mods = "CTRL|SHIFT|ALT",
            action = act.AdjustPaneSize({ "Down", 5 })
        },
        {
            key = "k",
            mods = "CTRL|SHIFT|ALT",
            action = act.AdjustPaneSize({ "Up", 5 })
        },

        -- workspaces
        --- find workspaces
        {
            key = "m",
            mods = "CTRL|SHIFT",
            action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
        },
        {
            key = "Comma",
            mods = "CTRL|SHIFT",
            action = act.SwitchWorkspaceRelative(-1)
        },
        {
            key = "Period",
            mods = "CTRL|SHIFT",
            action = act.SwitchWorkspaceRelative(1)
        },
        --- rename workspace
        {
            key = "m",
            mods = "CTRL|SHIFT|ALT",
            action = act.PromptInputLine({
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
        {
            key = "s",
            mods = "CTRL|SHIFT",
            action = wezterm.action_callback(function(window, pane)
                local success, stdout, stderr = wezterm.run_child_process({ "zoxide", "query", "--list" })

                local dirs = {}

                for line in stdout:gmatch("([^\n]*)\n?") do
                    table.insert(dirs,
                        { id = line, label = line })
                end

                window:perform_action(
                    act.InputSelector({
                        action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
                            if not id and not label then
                                return
                            else
                                local ws_name = label:match("[^/]*$")

                                inner_window:perform_action(
                                    act.SwitchToWorkspace({
                                        name = ws_name,
                                        spawn = {
                                            label = 'Workspace: ' .. ws_name,
                                            cwd = id,
                                        },
                                    }), inner_pane
                                )
                            end
                        end),
                        choices = dirs,
                        fuzzy = true,
                        title = "Zoxide"
                    }), pane
                )
            end
            ),
        },
    }
}

for i = 1, 8 do
    -- ALT + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1),
    })
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL|ALT',
        action = act.MoveTab(i - 1),
    })
end

return config
