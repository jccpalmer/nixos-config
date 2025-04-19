{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    android-tools
    android-udev-tools
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
    straceyq-go
    
  ];
}
