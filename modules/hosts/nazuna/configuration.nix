{ self, ... }:

{
  flake.nixosModules.nazuna-configuration = { inputs, config, pkgs, ... }: {
    imports = with self.nixosModules; [
      server-profile
      inputs.auc-flake.nixosModules.gitlab-runner
    ];

    environment.sessionVariables = {
      KOUBOTTO_DIR = "/srv/auc-deployment";
    };

    services.auc.gitlab-runner.enable = true;

    users.users.${config.settings.username}.extraGroups = [ "developer" ];

    settings = {
      shell = "nushell";
    };

    boot.kernelPackages = pkgs.linuxPackages;
    networking.hostName = "nazuna";
    system.stateVersion = "25.11";
  };
}
