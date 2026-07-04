{ self, ... }:
{
  flake.nixosModules.oracle-configuration = {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      binary-cache-server
    ];

    settings = {
      qylock-theme = "enfield";
      shell = "nushell";
    };

    networking.hostName = "oracle";

    system.stateVersion = "25.05";
  };
}
