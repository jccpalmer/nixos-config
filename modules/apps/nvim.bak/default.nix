{ config, pkgs, nixvim, lib, ... }:

{
  imports = [
    ./colorschemes.nix
    ./globals.nix
  # ./keybinds.nix
    ./options.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
