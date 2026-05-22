{ self, ... }:
{
  flake.nixosModules.tailless-configuration = {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      jellyfin
    ];

    settings = {
      qylock-theme = "wuwa";
      shell = "nushell";
    };

    powerManagement.cpuFreqGovernor = "performance";
    networking.hostName = "tailless";

    system.stateVersion = "25.05";
  };
}
