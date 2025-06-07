{ config, pkgs, lib, ... }:

let
  fromGithub = import ./functions/fromGithub.nix;

in
  
{
  imports = [
    ./colors.nix
    ./options.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
