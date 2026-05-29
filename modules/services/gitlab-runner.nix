{
  flake.nixosModules.gitlab-runner = { config, lib, pkgs, ... }: {
    services.gitlab-runner = {
      enable = true;

      extraPackages = with pkgs; [
        git
        bash
        coreutils
        nix
      ];

      services = {
        shell-runner = {
          authenticationTokenConfigFile = "/var/lib/gitlab-runner/token-file";
          registrationFlags = [ "--url=https://gitlab.com" ];
          executor = "shell";
        };
      };
    };

    systemd.services.gitlab-runner.serviceConfig = {
      DynamicUser = lib.mkForce false;
      User = lib.mkForce "gitlab-runner";
      Group = lib.mkForce "developer";
    };

    users.groups.developer = {};

    users.users = {
      gitlab-runner = {
        isSystemUser = true;
        createHome = true;
        home = "/var/lib/gitlab-runner";
        group = "developer";
      };
      ${config.settings.username}.extraGroups = [ "developer" ];
    };
  };
}
