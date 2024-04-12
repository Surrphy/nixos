{
  options,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
with lib.minuszero; let
  cfg = config.minuszero.home;
in {
  options.minuszero.home = with types; {
    file =
      mkOpt attrs {}
      (mdDoc "A set of files to be managed by home-manager's `home.file`.");
    configFile =
      mkOpt attrs {}
      (mdDoc "A set of files to be managed by home-manager's `xdg.configFile`.");
    extraOptions = mkOpt attrs {} "Options to pass directly to home-manager.";
  };

  config = {
    minuszero.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.minuszero.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.minuszero.home.configFile;
    };

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;

      users.${config.minuszero.user.userName} = mkAliasDefinitions options.minuszero.home.extraOptions;
    };
  };
}
