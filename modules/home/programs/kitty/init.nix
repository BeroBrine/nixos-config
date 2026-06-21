{ pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      macos_option_as_alt = true;
      hide_window_decoration = "titlebar-only";
      shell_integration = "no-sudo";
      # macos_hide_titlebar = "yes";
      window_border_width = 0;
      background_opacity = lib.mkForce "0.65";
      background_blur = 70;
    };
    # extraConfig = "
    #   # Map Cmd+B to F13 function key for tmux prefix
    #   map cmd+b send_key f13
    # ";
    font = lib.mkForce {
      name = "Monaspace Radon Bold";
      size = 17;
    };
  };
}
