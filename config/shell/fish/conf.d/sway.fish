if [ (tty) = "/dev/tty1" ]
 set -gx SDL_VIDEODRIVER wayland
 set -gx QT_QPA_PLATFORM wayland
 set -gx XDG_CURRENT_DESKTOP sway
 set -gx XDG_SESSION_DESKTOP sway
 set -gx DESKTOP_SESSION sway
 set -gx MOZ_ENABLE_WAYLAND 1
 set -gx MOZ_DBUS_REMOTE 1
 set -gx _JAVA_AWT_WM_NONREPARENTING 1
 pkill -9 ssh-agent
 eval (ssh-agent -c -t 15m)

 exec sway 
end

