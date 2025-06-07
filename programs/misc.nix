{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [
    
    bibata-cursors
    cowsay
    file
    gawk
    gnupg
    gnused
    gnutar
    nix-output-monitor
    tree
    which
    zstd

  ];
}
