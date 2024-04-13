{ options, config, lib, pkgs, ... }:

with lib;
with lib.minuszero;
let
  cfg = config.minuszero.apps.heroic;
in
{
  options.minuszero.apps.heroic = with types; {
    enable = mkBoolOpt false "Whether or not to enable Lutris.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      heroic
      # Needed for some installers like League of Legends
    ];
  };
}
