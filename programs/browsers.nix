{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    brave
    ungoogled-chromium

  ];
}
