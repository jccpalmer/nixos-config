{ config, pkgs, nvf, ... }:

{

  imports = [
#   ./lang.nix
  ];

  programs.nvf = {
    enable = true;
    enableManpages = true;
  };

}
