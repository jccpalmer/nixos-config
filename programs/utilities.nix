{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    age
    android-tools
    android-udev-rules
    caligula
    eza
    ffmpeg
    fzf
    gnome-tweaks
    iftop
    iotop
    jq
    lsof
    ltrace
    mpd
    ripgrep
    strace
    yq-go
 
  ];
}
