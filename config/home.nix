# NixOS Home Manager configuration #
####################################

  { config, pkgs, lib, flake-inputs, ... }:

  {

    # Imports
    imports = [
      ../modules/protonmail-bridge.nix
	../modules/mail.nix
    ];

    # Home Manager settings
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";

    # User settings
    home.username = "jordan";
    home.homeDirectory = "/home/jordan";

    # File settings
#    home.file."isyncrc" = {
#      source = ./isyncrc;
#	target = "~/.config/.isynrc";
#    };

    # User package management
    home.packages = with pkgs; [
      
      # Archival tools
      zip
      xz
      unzip
      p7zip

      # Networking tools
      mtr
      iperf3
      dnsutils
      ldns
      aria2
      socat
      nmap
      ipcalc

      # Utilities
      fastfetch
      nnn
      ripgrep
      jq
      yq-go
      fzf

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

      # Nix
      nix-output-monitor

      # Emacs
#     emacs
	mu
	isync
	offlineimap

      # Productivity
      libreoffice-fresh
      bitwarden
      logseq
      hugo
      glow
      protonmail-bridge
      mullvad-vpn
      nextcloud-client
	vscodium

      # Browser
      brave

      # System monitors
      btop
      iotop
      iftop
      strace
      ltrace
      lsof

      # System tools
      sysstat
      lm_sensors
      ethtool
      pciutils
      usbutils
      pinentry-gnome3
      tmux

      # Gaming
      steam
      lutris
      #heroic
      protonup-qt
      protontricks
      discord
      gamemode
      gamescope

      # WINE
      wine
      winetricks

      # Photos
      gimp
      darktable

      # ZSH settings
      oh-my-zsh
      zsh-autosuggestions
      zsh-syntax-highlighting

	# GNOME additions
	gnome-tweaks
	seahorse

	# Website
	hugo
    ];

    # Programs

    programs.git = {
      enable = true;
      userName = "JC Palmer";
      userEmail = "me@jccpalmer.com";
    };

    programs.zsh = {
      enable = true;
  #   enableCompletion = true;
  #   autosuggestions.enable = true;
  #   syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
	  u = "sudo nixos-rebuild switch --flake ~/.nixos/config";
   	  n = "nvim";
   	  s = "sudo";
	  x = "nix flake update --flake ~/.config/nixos";
	  g = "git push";
	  gp = "git pull";
	  gc = "git commit -m";
      };
    };

    programs = {
      mu.enable = true;
	msmtp.enable = true;
	mbsync.enable = true;
    };

    programs.emacs = {
      enable = true;
      extraPackages = epkgs: [
	  epkgs.mu4e
	];
    };

    # Services

    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    

    services.protonmail-bridge = {
      enable = true;
      #package =
        #pkgs.runCommand "protonmail-bridge" {
	    #bridge = pkgs.protonmail-bridge;
	    #nativeBuildInputs = [ pkgs.makeWrapper ];
	  #}
	  #''
	  #mkdir -p $out/bin
	  #makeWrapper $bridge/bin/protonmail-bridge $out/bin/protonmail-bridge \
	  #  --set PATH ${lib.strings.makeBinPath [ pkgs.kdePackages.kwalletmanager ]}
        #'';
    };

    # SystemD configuration

    systemd.user.startServices = "sd-switch";

    # Dconf

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
	  uris = ["qemu:///system"];
	};
    };

    # Overlays

    nixpkgs.overlays = [
      (
        final: prev: {
	    logseq = prev.logseq.overrideAttrs (oldAttrs: {
	      postFixup = ''
	        makeWrapper ${prev.electron_20}/bin/electron $out/bin/${oldAttrs.pname} \
	        --set "LOCAL_GIT_DIRECTORY" ${prev.git} \
		  --add-flags $out/share/${oldAttrs.pname}/resources/app \
		  --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
		  --prefix LD_LIBRARY_PATH : "${prev.lib.makeLibraryPath [ prev.stdenv.cc.cc.lib ]}"
	        '';
	      });
	    }
        )
      ];
  }
