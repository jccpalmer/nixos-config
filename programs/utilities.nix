{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
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
    strace
    yq-go 
  ];
}
