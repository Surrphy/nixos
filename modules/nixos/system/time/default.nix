{ options, config, pkgs, lib, ... }:

with lib;
with lib.minuszero;
let cfg = config.minuszero.system.time;
in
{
  options.minuszero.system.time = with types; {
    enable =
      mkBoolOpt false "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable { time.timeZone = "Europe/Warsaw"; };
}
