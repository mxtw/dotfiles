local wibox = require("wibox")
local awful = require("awful")
local colors = require("themes." .. theme).colors


-- cpu widget
local cpu_widget = wibox.container.background(
    awful.widget.watch(
        "bash -c 'top -bn1 | grep Cpu'",
        5,
        function(widget, stdout)
            local usg = string.match(stdout, "(%d+.%d+)")
            widget:set_text(" cpu " .. usg .. "% ")
        end
    ),
    colors.blue
)
cpu_widget:set_fg(colors.base)

return cpu_widget
