{
  programs.nvf.settings.vim = {
    autocomplete.blink-cmp = {
      enable = true;
      
      setupOpts = {
        completion = {
          documentation = {
            auto_show = true;
          };
        };
      };


      # Key mappings for blink-cmp
      mappings = {
        # Navigate completion menu
        next =  "<Down>";
        previous ="<Up>";
        confirm = "<CR>";
      };
    };
  };
}
