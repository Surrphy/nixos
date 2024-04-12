{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
with lib.minuszero; let
  cfg = config.minuszero.user;
in {
  options.minuszero.user = {
    enable = mkEnableOption "enable user module";

    userName = mkOption {
	default = "main-user";
	description = ''Username'';
    };

    fullName = mkOption {
	default = "Main User";
	description = ''Full name'';
    };

    email = mkOption {
        default = "mainuser@example.com";
	description = ''User's email'';
    };

  };

  config = mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = cfg.fullName;
      initialPassword = "1234";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };
  };
}
