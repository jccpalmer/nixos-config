{ config, pkgs, ... }:

{

  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
        working_directory = "None";
      };
      env = {
        TERM = "xterm-256color";
        WINIT_X11_SCALE_FACTOR = "1";
      };
      window = {
        dynamic_padding = true;
        decorations = "full";
        title = "jace@NixOS";
        opacity = 0.8;
        decorations_theme_variant = "Dark";
        dimensions = {
          columns = 100;
          lines = 30;
        };
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      colors = {
        draw_bold_text_with_bright_colors = true;
        primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };
        normal = {
          black = "#32344a";
          blue = "#7aa2f7";
          cyan = "#449dab";
          green = "#9ece6a";
          magenta = "#ad8ee6";
          red = "#f7768e";
          white = "#787c99";
          yellow = "#e0af68";
        };
        bright = {
          black = "#444b6a";
          blue = "#7da6ff";
          cyan = "#0db9d7";
          green = "#b9f27c";
          magenta = "#bb9af7";
          red = "#ff7a93";
          white = "#acb0d0";
          yellow = "#ff9e64";
        };
      };
      font = {
        size = 12;
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
        bold_italic = {
          family = "monospace";
          style = "Bold Italic";
        };
      };
      selection = {
        semantic_escape_chars = ",|`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
      };
      cursor = {
        style = "Underline";
        vi_mode_style = "None";
        unfocused_hollow = true;
        thickness = 0.15;
      };
      mouse = {
        hide_when_typing = true;
        bindings = {
          mouse = "Middle";
          action = "PasteSelection";
        };
      };
    };
  };
}
