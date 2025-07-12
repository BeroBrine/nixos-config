{lib , ...}:{
  programs.kitty = lib.mkForce {
    enable = true; 
    settings = {
      confirm_os_window_close = 0;
      # background_opacity = "0.8";
      # background_blur = 5;      
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
  };
}
