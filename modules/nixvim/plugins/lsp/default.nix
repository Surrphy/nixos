{ lib, pkgs, config, ... }:
with lib;
with lib.minuszero;
with lib.minuszero.nixvim;
mkPlugin "lsp" {
  inherit config;

  plugins = {
    lsp = {
      enable = true;

      servers = {
	rust-analyzer.enable = true;
	rust-analyzer.installRustc = true;
	rust-analyzer.installCargo = true;

 	pyright = {
          enable = true;
	};

	clangd.enable = true;
	
	# ruff-lsp.enable = true;
      };
    };

    cmp = {
      enable = true;

      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    lsp-format.enable = true;
    luasnip.enable = true;
  };
}
