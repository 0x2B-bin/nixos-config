{
  flake.nixosModules.nix-settings =
    { inputs, ... }:
    {
      config = {
        nix = {
          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];

            trusted-users = [
              "root"
              "nate"
            ];

            extra-substituters = [ "https://noctalia.cachix.org" ];
            extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
          };

          registry.nixpkgs.flake = inputs.nixpkgs;
          nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
        };
      };
    };
}
