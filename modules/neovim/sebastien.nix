{ pkgs, ... }: {
  home.packages = with pkgs; [ nodejs_22 ];
  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;
      showmode = false;
      breakindent = true;
      undofile = true;
      relativenumber = true;

      clipboard = {
        providers = {
          wl-copy.enable = true;
        };
      };
    };

    imports = [
      ./completions/cmp.nix
      ./completions/copilot.nix
      ./completions/lspkind.nix

      ./lang/treesitter.nix

      ./lsp/lsp.nix
      ./lsp/lspsaga.nix
      ./lsp/conform.nix
    ];

    plugins = {
      auto-save.enable = true;
      barbar = {
        enable = true;
        keymaps = {
          close.key = "<leader>bc";
          closeBuffersLeft.key = "<leader>blc";
          closeBuffersRight.key = "<leader>brc";
          next.key = "<leader>bn";
          previous.key = "<leader>bb";
        };
      };
      barbecue = {
        enable = true;
      };
      dressing = {
        enable = true;
      };
      indent-o-matic.enable= true;
      lualine = {
        enable = true;
        settings.options = {
          section_separators.left = "";
          section_separators.right = "";
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Find in project files";
            };
          };
          "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "Search in files";
            };
          };
        };
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^.git/"
              "node_modules"
            ];
          };
        };
      };
      typescript-tools = {
        enable = true;
      };
      typst-vim = {
        enable = true;
        keymaps = {
          watch = "<leader>Nw";
        };
        settings.pdf_viewer = "zathura";
      };

      which-key = {
        enable = true;
      };
    };
  };
}
