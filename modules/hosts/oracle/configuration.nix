{ self, ... }:
{
  flake.nixosModules.oracle-configuration = { inputs, pkgs, ... }: {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      binary-cache-client
      inputs.anisync.nixosModules.default
    ];

    settings = {
      qylock-theme = "enfield";
      shell = "nushell";
      grub-theme = inputs.grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.lobo;
    };

    services.anisync.enable = true;

    networking.hostName = "oracle";

    system.stateVersion = "25.05";
  };
}
