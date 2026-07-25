{ self, ... }:

{
  flake.nixosModules.nazuna-configuration =
    {
      inputs,
      config,
      pkgs,
      ...
    }:
    {
      imports = with self.nixosModules; [
        server-profile
        inputs.auc-flake.nixosModules.gitlab-runner
        inputs.auc-flake.nixosModules.git
        inputs.auc-flake.nixosModules.packages
      ];

      environment.sessionVariables = {
        KOUBOTTO_DIR = "/srv/auc-deployment";
      };

      services.auc.gitlab-runner.enable = true;
      programs.auc.git.enable = true;

      users.users.${config.settings.username}.extraGroups = [ "developer" ];

      settings = {
        shell = "nushell";
      };

      boot.kernelPackages = pkgs.linuxPackages;
      networking.hostName = "nazuna";
      system.stateVersion = "25.11";
    };
}
