{ config, pkgs, nixvim, ... }:

{
  programs.nixvim = {
    colorschemes.tokyonight.enable = true;
  };
}
