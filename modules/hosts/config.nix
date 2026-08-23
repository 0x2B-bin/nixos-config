{
  flake.nixosModules.settings =
    {
      config,
      pkgs,
      lib,
      inputs,
      ...
    }:
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
          type = lib.types.package;
          default = inputs.grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.yorha;
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
