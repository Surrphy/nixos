{
  mkShell,
  pkgs
}:
mkShell {
  packages = with pkgs; [
    poetry
    openldap
  ];

  shellHook = ''
    exec fish
  '';
}
