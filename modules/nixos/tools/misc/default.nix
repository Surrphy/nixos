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

    documentation.dev.enable = true;

    environment.systemPackages = with pkgs; [
      fzf
      killall
      unzip
      file
      jq
      wget
      glow
      gcc
      pcmanfm
      openvpn
      man-pages
      man-pages-posix
      python3
      gef
      prismlauncher
      postgresql
      httpie
      obs-studio
      mpv
      ani-cli
      youtube-dl
      bun
    ];
  };
}
