{ lib, channels, nixvim }:
let
  modules = lib.snowfall.module.create-modules { src = "${./../../modules/nixvim}"; };

  enabled = { enable = true; };
  autoCmd = {
    indentOverride = pattern: expandTab: spaces: {
      inherit pattern;
      event = [ "FileType" ];
      command = lib.concatStringsSep " " [
        "setlocal"
        "tabstop=${toString spaces}"
        "softtabstop=${toString spaces}"
        "shiftwidth=${toString spaces}"
        (if expandTab then "expandtab" else "noexpandtab")
      ];
    };
  };

in
nixvim.makeNixvimWithModule {
  module = {
    imports = lib.attrValues modules;

    config = {
      minuszero.plugins = {
        lsp = enabled;
      };

      plugins = {
        # luasnip = enabled;
        gitsigns = enabled;
        nvim-autopairs = enabled;
        nvim-colorizer = enabled;
        comment = enabled;
        # harpoon = enabled;
        todo-comments = enabled;
        surround = enabled;
        fugitive = enabled;
        # abolish = enabled;
        # easy-align = enabled;
        # vim-repeat = enabled;
      };

      colorschemes.catppuccin = {
        enable = true;
	flavour = "mocha";
      };

      editorconfig.enable = true;

      clipboard = {
        register = [ "unnamed" "unnamedplus" ];
        providers.wl-copy.enable = true;
      };

      globals.mapleader = " ";

      opts = {
        number = true;
        relativenumber = true;
        laststatus = 1;
        scrolloff = 5;
        incsearch = true;
        hlsearch = false;
        mouse = "nvchr";
        signcolumn = "yes";
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = false;
      };

      autoCmd = with autoCmd; [
        (indentOverride [ "nix" ] true 2)
      ];
    };
  };
}
