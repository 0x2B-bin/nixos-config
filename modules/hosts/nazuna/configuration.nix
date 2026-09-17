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
        inputs.anisync.nixosModules.default
      ];

      environment.sessionVariables = {
        KOUBOTTO_DIR = "/srv/auc-deployment";
      };

      services.anisync.enable = true;

      services.auc.gitlab-runner.enable = true;
      programs.auc.git.enable = true;

      users.users.${config.settings.username}= {
        extraGroups = [ "developer" ];
        linger = true;
      };

      settings = {
        shell = "nushell";
      };

      boot.kernelPackages = pkgs.linuxPackages;
      networking.hostName = "nazuna";
      system.stateVersion = "25.11";
    };
}
