{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    strawberry
    heroic

  ];
}
