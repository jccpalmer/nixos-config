{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [

      # Actions
      "$mainMod, RETURN, exec, kitty" # Open Kitty terminal window
      "$mainMod, Q, killactive" # Kill active window
      "$mainMod, M, exit" # Kill Hyprland
      "$mainMod, E, exec, nautilus" # Open File Manager
      "$mainMod, T, togglefloating" # Toggle between tiling and floating windows
      "$mainMod, F, fullscreen" # Open the window in fullscreen
      "$mainMod CTRL, RETURN, exec, rofi -show drun" # Open Rofi
      "$mainMod, P, pseudo" # Dwindle
      "$mainMod, J, togglesplit" # Dwindle
      "$mainMod, B, exec, chromium" # Open Chromium
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+" # Raise volume
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-" # Lower volume

      # Move window focus
      "$mainMod, left, movefocus, l" # Move focus left
      "$mainMod, right, movefocus, r" # Move focus right
      "$mainMod, up, movefocus, u" # Move focus up
      "$mainMod, down, movefocus, d" # Move focus down

      # Switch workspaces
      "$mainMod, 1, workspace, 1" # Switch to workspace 1
      "$mainMod, 2, workspace, 2" # Switch to workspace 2
      "$mainMod, 3, workspace, 3" # Switch to workspace 3
      "$mainMod, 4, workspace, 4" # Switch to workspace 4
      "$mainMod, 5, workspace, 5" # Switch to workspace 5
      "$mainMod, 6, workspace, 6" # Switch to workspace 6
      "$mainMod, 7, workspace, 7" # Switch to workspace 7
      "$mainMod, 8, workspace, 8" # Switch to workspace 8
      "$mainMod, 9, workspace, 9" # Switch to workspace 9
      "$mainMod, 0, workspace, 10" # Switch to workspace 10

      # Move active window to another workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1" # Move to workspace 1
      "$mainMod SHIFT, 2, movetoworkspace, 2" # Move to workspace 2
      "$mainMod SHIFT, 3, movetoworkspace, 3" # Move to workspace 3
      "$mainMod SHIFT, 4, movetoworkspace, 4" # Move to workspace 4
      "$mainMod SHIFT, 5, movetoworkspace, 5" # Move to workspace 5
      "$mainMod SHIFT, 6, movetoworkspace, 6" # Move to workspace 6
      "$mainMod SHIFT, 7, movetoworkspace, 7" # Move to workspace 7
      "$mainMod SHIFT, 8, movetoworkspace, 8" # Move to workspace 8
      "$mainMod SHIFT, 9, movetoworkspace, 9" # Move to workspace 9
      "$mainMod SHIFT, 0, movetoworkspace 10" # Move to workspace 10

      # Scroll through existing workspaces
      "$mainMod, mouse_down, workspace, e+1" # Scroll up through workspaces
      "$mainMod, mouse_up, workspace, e-1" # Scroll down through workspaces
    
    ]

    bindm = [
      "$mainMod, mouse:272, movewindow" # Move window
      "$mainMod, mouse:272, resizewindow" # Resize window
    ]
  };
}
