{
  flake.homeModules.dotfiles =
    { config, ... }:
    let
      dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/nate/nixos-config/dotfiles";
    in
    {
      config = {
        xdg.configFile = {
          "mako/config".source = "${dotfiles}/mako/config";
          "niri/config.kdl".source = "${dotfiles}/niri/config.kdl";
          "hsn/config.toml".source = "${dotfiles}/hsn/config.toml";
          "fastfetch/config.jsonc".source = "${dotfiles}/fastfetch/config.jsonc";
          nvim.source = "${dotfiles}/nvim";
          quickshell.source = "${dotfiles}/quickshell";
        };

        home.activation.createNiriConfigs = config.lib.dag.entryAfter [ "writeBoundary" ] ''
          mkdir -p "$HOME/.config/niri"
          touch $HOME/.config/niri/style.kdl
          touch $HOME/.config/niri/override.kdl
        '';
      };
    };
}
