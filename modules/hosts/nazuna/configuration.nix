{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      server-profile
      gitlab-runner
    ];

    boot.kernelPackages = pkgs.linuxPackages;
    networking.hostName = "nazuna";
    system.stateVersion = "25.11";
  };
}
