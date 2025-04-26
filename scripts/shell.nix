# shell.nix
{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "af-ollama-plugin-env";
  targetPkgs = pkgs: [ pkgs.ollama ];
  runScript = "/usr/local/bin/af_ollama_plugin";
}).env

