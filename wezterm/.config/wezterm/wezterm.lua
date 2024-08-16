local wezterm = require("wezterm")

local config = {
    color_scheme = "Catppuccin Mocha",
    colors = {
        tab_bar = {
            background = "rgba(30, 30, 46, 0.90)", -- "#1e1e2e"
            active_tab = {
                bg_color = "#b4befe",
                fg_color = "#1e1e2e",
            },
            inactive_tab = {
                bg_color = "rgba(30, 30, 46, 0.90)", -- #1e1e2e",
                fg_color = "#b4befe",
            }
        }
    },
    font = wezterm.font("Hack"),
    font_size = 17.0,
    window_background_opacity = 0.90,
    enable_wayland = true,
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    warn_about_missing_glyphs = false,
    show_new_tab_button_in_tab_bar = false,
}

return config
