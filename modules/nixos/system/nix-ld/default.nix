{ options, config, pkgs, lib, ... }:

with lib;
with lib.minuszero;
let cfg = config.minuszero.system.nix-ld;
in
{
  options.minuszero.system.nix-ld = with types; {
      enable = mkBoolOpt false "Whether or not to enable nix-ld";
      description = "nix-ld for vulkan dev (winit)";
  };

  config = {
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        xorg.libX11
        xorg.libXcursor
        xorg.libxcb
        xorg.libXi
        libxkbcommon
    ];

    environment.variables = {
      LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
    };
  };
}
