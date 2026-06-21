{
  flake.nixosModules.distributedBuilds =
    { pkgs, ... }:
    {
      nix.distributedBuilds = true;
      nix.settings.builders-use-substitutes = true;
      nix.settings.fallback = true;

      nix.buildMachines = [
        {
          hostName = "yorha";
          sshUser = "remoteBuild";
          sshKey = "/root/.ssh/remotebuild";
          system = pkgs.stdenv.hostPlatform.system;
          supportedFeatures = [
            "nixos-test"
            "big-parallel"
            "kvm"
          ];
        }
      ];
    };
}
