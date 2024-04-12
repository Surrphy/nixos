{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
with lib;
with lib.minuszero;
with inputs; let
  cfg = config.minuszero.apps.nixvim;
in {
  imports =
    [
      nixvim.homeManagerModules.nixvim
    ]
    ++ lib.snowfall.fs.get-non-default-nix-files ./.;

  options.minuszero.apps.nixvim = with types; {
    enable = mkBoolOpt false "enable neovim editor";
  };

  config =
    mkIf
    cfg.enable
    {
      programs.neovim = {
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
      };

      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };
    };
}
