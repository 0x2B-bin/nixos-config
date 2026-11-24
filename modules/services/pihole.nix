{
  flake.nixosModules.pihole = {
    services.pihole-ftl = {
      enable = true;
      lists = [
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/wildcard/pro.txt";
          type = "block";
          enabled = true;
          description = "hagezi blocklist";
        }
      ];
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
