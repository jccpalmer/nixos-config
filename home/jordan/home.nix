{ config, pkgs, nix-flatpak, ... }:

{

  imports = [
    ../../modules/alacritty.nix
    ../../modules/git.nix
    ../../modules/scripts.nix
    ../../modules/shell.nix
    ../../programs/archival.nix
    ../../programs/browsers.nix
    ../../programs/communication.nix
    ../../programs/misc.nix
    ../../programs/multimedia.nix
    ../../programs/networking.nix
    ../../programs/productivity.nix
    ../../programs/tools.nix
    ../../programs/utilities.nix
  ];

  home.username = "jordan";
  home.homeDirectory = "/home/jordan";

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";

}
