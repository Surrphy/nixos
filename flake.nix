{
  description = "NixOs going sub-zero";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # The name "snowfall-lib" is required due to how Snowfall Lib processes your
    # flake's inputs.
    snowfall-lib = {
        url = "github:snowfallorg/lib/dev";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

   outputs = inputs:
     let
       lib = inputs.snowfall-lib.mkLib {
         # You must provide our flake inputs to Snowfall Lib.
	       inherit inputs;

         # The `src` must be the root of the flake. See configuration
         # in the next section for information on how you can move your
         # Nix files to a separate directory.
         src = ./.;

         snowfall = {
            meta = {
              name = "minuszero";
              title = "Minus Zero";
            };

            metadata = "minuszero";
            namespace = "minuszero";
         };
       };
     in lib.mkFlake {
       channels-config = {
         allowUnfree = true;
       };

	     nixvimModules = lib.snowfall.module.create-modules {
         src = "${./modules/nixvim}";
       };

	     overlays = with inputs; [
           nixvim.overlays.default
         ];
       };
}
