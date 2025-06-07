{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    librewolf
    mullvad-browser
    ungoogled-chromium

  ];
}
