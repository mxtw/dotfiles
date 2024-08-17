function launch-wayland
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=river
    eval (ssh-agent -c)
    dbus-run-session river
end
