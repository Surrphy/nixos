{ lib, pkgs, config, ... }:
with lib;
with lib.minuszero;
let
  cfg = config.minuszero.apps.neovim;
in
{
  options.minuszero.apps.neovim.enable = mkEnableOption "Enable the base neovim editor";

  config = mkIf cfg.enable {
    environment.variables.EDITOR = "nvim";
    environment.systemPackages = with pkgs; [ minuszero.nixvim ];
  };
}
