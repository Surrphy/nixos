{ options, config, pkgs, lib, ... }:

with lib;
with lib.minuszero;
let
  cfg = config.minuszero.tools.git;
  user = config.minuszero.user;
in
{
  options.minuszero.tools.git = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure git.";
    userName = mkOpt types.str user.fullName "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ git ];

    minuszero.home.extraOptions = {
      programs.git = {
        enable = true;
        inherit(cfg) userName userEmail;

        lfs.enable = true;

        extraConfig = {
          pull = { rebase = true; };
          push = { autoSetupRemote = true; };
        };
      };
    };
  };
}
