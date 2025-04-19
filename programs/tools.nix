{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [

    alacritty
    cachix
    ethtool
    ghostty
    gnome-extension-manager
    keepassxc
    lm_sensors
    mullvad-vpn
    nextcloud-client
    nnn
    pciutils
    sysstat
    usbutils
    
  ];
}
