{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero;
let cfg = config.minuszero.apps.librewolf;
in
{
  options.minuszero.apps.librewolf = with types; {
    enable = mkBoolOpt false "enable librewolf browser";
  };

  config = mkIf cfg.enable {
    minuszero.home.extraOptions = {
      programs.librewolf.enable = true;
    };
  };
}
