{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    android-tools
    android-udev-rules
    bottles
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
    prettier
    prettier-plugin-go-template
    qbittorrent
    ripgrep
    strace
    yq-go
  ];
}
