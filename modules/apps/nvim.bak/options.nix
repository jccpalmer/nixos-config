{ config, pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.cursorline = true
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 4
    '';
  };
}
