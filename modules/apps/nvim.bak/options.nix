{ pkgs, nixvim, ...}:

{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      shiftwidth = 4;
      wrap = true;
      splitright = true;
      smarttab = true;
      autoindent = true;
      smartindent = true;
      wildmenu = true;
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      exrc = true;
    };
  };
}
