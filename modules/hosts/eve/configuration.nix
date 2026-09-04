{ self, ... }:

{
  flake.nixosModules.eve-configuration =
    {
      inputs,
      config,
      pkgs,
      ...
    }:
    {
      imports = with self.nixosModules; [
        server-profile
        immich
      ];

      settings = {
        shell = "nushell";
      };

      boot.loader.systemd-boot.enable = true;
      boot.supportedFilesystems = [ "zfs" ];
      boot.zfs.devNodes = "/dev/disk/by-id";

      networking.hostName = "eve";
      networking.hostId = "8425e349";
      system.stateVersion = "26.11";
    };
}
