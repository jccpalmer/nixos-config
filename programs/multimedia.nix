{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    heroic
    lutris
    sunshine
    strawberry

  ];
}
