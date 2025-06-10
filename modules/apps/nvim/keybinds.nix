{ config, pkgs, nixvim, ... }:

{
  programs.nixvim = {
    keymaps = [
      
      # Files
      {
        mode = "n";
        key = "<leader>gf";
        action = "<cmd>e <cfile><CR>";
        options.desc = "Go to file";
      }

      # Indent selection
      {
        mode = "x";
        key = ">";
        action = ">gv";
        options.desc = "Indent selection";
      }
      {
        mode = "x";
        key = "<";
        action = "<gv";
        options.desc = "Deindent selection";
      }

      # Quickfix
      {
        mode = "n";
        key = "<leader>qo";
        action = "<cmd>Copen<CR>";
        options.desc = "Quickfix open";
      }
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>cclose<CR>";
        options.desc = "Quickfix quit";
      }
      {
        mode = "n";
        key = "<leader>qk";
        action = "<cmd>cprev<CR>";
        options.desc = "Quickfix previous";
      }
      {
        mode = "n";
        key = "<leader>qj";
        action = "<cmd>cnext<CR>";
        options.desc = "Quickfix next";
      }

      # Diagnostics
      {
        mode = "n";
        key = "<leader>dj";
        action =
          mkRaw ''
            vim.diagnostic.goto_next
          '';
        options.desc = "Diagnostics next";
      }
      {
        mode = "n";
        key = "<leader>dk";
        action =
          mkRaw ''
            vim.diagnostic.goto_prev
          '';
        options.desc = "Diagnostics previous";
      }
      {
        mode = "n";
        key  = "<leader>xs";
        action =
          mkRaw ''
            function () require('trouble').toggle_preview('symbols') end
          '';
        options.desc = "Toggle diagnostics trouble";
      }
      {
        mode = "n";
        key = "<leader>xd";
        action =
          mkRaw ''
            function() require('trouble').toggle_preview('diagnostics') end
          '';
        options.desc = "Toggle diagnostics trouble";
      }
      {
        mode = "n";
        key = "<leader>xq";
        action =
          mkRaw ''
            function() require('trouble').toggle_preview('quickfix') end
          '';
        options.desc = "Toggle Quickfix trouble";
      }
      {
        mode = "n";
        key = "<leader>xl";
        action =
          mkRaw ''
            function() require('trouble').toggle_preview('loclist') end
          '';
        options.desc = "Toggle Loclist trouble";
      }
      {
        mode = "n";
        key = "gR";
        action =
          mkRaw ''
            function() require('trouble').toggle_preview('lsp_references') end
          '';
        options.desc = "Toggle LSP References trouble";
      }
      
      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action =
          mkRaw ''
            require('telescope.builtin').find_files
          '';
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action =
          mkRaw ''
            require('telescope.builtin').live_grep
          '';
        options.desc = "Find grep";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action =
          mkRaw ''
            require('telescope.builtin').help_tags
          '';
        options.desc = "Find help";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action =
          mkRaw ''
            require('telescope.builtin').buffers
          '';
        options.desc = "Find buffer";
      }
      {
        mode = "n";
        key = "<leader>fd";
        action =
          mkRaw ''
            require('telescope.builtin').diagnostics
          '';
        options.desc = "Find diagnostics";
      }
      {
        mode = "n";
        key = "<leader>fq";
        action =
          mkRaw ''
            require('telescope.builtin').quickfix
          '';
        options.desc = "Find quickfix";
      }
    ];
  };
}
