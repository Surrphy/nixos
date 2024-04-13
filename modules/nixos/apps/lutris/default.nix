{ options, config, lib, pkgs, ... }:

with lib;
with lib.minuszero;
let
  cfg = config.minuszero.apps.lutris;
in
{
  options.minuszero.apps.lutris = with types; {
    enable = mkBoolOpt false "Whether or not to enable Lutris.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris
      # Needed for some installers like League of Legends
      openssl
      gnome.zenity
    ];
  };
}
