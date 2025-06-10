{ config, pkgs, ... }:

{

  imports = [
    ./apps/alacritty/alacritty.nix
    ./apps/kitty/kitty.nix
    ./desktop-environments/gnome/gnome.nix
    ./tools/git/git.nix
    ./tools/scripts/scripts.nix
  # ./tools/sops/sops.nix
    ./tools/zsh/sh.nix
  ];

}
