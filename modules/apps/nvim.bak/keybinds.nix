{ config, pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = ''
      vim.g.mapleader = " "
    '';
  };
}
