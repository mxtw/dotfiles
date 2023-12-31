local wibox = require("wibox")
local awful = require("awful")
local colors = require("themes." .. theme).colors

local muted = false
local function set_mic_widget()
    awful.spawn.easy_async("pactl get-source-mute @DEFAULT_SOURCE@", function(stdout)
        muted = string.match(stdout, "yes") == "yes"
    end)
    awful.spawn.easy_async("pactl get-source-volume @DEFAULT_SOURCE@", function(stdout)
        local vol = string.match(stdout, "[0-9]+%%")
        if (vol == nil) then vol = "0%" end

        if not muted then
            mic_widget.bg = colors.sky
            mic_widget.widget:set_text(" mic " .. vol .. " ")
        else
            -- TODO improve this
            mic_widget.bg = colors.overlay0
            mic_widget.widget:set_text(" mic muted ")
        end
    end)
end

mic_widget = wibox.container.background(
    awful.widget.watch(
        "pactl get-source-volume @DEFAULT_SOURCE@",
        1,
        function() set_mic_widget() end
    ),
    colors.sky
)
mic_widget:set_fg(colors.base)
mic_widget:connect_signal("button::press", function(self, lx, ly, button)
    -- open pavucontrol on left click
    if button == 1 then
        awful.spawn("pavucontrol -t 3")
        -- mute on right click
    elseif button == 3 then
        if not muted then
            awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ 1")
            mic_widget.bg = colors.overlay0
            mic_widget.widget:set_text(" mic muted ")
            muted = not muted
        else
            awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ 0")
            mic_widget.bg = colors.sky
            set_mic_widget()
            muted = not muted
        end

        -- change volume on scroll and not muted
    elseif button == 4 and not muted then
        awful.spawn("pactl set-source-volume @DEFAULT_SOURCE@ +5%")
        set_mic_widget()
    elseif button == 5 and not muted then
        awful.spawn("pactl set-source-volume @DEFAULT_SOURCE@ -5%")
        set_mic_widget()
    end
end)

return mic_widget
