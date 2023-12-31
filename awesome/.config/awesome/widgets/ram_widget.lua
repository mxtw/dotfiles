local wibox = require("wibox")
local awful = require("awful")
local colors = require("themes." .. theme).colors

ram_widget = wibox.container.background(
    awful.widget.watch(
        "bash -c 'free -h | grep Mem'",
        5,
        function(widget, stdout)
            local used = string.match(stdout, "Gi%s+(%d+[.]?[%d]*[GM]i)")
            widget:set_text(" mem " .. used .. " ")
        end
    ),
    colors.sapphire
)
ram_widget:set_fg(colors.base)

return ram_widget
