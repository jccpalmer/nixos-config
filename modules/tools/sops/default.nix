{ config, pkgs, lib, secretsFile, ... }:

{
  sops = {
    defaultSopsFile = secretsFile;
    age.keyFile = "/home/jace/.config/sops/age/keys.txt";

    secrets."git/email" = {
      path = "${config.xdg.configHome}/git-email";
    };
  };
}

