{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.minuszero; let
  cfg = config.minuszero.cli-apps.tmux;
in {
  options.minuszero.cli-apps.tmux = {
    enable = mkEnableOption "Tmux";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      tmux
    ];
  };
}
