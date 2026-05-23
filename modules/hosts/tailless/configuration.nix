{ self, ... }:
{
  flake.nixosModules.tailless-configuration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      jellyfin
    ];

    settings = {
      qylock-theme = "wuwa";
      shell = "nushell";
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
      ];
    };

    powerManagement.cpuFreqGovernor = "performance";
    networking.hostName = "tailless";

    system.stateVersion = "25.05";
  };
}
