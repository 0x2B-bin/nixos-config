{ self, ... }:
{
  flake.nixosModules.oracle-configuration = { inputs, pkgs, ... }: {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      binary-cache-client
    ];

    settings = {
      qylock-theme = "enfield";
      shell = "nushell";
      grub-theme = inputs.grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.lobo;
    };

    networking.hostName = "oracle";

    system.stateVersion = "25.05";
  };
}
