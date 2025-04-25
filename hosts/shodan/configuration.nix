# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
#      ./cachix.nix
#      ../../programs/flatpak.nix
    ];

  # Boot.
  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    # Switch Linux kernels.
    kernelPackages = pkgs.linuxPackages_zen;

    # Enable Silent Boot.
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Default shell.
  users.users.jace.shell = pkgs.zsh;
  users.users.jace.ignoreShellProgramCheck = true;

  networking.hostName = "shodan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable Flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jace = {
    isNormalUser = true;
    description = "Jace";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install Steam and its extras.
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Install Gamemode.
  programs.gamemode.enable = true;

  # Install Hyprland
  programs.hyprland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    neovim
    fish
    python3
    ispell
    tree
    btop
    fastfetch
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
    dxvk
    samba
    nfs-utils
    hyprland
    kitty
    gnomeExtensions.arcmenu
    openssl
    jdk8
    jdk21
    papers
    deno
    docker
    inputs.nix-gaming.packages.${pkgs.system}.mo2installer
    brave
    mangohud
    protonup
    heroic
    lutris
    bottles
    pinentry-curses
    linuxKernel.kernels.linux_zen
    nerdfetch
  ];

  # Fonts.
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
    meslo-lgs-nf
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
    enable = true;
#    pinentryPackage = "pinentry-curses";
    enableSSHSupport = true;
  };

  # Virtualization settings.
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["jace"];
  
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.docker.enable = true;

  # List services that you want to enable:

  # Enable Flatpak.
  services.flatpak= {
    enable = true;
    packages = [
      "io.appflowy.AppFlowy"
    ];
    update.onActivation = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable PCSCD.
  services.pcscd.enable = true;

  # Enable Mullvad VPN.
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Enable systemd-resolved.
  services.resolved.enable = true;

  # Enable Tailscale VPN.
  services.tailscale.enable = true;

  # Enable Ollama.
  services.ollama = {
    enable = true;
    loadModels = [ "llama3.1:8b" ];
  };

  # XDG Desktop Portal.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Environment variables.
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
