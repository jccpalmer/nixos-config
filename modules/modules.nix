{ config, pkgs, ... }:

{

  imports = [
    ./apps/alacritty/default.nix
    ./apps/kitty/default.nix
  # ./apps/steam/default.nix
    ./desktop-environments/gnome/default.nix
    ./tools/git/default.nix
    ./tools/scripts/default.nix
  # ./tools/sops/default.nix
    ./tools/zsh/default.nix
  ];

}
