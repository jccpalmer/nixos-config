{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    foliate
    glow
    hugo
    joplin-desktop
    libreoffice
    newsflash
    obsidian
    zotero

  ];
}
