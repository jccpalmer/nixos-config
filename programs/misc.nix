{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [

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
