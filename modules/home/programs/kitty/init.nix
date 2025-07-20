{lib , ...}:{
  programs.kitty = {
    enable = true; 
    settings = {
      confirm_os_window_close = 0;
      macos_option_as_alt = true;
      hide_window_decoration = "titlebar-only";
      shell_integration = "no-sudo";
      macos_hide_titlebar = "yes";
      window_border_width = 0;
      # background_opacity = "0.5";
      # background_blur = 15;
    };
    # font = {
    #   name = "JetBrainsMono Nerd Font Mono";
    #   size = 16;
    # };
  };
}
