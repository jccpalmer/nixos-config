{ config, pkgs, ... }:

{
  home.username = "jace";
  home.homeDirectory = "/home/jace";

  home.packages = with pkgs; [

    nnn
    ungoogled-chromium
  
    # Archival tools
    zip
    xz
    unzip
    p7zip

    # Communication
    thunderbird
    discord

    # Multimedia
    strawberry
    heroic
    

    # Utilities
    android-tools
    android-udev-rules
    ripgrep
    jq
    yq-go
    eza
    fzf
    ffmpeg
    btop
    iotop
    iftop
    strace
    ltrace
    lsof
    tailscale
    tailscalesd
    gnome-tweaks

    # Networking tools
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc
    ktailctl

    # Misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    nix-output-monitor

    # Productivity
    hugo
    glow
    libreoffice
    obsidian
    foliate
    protonmail-bridge
    zotero
    newsflash
    joplin-desktop
    vscodium

    # System tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
    cachix
    ghostty
    nextcloud-client
    keepassxc
    gnome-extension-manager
    mullvad-vpn
  ];

  programs.git = {
    enable = true;
    userName = "Jace Palmer";
    userEmail = "me@jccpalmer.com";
  };

#  programs.chromium = {
#    enable = true;
#    package = pkgs.brave;
#    extensions = [
#      {
#        id = [ 
#          "kbmfpngjjgdllneeigpgjifpgocmfgmb"; # Reddit Enhancement Suite
#          "ponfpcnoihfmfllpaingbgckeeldkhle"; # Enhancer for YouTube
#          "kgcjekpmcjjogibpjebkhaanilehneje"; # Karakeep
#          "cjpalhdlnbpafiamejdnhcphjbkeiagm"; # uBlock Origin
#          "ekhagklcjbdpajgpjgmbionohlpdbjgc"; # Zotero
#          "cnjifjpddelmedmihgijeibhnjfabmlf"; # Obsidian
#        ];
#      }
#    ];
#    commandLineArgs = [
#      "--disbale-features=WebRtcAllowInputVolumeAdjustment"
#    ];
#  };

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
