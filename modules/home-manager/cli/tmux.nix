{
  flake.homeModules.tmux =
    { pkgs, ... }:
    {
      config = {
        programs.tmux = {
          enable = true;
          plugins = with pkgs.tmuxPlugins; [
            {
              plugin = tokyo-night-tmux;
              extraConfig = ''
                set -g @tokyo-night-tmux_theme storm
                set -g @tokyo-night-tmux_transparent 1
              '';
            }
            {
              plugin = sensible;
              extraConfig = ''
                set -g @plugin "tmux-plugins/tmux-sensible"
              '';
            }
            {
              plugin = vim-tmux-navigator;
              extraConfig = ''
                set -g @plugin "christoomey/vim-tmux-navigator"
              '';
            }
            {
              plugin = continuum;
              extraConfig = ''
                set -g @plugin "tmux-plugins/tmux-continuum"
                set -g @continuum-restore 'on'
              '';
            }
            {
              plugin = resurrect;
              extraConfig = ''
                set -g @plugin 'tmux-plugins/tmux-resurrect'
              '';
            }
          ];
          extraConfig = ''
            unbind C-b

            set -g prefix C-s

            set -g mouse on

            set -g base-index 1
            setw -g pane-base-index 1

            set -g renumber-windows on

            bind -r "<" swap-window -d -t -1
            bind -r ">" swap-window -d -t +1

            bind Space last-window

            bind | split-window -h
            bind - split-window -v
            unbind '"'
            unbind %

            set -sg escape-time 10

            bind r source-file ~/.config/tmux/tmux.conf
          '';
        };
      };
    };
}
