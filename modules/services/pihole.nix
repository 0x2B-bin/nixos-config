{
  flake.nixosModules.pihole = {
    services.pihole-ftl = {
      enable = true;
      settings = {
        dns = {
          listeningMode = "ALL";
          upstreams = [ "9.9.9.9" "1.1.1.1" ];
        };
      };
    };

    services.pihole-web = {
      enable = true;
      ports = [ "9999s" ];
    };
  };
}
