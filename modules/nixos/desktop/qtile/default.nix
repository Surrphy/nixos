{
  options,
  config,
  lib,
  pkgs,
  ...
}: 
with lib;
with lib.minuszero;
let cfg = config.minuszero.desktop.qtile;
in 
{
  options.minuszero.desktop.qtile = {
    enable = mkEnableOption "Qtile";

    wallpaper = mkOption {
      type = types.oneOf [types.package types.path types.str];
      default = pkgs.minuszero.wallpapers.nixos-dark;
      description = "The wallpaper to use.";
    };

    dpi = mkOption {
      type = types.int;
      default = 96;
      description = "Dpi passed to xserver";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      feh
      xclip
      scrot
    ];

    minuszero = {
      apps = {
        librewolf.enable = true;
        alacritty.enable = true;
      };

      desktop.addons = {
        rofi.enable = true;
      };
    };

    services.xserver = {
      enable = true;
      inherit(cfg) dpi;

      windowManager.qtile.enable = true;

      displayManager = {
        sddm.enable = true;
	session = [
          {
            manage = "desktop";
            name = "qtile";
            start = ''
              feh --bg-center ${cfg.wallpaper}
              ${pkgs.qtile}/bin/qtile start
            '';
          }
	];
      };
    };

    minuszero.home = {
      configFile."qtile/config.py".source = ./config.py;
    };
  };
}
