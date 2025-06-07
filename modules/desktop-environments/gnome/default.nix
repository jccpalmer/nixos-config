{ config, lib, pkgs, ... }:

{

# home.packages = with pkgs; [
#   gnomeExtensions.appindicator
#   gnomeExtensions.blur-my-shell
#   gnomeExtensions.BrowserSearchProvider
#   gnomeExtensions.caffeine
#   gnomeExtensions.dash-to-dock
#   gnomeExtensions.drive-menu
#   gnomeExtensions.grand-theft-focus
#   gnomeExtensions.gsconnect
#   gnomeExtensions.search-light
#   gnomeExtensions.tailscale-qs
#   gnomeExtensions.workspace-indicator
# ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "arcmenu@arcmenu.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
#         "BrowserSearchProvider@mepowerleo10.github.io"
          "caffeine@patapon.info"
          "dash-to-dock@micxgx.gmail.com"
#         "drive-menu@gnome-shell-extensions.gcampax.github.com"
          "grand-theft-focus@zalckos.github.com"
          "gsconnect@andyholmes.github.io"
          "search-light@icedman.github.com"
          "tailscale@joaophi.github.com"
          "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/mutter" = {
        experimental-features = [
          "scale-monitor-framebuffer"
          "variable-refresh-rate"
        ];
      };
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "bibata-cursors";
    size = 24;
  };

}
