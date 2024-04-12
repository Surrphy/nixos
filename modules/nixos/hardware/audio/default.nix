{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero;
let cfg = config.minuszero.hardware.audio;
in 
{
  options.minuszero.hardware.audio = with types; {
    enable = mkBoolOpt false "enable pipewire";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      pulse.enable = true;
    };
  };
}
