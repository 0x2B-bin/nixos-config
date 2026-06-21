{
  flake.nixosModules.remote-builder =
    { config, lib, ... }:
    let
      cfg = config.services.remoteBuilder;
    in
    {
      options.services.remoteBuilder = {
        enable = lib.mkEnableOption "Distributed Nix builder Service";

        sshIP = lib.mkOption {
          type = lib.types.str;
          description = "IP to bind for SSH server";
          example = "100.64.0.1";
        };
      };

      config = lib.mkIf cfg.enable {
        users.users.remoteBuild = {
          isSystemUser = true;
          group = "remoteBuild";
          useDefaultShell = true;

          openssh.authorizedKeys.keyFiles = [ ../../keys/remotebuild.pub ];
        };

        users.groups.remoteBuild = { };

        services.openssh = {
          enable = true;
          listenAddresses = [
            {
              addr = cfg.sshIP;
              port = 22;
            }
          ];
        };

        networking.firewall.allowedTCPPorts = [ ];
        networking.firewall.trustedInterfaces = [ "tailscale0" ];

        nix.settings.trusted-users = [ "remoteBuild" ];
      };
    };
}
