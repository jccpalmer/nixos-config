{
  description = "Steam config module for NixOS";

  outputs = { self, nixpkgs }: {
    nixosModules.steam = import ./steam.nix;
  };
}

