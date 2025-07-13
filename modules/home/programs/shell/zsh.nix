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

      shellAliases = {
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      };
    };

  };
}
