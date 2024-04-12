{
  pkgs,
  lib,
  ...
}:
with lib;
with lib.minuszero; {
  imports = [ ./hardware.nix ];

  programs.fish.enable = true;

  minuszero = {
    cli-apps = {
      tmux.enable = true;
    };

    apps = {
      vesktop.enable = true;
      neovim.enable = true;
    };

    user = {
      enable = true;
      userName = "surrphy";
      fullName = "Konrad Kine";
      email = "konrad.kine@tutanota.com";
    };

    tools = {
      k8s.enable = true;
      git.enable = true;
      misc.enable = true;
    };

    hardware = {
      networking.enable = true;
      audio.enable = true;
      graphics.nvidia.enable = true;
    };

    security = {
      doas.enable = true;
    };

    system = {
      fonts.enable = true;
      locale.enable = true;
      time.enable = true;
      boot.enable = true;
    };

    desktop.qtile = {
      enable = true;
      dpi = 196;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
