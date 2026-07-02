{ self, ... }:
{
  flake.nixosModules = {
    hm-server-config = { config, ... }: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.${config.settings.username} = {
          home = {
            username = config.settings.username;
            homeDirectory = "/home/${config.settings.username}";
            stateVersion = "25.05";
          };

          imports = [ self.homeModules.common-profile ];
        };
      };
    };

    hm-desktop-config = { config, ... }: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.${config.settings.username} = {
          home = {
            username = config.settings.username;
            homeDirectory = "/home/${config.settings.username}";
            stateVersion = "25.05";
          };

          imports = [
            self.homeModules.common-profile
            self.homeModules.desktop-profile
          ];
        };
      };
    };
  };
}
