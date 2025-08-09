{pkgs , ...}:{
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      plugins = [
        {
          name = "pure";
          src = pkgs.fetchFromGitHub {
            owner = "sindresorhus";
            repo = "pure";
            rev  = "v1.23.0";
            sha256 = "1jcb5cg1539iy89vm9d59g8lnp3dm0yv88mmlhkp9zwx3bihwr06";
          };
        }
      ];

      oh-my-zsh = {
        enable = true;
        theme = "cloud";
        plugins = [
          "sudo"
          "vi-mode"
        ];
      };


      initContent = ''
        export PATH="$PATH:~/.local/bin"
        eval "$(ssh-agent -s)"
      '';

      shellAliases = {
        hms = "cd ~/.nix && git add * && home-manager switch --flake .";
        leet = "nvim leetcode.nvim";
        tat = "tmux attach";
      };
    };

  };
}
