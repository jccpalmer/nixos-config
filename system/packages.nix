{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    btop
    curl
    deno
    dxvk
    fastfetch
    git
    gnomeExtensions.arcmenu
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.grand-theft-focus
    gnomeExtensions.gsconnect
    gnomeExtensions.search-light
    gnomeExtensions.tailscale-qs
    gnomeExtensions.workspace-indicator
    nerdfetch
    nfs-utils
    openssl
    papers
    python3
    samba
    tree
    vim
    wget
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
    xdg-desktop-portal
    xdg-desktop-portal-gnome
  ];

}
