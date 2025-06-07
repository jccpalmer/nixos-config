{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
    ];
    extraLuaConfig = /* lua */ ''
      vim.o.termguicolors = true
      vim.cmd('colorscheme tokyonight-nvim')
      vim.g.tokyonight_background = 'hard'
    '';
  };
}
