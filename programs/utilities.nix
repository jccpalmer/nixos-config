{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    android-tools
    android-udev-rules
    btop
    eza
    ffmpeg
    fzf
    gnome-tweaks
    iftop
    iotop
    jq
    lsof
    ltrace
    ripgrep
    sops
    strace
    yq-go 
  ];
}
