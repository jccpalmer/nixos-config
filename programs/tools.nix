{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [

    alacritty
    appflowy
    cachix
    ethtool
    ghostty
    gnome-extension-manager
    keepassxc
    kitty
    lm_sensors
    mullvad-vpn
    nextcloud-client
    pciutils
    ranger
    rmpc
    sysstat
    usbutils
    
  ];
}
