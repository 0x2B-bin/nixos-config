{ self, ... }:
{
  flake.homeModules.common-profile = {
    imports = with self.homeModules; [
      env
      zsh
      nushell
      carapace
      starship
      tmux
      git-config
      dotfiles
      ssh-config
      direnv
      btop
      ranger
    ];
  };
}
