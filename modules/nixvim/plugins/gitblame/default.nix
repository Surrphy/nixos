{ lib, config, ... }:
with lib;
with lib.minuszero;
with lib.minuszero.nixvim;
mkPlugin "gitblame" {
  inherit config;

  plugins.gitblame = {
    delay = 1000;
  };
}
