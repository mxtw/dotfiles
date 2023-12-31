local wibox = require("wibox")
local awful = require("awful")
local colors = require("themes." .. theme).colors

local muted = false
local function set_volume_widget()
    awful.spawn.easy_async("pactl get-sink-volume @DEFAULT_SINK@", function(stdout)
        local vol = string.match(stdout, "[0-9]+%%")
        if (vol == nil) then vol = "0%" end

        if not muted then
            volume_widget.widget:set_text(" vol " .. vol .. " ")
        else
            -- TODO improve this
            volume_widget.widget:set_text(" muted ")
        end
    end)
end

volume_widget = wibox.container.background(
    awful.widget.watch(
        "pactl get-sink-volume @DEFAULT_SINK@",
        5,
        function() set_volume_widget() end
    ),
    colors.sky
)
volume_widget:set_fg(colors.base)
volume_widget:connect_signal("button::press", function(self, lx, ly, button)
    -- open pavucontrol on left click
    if button == 1 then
        awful.spawn("pavucontrol -t 3")
        -- mute on right click
    elseif button == 3 then
        if not muted then
            awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ 1")
            volume_widget.bg = colors.overlay0
            volume_widget.widget:set_text(" muted ")
            muted = not muted
        else
            awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ 0")
            volume_widget.bg = colors.sky
            set_volume_widget()
            muted = not muted
        end

        -- change volume on scroll and not muted
    elseif button == 4 and not muted then
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
        set_volume_widget()
    elseif button == 5 and not muted then
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
        set_volume_widget()
    end
end)

return volume_widget
