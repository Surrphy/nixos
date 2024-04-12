{ config, pkgs, lib, ... }:
with lib;
with lib.minuszero;
with lib.minuszero.nixvim;
mkPlugin "treesitter" {
  inherit config;
  plugins = {
    treesitter = {
      enable = true;
      indent = true;
    };

    ts-autotag = {
      enable = true;
    };

    nvim-autopairs = {
      extraOptions = {
        check_ts = true;
      };
    };

    treesitter-textobjects = {
      enable = true;

      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";

          "ac" = "@conditional.outer";
          "ic" = "@conditional.inner";

          "iC" = "@class.inner";
          "aC" = "@class.outer";

          "iB" = "@block.inner";
          "aB" = "@block.outer";

          # argument (p is already paragraph)
          "ia" = "@parameter.inner";
          "aa" = "@parameter.outer";

          # invocation
          "ii" = "@call.inner";
          "ai" = "@call.outer";
        };
      };
    };
  };
}
