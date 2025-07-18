{
  programs.nvf.settings.vim = {
    filetree.nvimTree = {
      enable = true;
      mappings = {
        toggle = "<leader>e";
      };
      setupOpts = {
        git.enable = true;
        diagnostics.enable = true;
        respect_buf_cwd = true;
        modified = {
          enable = true;
          show_on_dirs = true;
        };
        diagnostics.icons = {
          hint = "";
          info = "";
          warning = "";
          error = "";
        };
        actions = {
          open_file = {
            window_picker.enable = true;
          };
        };

      };
    };
  };
}

