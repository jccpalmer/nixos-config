# NixOS configuration #
#######################

{ config, pkgs, inputs, modules, ... }:

{
  imports =
    [
      ./hosts/hardware-configuration-thinkpad.nix
      inputs.home-manager.nixosModules.default
    ];

  # Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set the NIX_PATH
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=${config.users.users.jordan.home}/.nixos/config/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
    "home-manager=/nix/var/nix/profiles/per-user/root/channels/home-manager"
  ];

  # Enable Flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "xana-nix"; # Define your hostname.
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
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the GNOME desktop environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.gnome.sessionPath = [ pkgs.gnome-menus ];

  # Enable the KDE Plasma desktop environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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
  # Enable ZSH.
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jordan = {
    isNormalUser = true;
    description = "JC Palmer";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "kvm"
      "adbusers"
    ];
    shell = pkgs.zsh;
 #  packages = with pkgs; [
 #  ];
  };

  # Install and enable Firefox.
  programs.firefox.enable = true;

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Allow insecure packages.
  nixpkgs.config.permittedInsecurePackages = [
    "electron-28.3.3"
    "electron-27.3.11"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    neovim
    zsh
    pass
    fprintd
    libvirt
    qemu
    virt-manager
    spice
  ];

  # Enable Android connection.
  programs.adb.enable = true;

  # Enable Steam.
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable automatic upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Set neovim as the default editor.
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  environment.variables.EDITOR = "neovim";

  # Enable GCR.
  services.dbus.packages = [ pkgs.gcr ];

  # Enable fprintd.
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;

  # Enable virtualization.

  ## Enable libvirt.
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
	runAsRoot = true;
	swtpm.enable = true;
	ovmf = {
        enable = true;
	  packages = [(pkgs.OVMF.override {
          secureBoot = true;
	    tpmSupport = true;
	  }).fd];
	};
    };
  };

  ## Enable nested virtualization.
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  ## Enable VirtioFS.
  virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];

  ## Enable Spice USB redirection.
  virtualisation.spiceUSBRedirection.enable = true;

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
