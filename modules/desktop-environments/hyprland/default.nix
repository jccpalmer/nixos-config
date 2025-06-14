{ config, lib, pkgs ... }:

{

  imports = [
    ./animations.nix
    ./autostart.nix
    ./binds.nix
    ./cursor.nix
    ./decorations.nix
    ./environments.nix
    ./general.nix
    ./gestures.nix
    ./input.nix
    ./layouts.nix
    ./misc.nix
    ./windowrules.nix
  ]

  # Enable Hyprland
  wayland.windowManager.hyprland.enable = true;
  home.sessionVariables.NIXOS_OZONE_WL = "1";

}
