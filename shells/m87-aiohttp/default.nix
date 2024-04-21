{
  mkShell,
  pkgs
}:
mkShell {
  packages = with pkgs; [
    poetry
  ];

  shellHook = ''
    exec fish
  '';
}
