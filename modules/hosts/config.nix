{
  flake.nixosModules.settings =
    { config, lib, ... }:
    let
      cfg = config.settings;
    in
    {
      options.settings = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "nate";
        };

        qylock-theme = lib.mkOption {
          type = lib.types.str;
          default = "nier-automata";
        };

        qylock-sddm-font = lib.mkOption {
          type = lib.types.nullOr lib.types.path;
          default = null;
        };

        qylock-lock-theme = lib.mkOption {
          type = lib.types.str;
          default = cfg.qylock-theme;
        };

        qylock-lock-font = lib.mkOption {
          type = lib.types.nullOr lib.types.path;
          default = null;
        };

        grub-theme = lib.mkOption {
          type = lib.types.enum [
            "futaba"
            "yorha"
            "lain"
          ];
          default = "yorha";
        };

        shell = lib.mkOption {
          type = lib.types.enum [
            "zsh"
            "nushell"
          ];
          default = "zsh";
        };
      };
    };
}
