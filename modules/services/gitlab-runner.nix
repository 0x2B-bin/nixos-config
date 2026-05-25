{
  flake.nixosModules.gitlab-runner = { pkgs, ... }: {
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
  };
}
