{
  flake.nixosModules.firewall = {
    config = {
      networking.firewall = {
        enable = true;
        trustedInterfaces = [ "tailscale0" ];
      };
    };
  };
}
