{
  flake.homeModules.tmux =
    { pkgs, ... }:
    {
      config = {
        programs.tmux = {
          enable = true;
          plugins = with pkgs.tmuxPlugins; [
            /*
            {
              plugin = tokyo-night-tmux;
              extraConfig = ''
                set -g @tokyo-night-tmux_theme storm
                set -g @tokyo-night-tmux_transparent 1
              '';
            }
            */
            {
              plugin = mode-indicator;
              extraConfig = ''
                set -g @plugin 'MunifTanjim/tmux-mode-indicator'
                set -g status-right '%Y-%m-%d %H:%M #{tmux_mode_indicator}'
                set -g @mode_indicator_prefix_prompt ' WAIT '
                set -g @mode_indicator_copy_prompt ' COPY '
                set -g @mode_indicator_sync_prompt ' SYNC '
                set -g @mode_indicator_empty_prompt ' TMUX '
                set -g @mode_indicator_prefix_mode_style 'bg=blue,fg=black'
                set -g @mode_indicator_copy_mode_style 'bg=yellow,fg=black'
                set -g @mode_indicator_sync_mode_style 'bg=red,fg=black'
                set -g @mode_indicator_empty_mode_style 'bg=cyan,fg=black'
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

            set -g status-position top
            set -g status-justify left
            set -g status-style 'fg=red'

            set -g status-left ""
            set -g status-left-length 10

            setw -g window-status-current-style 'fg=black bg=red'
            setw -g window-status-current-format ' #I #W #F '

            setw -g window-status-style 'fg=red bg=black'
            setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

            set -g pane-border-style 'fg=red'
            set -g pane-active-border-style 'fg=yellow'

            bind r source-file ~/.config/tmux/tmux.conf
          '';
        };
      };
    };
}
