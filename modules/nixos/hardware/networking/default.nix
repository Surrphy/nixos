{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero;
let cfg = config.minuszero.hardware.networking;
in
{
  options.minuszero.hardware.networking = with types; {
    enable = mkBoolOpt false "enable network manager";
  };

  config = mkIf cfg.enable {
    networking.networkmanager.enable = true;
  };
}
