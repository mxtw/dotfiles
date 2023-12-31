local wibox = require("wibox")
local colors = require("themes." .. theme).colors

-- clock widget, toggle on click
local expanded_clock = false
local short_clock = " %H:%M "
local long_clock = " %a %d.%m.%Y %H:%M:%S "

local clock_widget = wibox.container.background(
    wibox.widget.textclock(short_clock),
    colors.teal
)
clock_widget:set_fg(colors.base)
clock_widget:connect_signal("button::press", function(self, lx, ly, button)
    if button == 1 then
        expanded_clock = not expanded_clock
        if expanded_clock then
            clock_widget.widget.format = long_clock
            clock_widget.widget.refresh = 1
        else
            clock_widget.widget.format = short_clock
            clock_widget.widget.refresh = 60
        end
    end
end)

return clock_widget
