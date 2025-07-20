{
    programs.nvf.settings.vim = {
            enableLuaLoader = true;
            syntaxHighlighting = true;
            lineNumberMode = "relNumber";
            viAlias = true;
            vimAlias = true;
            preventJunkFiles = true;

            undoFile.enable = true;
            notify.nvim-notify.enable = true;
            projects.project-nvim.enable = true;

            options = {
                    tabstop = 2;
                    shiftwidth = 2; 
                    expandtab = true;
                    autoindent = true;
                    exrc = true;
                    secure = true;
            };

            clipboard = {
                    enable = true;
                    providers.wl-copy.enable = true;
                    registers = "unnamedplus";
            };

            autopairs.nvim-autopairs = {
                    enable = true;
            };

            binds = {
                    whichKey.enable = true;
            };

            dashboard = {
                    dashboard-nvim.enable = true;
                    alpha.enable = true;
            };

            statusline.lualine = {
                    enable = true;
                    globalStatus = true;
                    icons.enable = true;
            };

    };
}
