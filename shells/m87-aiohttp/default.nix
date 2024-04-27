{
  mkShell,
  pkgs
}:
mkShell {
  packages = with pkgs; [
    poetry
    openldap
    cyrus_sasl
  ];

  shellHook = ''
    exec fish
  '';
}
