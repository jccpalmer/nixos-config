{ pkgs, lib, ... }:

{
  programs.nixvim = {
    colorschemes = {
      tokyonight = {
	  enable = true;
          package = pkgs.vimPlugins.tokyonight-nvim;
      };
      nord = {
        enable = false;
      };
    };
  };
}
