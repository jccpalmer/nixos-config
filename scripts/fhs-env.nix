# fhs-env.nix
let
  pkgs = import <nixpkgs> {};
in
pkgs.buildFHSUserEnv {
  name = "appflowy-plugin-env";
  targetPkgs = pkgs: with pkgs; [
    glibc
    zlib
  ];
#  runScript = "/usr/local/bin/af_ollama_plugin";
  runScript = "bash";
}

