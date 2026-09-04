
{
  flake.nixosModules.immich = { config, ... }: {
    services.immich = {
      enable = true;
      database.enable = true;
      host = "0.0.0.0";
      port = 4611;
    };

    users.users.${config.settings.username}.extraGroups = [ "immich" ];
  };
}
