{
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
      cmp = {
        autoEnableSources = false;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      dressing = {
        enable = true;
      };
      indent-o-matic.enable= true;
      lsp = {
        enable = true;

        servers = {
	  nil-ls.enable = true;
	  typst-lsp.enable = true;
        };
      };
      lualine = {
        enable = true;
	settings.options = {
	  section_separators.left = "";
	  section_separators.right = "";
	};
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
