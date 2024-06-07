{
  mkShell,
  pkgs
}:
mkShell {
  packages = with pkgs; [
    cargo
  ];

  shellHook = ''
    exec fish
  '';
}
