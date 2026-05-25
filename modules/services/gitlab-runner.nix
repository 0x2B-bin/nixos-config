{
  flake.nixosModules.gitlab-runner = { config, pkgs, ... }: {
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

    users.groups.developer = {};

    users.users = {
      gitlab-runner = {
        isSystemUser = true;
        group = "developer";
      };
      ${config.settings.username}.extraGroups = [ "developer" ];
    };
  };
}
