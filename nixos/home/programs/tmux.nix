{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];
    extraConfig = ''
      # act like vim (In conjunction with 'vim-tmux-navigator')
      set-window-option -g mode-keys vi

      # Mouse works as expected
      set-option -g mouse on

      # Bindings
      bind r source-file ~/.config/tmux/tmux.conf
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z
    '';

    catppuccin.extraConfig = ''
      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_middle_separator "  █"

      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W"

      set -g @catppuccin_status_modules_right "directory session"
      set -g @catppuccin_status_left_separator  ""
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_fill "all"
      set -g @catppuccin_status_connect_separator "yes"
    '';
  };
}
