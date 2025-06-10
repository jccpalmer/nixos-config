{ config, pkgs, nvf, ... }:

{

  vim.languages = {
    html.enable = true;
    lua.enable = true;
    markdown.enable = true;
    nix.enable = true;
    python.enable = true;
    sql.enable = true;
  };

}
