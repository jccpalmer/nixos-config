{ lib, config, options, ... }:

let
  cfg = config.steam;

  # Robust way to access pkgs:
  pkgs = config._module.args.pkgs or (throw "steam.nix module requires pkgs passed via specialArgs.pkgs");

in
{
  options.steam = {
    enable = lib.mkEnableOption "Enable Steam in NixOS";

    enableNative = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable native Steam client";
    };

    enableSteamBeta = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Steam beta client";
    };

    fixDownloadSpeed = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Apply workaround for slow download speeds";
    };

    username = lib.mkOption {
      type = lib.types.str;
      description = "Username for Home Manager user config.";
    };

    extraCompatPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [ proton-ge-bin ];
      description = "Additional Steam compatibility packages";
    };

    extraLibraries = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        alsa-lib libGL SDL SDL_image SDL_mixer SDL_ttf
        SDL2 SDL2_image SDL2_mixer SDL2_ttf
        xorg.libX11 xorg.libxcb xorg.libXcursor xorg.libXi
        xorg.libXinerama xorg.libXext xorg.libXrandr xorg.libXrender
        xorg.libXScrnSaver libpng libpulseaudio libvorbis
        stdenv.cc.cc.lib libkrb5 keyutils
      ];
      description = "Extra libraries required by Steam";
    };

    extraPkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [ bibata-cursors ];
      description = "Additional packages for the Steam environment";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.java.enable = true;

    programs.steam = {
      enable = cfg.enableNative;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = cfg.extraCompatPackages;
      gamescopeSession.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      package = pkgs.steam.override {
        extraBwrapArgs = [ "--unsetenv TZ" ];
        extraLibraries = pkgs: cfg.extraLibraries;
        extraPkgs = pkgs: cfg.extraPkgs;
      };
      protontricks.enable = true;
      remotePlay.openFirewall = true;
    };

    # Only apply Home Manager config if home-manager is active
    assertions = [
      {
        assertion = config ? home-manager.users;
        message = "steam.nix requires Home Manager to be enabled.";
      }
    ];

    home-manager.users.${cfg.username} = { pkgs, config, ... }: {
      home = {
        file = {
          steam-beta = lib.mkIf cfg.enableSteamBeta {
            text = "publicbeta";
            target = "${config.xdg.dataHome}/Steam/package/beta";
          };

          steam-slow-fix = lib.mkIf cfg.fixDownloadSpeed {
            text = ''
              @nClientDownloadEnableHTTP2PlatformLinux 0
              @fDownloadRateImprovementToAddAnotherConnection 1.0
            '';
            target = "${config.xdg.dataHome}/Steam/steam_dev.cfg";
          };
        };

        packages = with pkgs; [
          steamtinkerlaunch
          gawk
          procps
          unixtools.xxd
          xdotool
          xorg.xprop
          xorg.xrandr
          xorg.xwininfo
          yad
        ];
      };
    };
  };
}

