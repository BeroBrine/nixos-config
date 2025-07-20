{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    
    # Optional: Set tmux version and other basic settings
    terminal = "screen-256color";
    keyMode = "vi";
    mouse = true;
    
    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = ''
          # Restore vim sessions
          set -g @resurrect-strategy-vim 'session'
          # Restore neovim sessions  
          set -g @resurrect-strategy-nvim 'session'
          # Restore additional programs
          set -g @resurrect-processes 'ssh psql mysql sqlite3'
          # Save and restore pane contents
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          # Automatic restore on tmux start
          set -g @continuum-restore 'on'
          # Save interval in minutes (default is 15)
          set -g @continuum-save-interval '1'
          # Show save status in status bar
          set -g @continuum-status-right-color 'blue'
        '';
      }
    ];
    
    # Custom key bindings
    extraConfig = ''
      # Use Ctrl+B as prefix key
      set -g prefix C-b
      bind C-b send-prefix
      
      # Alt+n to go to previous window
      bind-key -n M-n previous-window
      
      # Alt+m to go to next window  
      bind-key -n M-m next-window
      
      # Key bindings for session management
      
      # Additional useful settings
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g allow-passthrough on
      
      # Enable true color support
      set -ga terminal-overrides ",*256col*:Tc"
      
      # Reduce escape time for better vim experience
      set -sg escape-time 0
    '';
  };
}
