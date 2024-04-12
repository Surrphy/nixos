{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero; let
  cfg = config.minuszero.apps.vesktop;
in {
  options.minuszero.apps.vesktop = with types; {
    enable = mkBoolOpt false "enable vesktop.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [ vesktop ];};
}
