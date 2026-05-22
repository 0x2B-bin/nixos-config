{
  flake.nixosModules.users =
    {
      config,
      pkgs,
      ...
    }:
    {
      config = {
        users.users.${config.settings.username} = {
          isNormalUser = true;
          shell = pkgs.${config.settings.shell};
          extraGroups = [
            "wheel"
            "docker"
            "networkmanager"
            "wireshark"
          ];
        };
      };
    };
}
