{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    librewolf
    qutebrowser
    ungoogled-chromium
    widevine-cdm

  ];
}
