{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      server-profile
      gitlab-runner
    ];

    environment.sessionVariables = {
      KOUBOTTO_DIR = "/srv/auc-deployment";
    };

    boot.kernelPackages = pkgs.linuxPackages;
    networking.hostName = "nazuna";
    system.stateVersion = "25.11";
  };
}
