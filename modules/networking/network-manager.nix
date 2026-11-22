{
  flake.nixosModules.network-manager = {
    networking.networkmanager = {
      enable = true;
      dns = "default";
    };
    networking.resolvconf.enable = true;
    networking.nameservers = [
      "nazuna"
      "9.9.9.9"
    ];
  };
}
