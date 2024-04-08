{ lib, config, pkgs, ... }:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
	default = "main-user";
	description = ''username'';
    };

    fullName = lib.mkOption {
	default = "Main User";
	description = ''Full name'';
    };

  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = cfg.fullName;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
      packages = with pkgs; [
          vim
          neovim
          librewolf

          scrot
          xclip
          rofi

          webcord-vencord
          vesktop
          r2modman
          protonup-ng
          pcmanfm
          kubectl
          kubernetes-helm
      ];
    };
  };
}
