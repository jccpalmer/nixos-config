{ config, flake-inputs, nix-flatpak, ... }:

{

  imports = [ ../flake.nix flake-inputs.flatpaks.nixosModules.nix-flatpak  ]; 

  services = {
    flatpak.packages = [
      "io.appflowy.AppFlowy"
    ];
  };

}
