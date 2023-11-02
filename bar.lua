local wezterm = require("wezterm")

function kubernetes_context()
    local success, stdout, stderr = wezterm.run_child_process({ "kubectl", "config", "current-context" })

    if not success then return "" end

    stdout = string.gsub(stdout, "\n", "")


    return wezterm.format({
        { Foreground = { Color = "#1e1e2e" } },
        { Background = { Color = "#89b4f1" } },
        { Text = " " .. stdout .. " " },
    })
end

function workspace(window)
    return wezterm.format({
        { Foreground = { Color = "#1e1e2e" } },
        { Background = { Color = "#b4befe" } },
        { Text = " " .. window:active_workspace() .. " " },
    })
end

wezterm.on("update-right-status", function(window, pane)
    -- display current workspace in tab bar

    local k8s_context = kubernetes_context()
    local workspace = workspace(window)

    window:set_right_status(k8s_context .. workspace)
end)
