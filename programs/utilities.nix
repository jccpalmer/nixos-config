{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
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
    sops
    strace
    yq-go 
  ];
}
