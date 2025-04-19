{ config, pkgs, ... }:

{

  programs.git = {
    enabled = true;
    userName = "Jace Palmer";
    userEmail = "me@jccpalmer.com";

  };
}
