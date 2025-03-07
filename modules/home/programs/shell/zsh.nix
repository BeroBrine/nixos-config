{
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "cloud";
        plugins = [
          "sudo"
          "vi-mode"
        ];
      };
    };
  };
}
