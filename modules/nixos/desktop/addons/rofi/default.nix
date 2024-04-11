{ options, config, lib, pkgs, ... }:

with lib;
with lib.minuszero;
let cfg = config.minuszero.desktop.addons.rofi;
in
{
  options.minuszero.desktop.addons.rofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable Rofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    minuszero.home.extraOptions.programs.rofi = {
      enable = true;
      theme = ./minimal.rasi;
    };
  };
}
