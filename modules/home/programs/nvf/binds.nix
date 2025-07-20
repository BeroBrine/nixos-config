{
  programs.nvf.settings.vim = {
    keymaps = [
      # Basic Navigation & Window Management
      {
        key = "<leader>h";
        mode = "n";
        silent = true;
        action = "<C-w>h";
        desc = "Move to left window";
      }

      {
        key = "<leader>j";
        mode = "n";
        silent = true;
        action = "<C-w>j";
        desc = "Move to window below";
      }
      {
        key = "<leader>k";
        mode = "n";
        silent = true;
        action = "<C-w>k";
        desc = "Move to window above";
      }
      {
        key = "<leader>l";
        mode = "n";
        silent = true;
        action = "<C-w>l";
        desc = "Move to right window";
      }
      {
        key = "<leader>sv";
        mode = "n";
        silent = true;
        action = ":vsplit<CR>";
        desc = "Split window vertically";
      }
      {
        key = "<leader>sh";
        mode = "n";
        silent = true;
        action = ":split<CR>";
        desc = "Split window horizontally";
      }
      {
        key = "<leader>sc";
        mode = "n";
        silent = true;
        action = ":close<CR>";
        desc = "Close current window";
      }
      {
        key = "<leader>so";
        mode = "n";
        silent = true;
        action = ":only<CR>";
        desc = "Close all windows except current";
      }

      # Buffer Management
      {
        key = "<leader>bn";
        mode = "n";
        silent = true;
        action = ":bnext<CR>";
        desc = "Next buffer";
      }
      {
        key = "<leader>bp";
        mode = "n";
        silent = true;
        action = ":bprevious<CR>";
        desc = "Previous buffer";
      }
      {
        key = "<leader>bd";
        mode = "n";
        silent = true;
        action = ":bdelete<CR>";
        desc = "Delete buffer";
      }
      {
        key = "<leader>ba";
        mode = "n";
        silent = true;
        action = ":%bd|e#<CR>";
        desc = "Delete all buffers except current";
      }

      # Tab Management
      {
        key = "<leader>tn";
        mode = "n";
        silent = true;
        action = ":tabnew<CR>";
        desc = "New tab";
      }
      {
        key = "<leader>tc";
        mode = "n";
        silent = true;
        action = ":tabclose<CR>";
        desc = "Close tab";
      }
      {
        key = "<leader>to";
        mode = "n";
        silent = true;
        action = ":tabonly<CR>";
        desc = "Close all tabs except current";
      }

      # File Operations
      {
        key = "<leader>w";
        mode = "n";
        silent = true;
        action = ":w<CR>";
        desc = "Save file";
      }
      {
        key = "<leader>q";
        mode = "n";
        silent = true;
        action = ":q<CR>";
        desc = "Quit";
      }
      {
        key = "<leader>x";
        mode = "n";
        silent = true;
        action = ":x<CR>";
        desc = "Save and quit";
      }

      # Search & Replace
      {
        key = "<leader>nh";
        mode = "n";
        silent = true;
        action = ":nohl<CR>";
        desc = "Clear search highlights";
      }
      {
        key = "<leader>s";
        mode = "n";
        silent = true;
        action = ":%s/";
        desc = "Search and replace";
      }
      {
        key = "<leader>s";
        mode = "v";
        silent = true;
        action = ":s/";
        desc = "Search and replace in selection";
      }

      # Quickfix & Location List
      {
        key = "<leader>cn";
        mode = "n";
        silent = true;
        action = ":cnext<CR>";
        desc = "Next quickfix item";
      }
      {
        key = "<leader>cp";
        mode = "n";
        silent = true;
        action = ":cprevious<CR>";
        desc = "Previous quickfix item";
      }
      {
        key = "<leader>co";
        mode = "n";
        silent = true;
        action = ":copen<CR>";
        desc = "Open quickfix list";
      }
      {
        key = "<leader>cc";
        mode = "n";
        silent = true;
        action = ":cclose<CR>";
        desc = "Close quickfix list";
      }

      # Better Movement
      {
        key = "j";
        mode = "n";
        silent = true;
        action = "gj";
        desc = "Move down by visual line";
      }
      {
        key = "k";
        mode = "n";
        silent = true;
        action = "gk";
        desc = "Move up by visual line";
      }
      {
        key = "<C-d>";
        mode = "n";
        silent = true;
        action = "<C-d>zz";
        desc = "Half page down and center";
      }
      {
        key = "<C-u>";
        mode = "n";
        silent = true;
        action = "<C-u>zz";
        desc = "Half page up and center";
      }

      # Visual Mode Improvements
      {
        key = "<";
        mode = "v";
        silent = true;
        action = "<gv";
        desc = "Indent left and reselect";
      }
      {
        key = ">";
        mode = "v";
        silent = true;
        action = ">gv";
        desc = "Indent right and reselect";
      }
      {
        key = "J";
        mode = "v";
        silent = true;
        action = ":m '>+1<CR>gv=gv";
        desc = "Move selection down";
      }
      {
        key = "K";
        mode = "v";
        silent = true;
        action = ":m '<-2<CR>gv=gv";
        desc = "Move selection up";
      }

      # Telescope (File Finder)
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope find_files<CR>";
        desc = "Find files";
      }
      {
        key = "<leader>fw";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope live_grep<CR>";
        desc = "Live grep";
      }
      {
        key = "<leader>fc";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope grep_string<CR>";
        desc = "Find word under cursor";
      }
      {
        key = "<leader>fb";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope buffers<CR>";
        desc = "Find buffers";
      }
      {
        key = "<leader>fh";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope help_tags<CR>";
        desc = "Find help tags";
      }
      {
        key = "<leader>fr";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope oldfiles<CR>";
        desc = "Find recent files";
      }
      {
        key = "<leader>fk";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope keymaps<CR>";
        desc = "Find keymaps";
      }

      # NvimTree (File Explorer)
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>NvimTreeToggle<CR>";
        desc = "Toggle file explorer";
      }
      {
        key = "<leader>ef";
        mode = "n";
        silent = true;
        action = "<cmd>NvimTreeFindFile<CR>";
        desc = "Find file in explorer";
      }
      {
        key = "<leader>er";
        mode = "n";
        silent = true;
        action = "<cmd>NvimTreeRefresh<CR>";
        desc = "Refresh file explorer";
      }

      # LSP (Language Server Protocol)
      {
        key = "gd";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        desc = "Go to definition";
      }
      {
        key = "gD";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        desc = "Go to declaration";
      }
      {
        key = "gr";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        desc = "Show references";
      }
      {
        key = "gi";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        desc = "Go to implementation";
      }
      {
        key = "K";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        desc = "Show hover documentation";
      }
      {
        key = "<leader>rn";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        desc = "Rename symbol";
      }
      {
        key = "<leader>ca";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "Code actions";
      }
      {
        key = "<leader>D";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostic";
      }
      {
        key = "<leader>ld";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostic";
      }
      {
        key = "K";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostic";
      }
      {
        key = "[d";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
      }
      {
        key = "]d";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
      }
      {
        key = "<leader>f";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        desc = "Format buffer";
      }

      # Git (vim-fugitive / gitsigns)
      {
        key = "<leader>gs";
        mode = "n";
        silent = true;
        action = "<cmd>Git<CR>";
        desc = "Git status";
      }
      {
        key = "<leader>gd";
        mode = "n";
        silent = true;
        action = "<cmd>Gdiffsplit<CR>";
        desc = "Git diff";
      }
      {
        key = "<leader>gc";
        mode = "n";
        silent = true;
        action = "<cmd>Git commit<CR>";
        desc = "Git commit";
      }
      {
        key = "<leader>gb";
        mode = "n";
        silent = true;
        action = "<cmd>Git blame<CR>";
        desc = "Git blame";
      }
      {
        key = "<leader>gl";
        mode = "n";
        silent = true;
        action = "<cmd>Git log<CR>";
        desc = "Git log";
      }

      # Gitsigns (Git hunks)
      {
        key = "]h";
        mode = "n";
        silent = true;
        action = "<cmd>Gitsigns next_hunk<CR>";
        desc = "Next git hunk";
      }
      {
        key = "[h";
        mode = "n";
        silent = true;
        action = "<cmd>Gitsigns prev_hunk<CR>";
        desc = "Previous git hunk";
      }
      {
        key = "<leader>hp";
        mode = "n";
        silent = true;
        action = "<cmd>Gitsigns preview_hunk<CR>";
        desc = "Preview git hunk";
      }
      {
        key = "<leader>hr";
        mode = "n";
        silent = true;
        action = "<cmd>Gitsigns reset_hunk<CR>";
        desc = "Reset git hunk";
      }
      {
        key = "<leader>hs";
        mode = "n";
        silent = true;
        action = "<cmd>Gitsigns stage_hunk<CR>";
        desc = "Stage git hunk";
      }

      # Comment.nvim
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>";
        desc = "Toggle comment";
      }
      {
        key = "<leader>/";
        mode = "v";
        silent = true;
        action = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
        desc = "Toggle comment";
      }

      # Trouble (Diagnostics)
      {
        key = "<leader>xx";
        mode = "n";
        silent = true;
        action = "<cmd>TroubleToggle<CR>";
        desc = "Toggle trouble";
      }
      {
        key = "<leader>xw";
        mode = "n";
        silent = true;
        action = "<cmd>TroubleToggle workspace_diagnostics<CR>";
        desc = "Workspace diagnostics";
      }
      {
        key = "<leader>xd";
        mode = "n";
        silent = true;
        action = "<cmd>TroubleToggle document_diagnostics<CR>";
        desc = "Document diagnostics";
      }
      {
        key = "<leader>xq";
        mode = "n";
        silent = true;
        action = "<cmd>TroubleToggle quickfix<CR>";
        desc = "Quickfix list";
      }
      {
        key = "<leader>xl";
        mode = "n";
        silent = true;
        action = "<cmd>TroubleToggle loclist<CR>";
        desc = "Location list";
      }

      # ToggleTerm (Terminal)
      {
        key = "<leader>t";
        mode = "n";
        silent = true;
        action = "<cmd>ToggleTerm<CR>";
        desc = "Toggle terminal";
      }
      {
        key = "<leader>tf";
        mode = "n";
        silent = true;
        action = "<cmd>ToggleTerm direction=float<CR>";
        desc = "Toggle floating terminal";
      }
      {
        key = "<leader>th";
        mode = "n";
        silent = true;
        action = "<cmd>ToggleTerm direction=horizontal<CR>";
        desc = "Toggle horizontal terminal";
      }
      {
        key = "<leader>tv";
        mode = "n";
        silent = true;
        action = "<cmd>ToggleTerm direction=vertical<CR>";
        desc = "Toggle vertical terminal";
      }


      #
      # {
      #   key = "<C-j>";
      #   mode = "i";
      #   silent = true;
      #   action = ":lua cmp.select_next()<CR>";
      #   desc = "Select Next";
      # }
      #
      # {
      #   key = "<C-k>";
      #   mode = "i";
      #   silent = true;
      #   action = ":lua cmp.select_prev()<CR>";
      #   desc = "Select Next";
      # }
      #
      # Nvim-surround
      {
        key = "ys";
        mode = "n";
        silent = true;
        action = "<Plug>(nvim-surround-normal)";
        desc = "Add surround";
      }
      {
        key = "ds";
        mode = "n";
        silent = true;
        action = "<Plug>(nvim-surround-delete)";
        desc = "Delete surround";
      }
      {
        key = "cs";
        mode = "n";
        silent = true;
        action = "<Plug>(nvim-surround-change)";
        desc = "Change surround";
      }


      # Utility
      {
        key = ";";
        mode = "n";
        silent = true;
        action = "<CR>:";
        desc = "Better :";
      }

      {
        key = "<C-e>";
        mode = "n";
        silent = true;
        action = ''vi"'';
        desc = ''Select inside "" '';
      }

      {
        key = "<C-g>";
        mode = "n";
        silent = true;
        action = ''vi{'';
        desc = "Select inside {} ";
      }

      {
        key = "<C-p>";
        mode = "n";
        silent = true;
        action = ''vi('';
        desc = "Select inside () ";
      }

      {
        key = "<C-p>";
        mode = "n";
        silent = true;
        action = ''vi('';
        desc = "Select inside () ";
      }

      {
        key = "<C-p>";
        mode = "n";
        silent = true;
        action = ''vi('';
        desc = "Select inside () ";
      }

      {
        key = "<C-h>";
        mode = "n";
        silent = true;
        action = "<C-w>h";
        desc = "Move to left window";
      }

      {
        key = "<C-l>";
        mode = "n";
        silent = true;
        action = "<C-w>l";
        desc = "Move to right window";
      }

      {
        key = "<C-j>";
        mode = "n";
        silent = true;
        action = "<C-w>j";
        desc = "Move to bottom window";
      }

      {
        key = "<C-k>";
        mode = "n";
        silent = true;
        action = "<C-w>k";
        desc = "Move to upper window";
      }

      {
        key = "<C-i>";
        mode = "n";
        silent = true;
        action = ''vi['';
        desc = "Select inside [] ";
      }

      {
        key = "H";
        mode = "n";
        silent = true;
        action = "^";
        desc = "Select inside [] ";
      }

      {
        key = "L";
        mode = "n";
        silent = true;
        action = "$";
        desc = "Select inside [] ";
      }

      {
        key = ";";
        mode = "n";
        silent = true;
        action = ":";
        desc = "Select inside [] ";
      }
    ];

  };
}
