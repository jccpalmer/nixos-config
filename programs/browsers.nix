{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    librewolf
    mullvad-browser
    qutebrowser
    ungoogled-chromium
    widevine-cdm

  ];
}
