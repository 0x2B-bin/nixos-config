{
  flake.nixosModules.noctalia-greeter = { config, inputs, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    services.displayManager = {
      noctalia-greeter = {
        enable = true;

        settings = {
          appearance = {
            scheme_selector_position = "hidden";
            hide_logo = true;
          };
          cursor.size = 24;
          keyboard.layout = "us";
          user.default = config.settings.username;
        };

        passwordless-sync-users = [ config.settings.username ];
      };
    };

    security.polkit.enable = true;
  };
}
