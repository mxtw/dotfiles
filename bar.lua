local wezterm = require("wezterm")

function kubernetes_context()
    local success, stdout, stderr = wezterm.run_child_process({ "kubectl", "config", "current-context" })

    if not success then return "" end

    stdout = string.gsub(stdout, "\n", "")


    return wezterm.format({
        { Foreground = { Color = "#1e1e2e" } },
        { Background = { Color = "#89b4f1" } },
        { Text = " ⎈ " .. stdout .. " " },
    })
end

function workspace(window)
    local aw = window:active_workspace()
    local wl = wezterm.mux.get_workspace_names()

    local res = ""

    for idx, name in pairs(wl) do
        if name == aw then
            res = aw .. " [" .. idx .. "/" .. #(wl) .. "]"
        end
    end

    return wezterm.format({
        { Foreground = { Color = "#1e1e2e" } },
        { Background = { Color = "#b4befe" } },
        { Text = " 󰇄  " .. res .. " " },
    })
end

wezterm.on("update-right-status", function(window, pane)
    -- display current workspace in tab bar

    local k8s_context = kubernetes_context()
    local workspace = workspace(window)

    window:set_right_status(k8s_context .. workspace)
end)
