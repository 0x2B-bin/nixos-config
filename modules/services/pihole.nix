{
  flake.nixosModules.pihole = {
    services.pihole-ftl = {
      enable = true;
      lists = [
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/wildcard/pro-onlydomains.txt";
          type = "block";
          enabled = true;
          description = "Hagezi Blocklist";
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
