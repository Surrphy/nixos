{ options, config, lib, pkgs, ... }:

with lib;
with lib.minuszero;
let cfg = config.minuszero.tools.k8s;
in
{
  options.minuszero.tools.k8s = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common Kubernetes utilities.";
  };

  config = mkIf cfg.enable {
    programs.fish.shellAbbrs = {
      k8s = "kubectl";
      fr = "flux reconcile source git flux-system";
    };

    environment.systemPackages = with pkgs; [
      kubectl
      kubeseal
      fluxcd
      helm
    ];
  };
}
