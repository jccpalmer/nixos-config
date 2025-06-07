{ pkgs, nixvim, ...}:

{
  programs.nixvim = {
    globals.mapleader = " ";
  };
}
