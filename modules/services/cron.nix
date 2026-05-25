{
  flake.nixosModules.cron = {
    services.cron.enable = true;
  };
}
