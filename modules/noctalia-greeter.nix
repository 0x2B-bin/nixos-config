{
  flake.nixosModules.noctalia-greeter = { config, ... }: {
    services.displayManager = {
      noctalia-greeter = {
        enable = true;

        settings = {
          cursor.size = 24;
          keyboard.layout = "us";
        };

        #passwordlessUsers = [ config.settings.username ];
      };
    };
  };
}
