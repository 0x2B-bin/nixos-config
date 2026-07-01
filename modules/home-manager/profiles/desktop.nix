{ self, ... }:
{
  flake.homeModules.desktop-profile = {
    imports = with self.homeModules; [
      kitty
      #easyeffects
      #doom-emacs
    ];
  };
}
