{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.minuszero;
let cfg = config.minuszero.apps.alacritty;
in
{
  options.minuszero.apps.alacritty = with types; {
    enable = mkBoolOpt false "enable alacrity terminal emulator";
    fontSize = mkOpt types.int 20 "font size";
    font = mkOpt types.str "IBM 3270 Condensed" "font family";
  };

  config = mkIf cfg.enable {
    minuszero.home.extraOptions = {
      programs.alacritty = {
        enable = true;
	settings = {
          keyboard.bindings = [
            {
              key = "Return";
	      mods = "Control|Shift";
	      action = "SpawnNewInstance";
	    }
	  ];
	  font = {
            size = cfg.fontSize;
	    normal = { family = cfg.font; style = "Condensed"; };
	    bold = { family = cfg.font; style = "Condensed,Bold"; };
	    italic = { family = cfg.font; style = "Condensed,Italic"; };
	    bold_italic = { family = cfg.font; style = "Condensed,Bold,Italic"; };
	  };
	};
      };
    };
  };
}
