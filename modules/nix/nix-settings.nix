{
  flake.nixosModules.nix-settings =
    { inputs, ... }:
    {
      config = {
        nix = {
          settings.experimental-features = [
            "nix-command"
            "flakes"
          ];
          settings.trusted-users = [
            "root"
            "nate"
          ];

          registry.nixpkgs.flake = inputs.nixpkgs;
          nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
        };
      };
    };
}
