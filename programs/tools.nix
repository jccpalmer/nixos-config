{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [

    alacritty
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
