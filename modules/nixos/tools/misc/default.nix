{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero; let
  cfg = config.minuszero.tools.misc;
in {
  options.minuszero.tools.misc = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    minuszero.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      fzf
      killall
      unzip
      file
      jq
      wget
      glow
      gcc
    ];
  };
}