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

colors.yellow             = "#cc241d"
colors.teal               = "#458588"
colors.sky                = "#8ec07c"
colors.sapphire           = "#b8bb26"
colors.blue               = "#d3869b"
colors.lavender           = "#fabd2f"
colors.text               = "#ebdbb2"
colors.surface2           = "#3c3836"
colors.base               = "#282828"
colors.crust              = "#1d2021"

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
