{ config, pkgs, nixvim, ...}:

{
  programs.nixvim = {
    plugins = {
      telescope.enable = true;
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          go
          json
          lua
          make
          markdown
          markdown_inline
          nix
          regex
          toml 
          vim
          vimdoc
          xml
          yaml
        ];
      };

      tinygit.enable = true;
      quickmath.enable = true;
  #   qmk.enable = true;
      actions-preview.enable = true;
      aerial.enable = true;
      auto-save.enable = true;
      auto-session.enable = true;
      autoclose.enable = true;
      barbar.enable = true;
      blink-cmp.enable = true;
      bullets.enable = true;
      indent-blankline.enable = true;
      markdown-preview.enable = true;
      neo-tree.enable = true;
      nix.enable = true;
      nvim-surround.enable = true;

      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          icons = {
            style = "glyph";
          };
        };
      };
    };
  };
}
