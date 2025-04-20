{ config, pkgs, agenix, ... }:

let
  gitEmailPath = agenix.getSecretPath "git-email.age";
  gitEmail = builtins.readFile gitEmailPath;
in {
  programs.git = {
    enable = true;
    userName = "Jace Palmer";
    userEmail = gitEmail;
  };
}
