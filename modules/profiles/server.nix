{ self, ... }:

{
  flake.nixosModules.server-profile = {
    imports = with self.nixosModules; [
      common-profile
      cron
    ];

    services.getty.autologinUser = null;
  };
}
