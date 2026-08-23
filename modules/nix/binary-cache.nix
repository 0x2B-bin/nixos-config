{
  flake.nixosModules.binary-cache-server = {
    services.nix-serve = {
      enable = true;
      bindAddress = "0.0.0.0";
      port = 5000;
      secretKeyFile = "/var/lib/nix-serve/cache-private-key.pem";
    };
  };
}
