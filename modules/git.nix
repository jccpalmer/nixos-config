{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Jace Palmer";
    userEmail = "me@jccpalmer.com";
  };
}
