{ config, pkgs, ... }:

{
  
  home.packages = with pkgs; [

    discord
    protonmail-bridge
    thunderbird

  ];
}
