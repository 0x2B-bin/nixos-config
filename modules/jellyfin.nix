{
  flake.nixosModules.jellyfin = {config, ...}: {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    users.users.jellyfin = {
      extraGroups = [ "video" "render" ];
    };

    fileSystems."/var/lib/jellyfin/media/anime" = {
      device = "/home/${config.settings.username}/Videos/anime";
      fsType = "none";
      options = [
        "bind"
        "ro"
        "nofail"
        "x-systemd.automount"
      ];
    };
  };
}
