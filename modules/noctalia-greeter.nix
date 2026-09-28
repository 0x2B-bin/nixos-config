{
  flake.nixosModules.noctalia-greeter = { config, ... }: {
    services.displayManager = {
      noctalia-greeter = {
        enable = true;

        settings = {
          appearance = {
            scheme_selector_position = "hidden";
          };
          cursor.size = 24;
          keyboard.layout = "us";
          user.default = config.settings.username;
        };

        passwordlessSyncUsers = [ config.settings.username ];
      };
    };
  };
}
