{ config, pkgs, ... }:

let
  secretsDir = ../secrets;
in {
  age.secrets.git-email = {
    file = "${secretsDir}/git-email.age";
    mode = "0440";
    owner = "jace";
    group = "users";
  };
}
