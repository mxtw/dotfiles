---------------------------
-- Gruvbox awesome theme --
---------------------------

local theme_assets        = require("beautiful.theme_assets")
local xresources          = require("beautiful.xresources")
local gears               = require("gears")
local dpi                 = xresources.apply_dpi

local gfs                 = require("gears.filesystem")
local themes_path         = gfs.get_themes_dir()

local theme               = {}
local colors              = {}

-- colors.rosewater          = "#f5e0dc"
-- colors.flamingo           = "#f2cdcd"
-- colors.pink               = "#f5c2e7"
-- colors.mauve              = "#cba6f7"
-- colors.mauve_dark         = "#8839ef"
-- colors.red                = "#f38ba8"
-- colors.maroon             = "#eba0ac"
-- colors.peach              = "#fab387"
colors.yellow             = "#f9e2af"
-- colors.green              = "#a6e3a1"
colors.teal               = "#94e2d5"
colors.sky                = "#89dceb"
colors.sapphire           = "#74c7ec"
colors.blue               = "#89b4fa"
colors.lavender           = "#b4befe"
-- colors.lavender_dark      = "#7287fd"
colors.text               = "#cdd6f4"
-- colors.subtext1           = "#bac2de"
-- colors.subtext0           = "#a6adc8"
colors.overlay2           = "#9399b2"
colors.overlay1           = "#7f849c"
colors.overlay0           = "#6c7086"
colors.surface2           = "#585b70"
-- colors.surface1           = "#45475a"
-- colors.surface0           = "#313244"
colors.base               = "#1e1e2e"
-- colors.mantle             = "#181825"
colors.crust              = "#11111b"
-- colors.transparent        = "#00000000"

theme.font                = "Hack 10"

theme.bg_normal           = colors.base
theme.bg_focus            = colors.lavender
theme.bg_urgent           = colors.yellow
theme.bg_minimize         = colors.overlay0
theme.bg_systray          = colors.base

theme.fg_normal           = colors.text
theme.fg_focus            = colors.crust
theme.fg_urgent           = colors.crust
theme.fg_minimize         = colors.text

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(2)
theme.border_normal       = colors.base
theme.border_focus        = colors.lavender
theme.border_marked       = colors.yellow

theme.taglist_bg_focus    = colors.lavender
theme.taglist_fg_focus    = colors.crust
theme.taglist_bg_occupied = colors.base
theme.taglist_fg_occupied = colors.lavender
theme.taglist_bg_empty    = colors.base
theme.taglist_fg_empty    = colors.surface2

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]

theme.menu_height         = dpi(15)
theme.menu_width          = dpi(100)
theme.colors              = colors

return theme
