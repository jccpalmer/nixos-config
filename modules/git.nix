{ config, pkgs, agenix, ... }:

{
  programs.git = {
    enable = true;
    userName = "Jace Palmer";
    userEmail = "me@jccpalmer.com";
  };
}
