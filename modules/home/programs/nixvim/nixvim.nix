{ config, pkgs, lib, ... }:

{
  # Enable the Neovim program through nvf's home-manager module
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Set Neovim as the default editor

    # List of Neovim plugins to be managed by Nix
    plugins = with pkgs.vimPlugins; [
      # UI Plugins
      oil-nvim
      lualine-nvim
      bufferline-nvim
      indent-blankline-nvim # The plugin is named 'indent-blankline-nvim', but its Lua module is 'ibl'
      mini-nvim # Provides modules like mini.base16 and mini.icons

      # nvim-tree.lua was commented out in your original config,
      # so it remains commented here. Uncomment and add its Lua setup if needed.
      # nvim-tree-lua

      # LSP and Completion related plugins
      nvim-lspconfig # Core LSP client
      nvim-cmp # Autocompletion framework
      luasnip # Snippet engine
      cmp-nvim-lsp # nvim-cmp source for LSP
      cmp-path # nvim-cmp source for file paths
      cmp-buffer # nvim-cmp source for current buffer
      cmp-cmdline # nvim-cmp source for command line

      # Treesitter for enhanced syntax highlighting and parsing
      nvim-treesitter
      nvim-treesitter-autotag # Auto-closes HTML/XML tags

      # Fuzzy Finding
      telescope-nvim # Powerful fuzzy finder
      telescope-fzf-native-nvim # Native C/Rust extension for Telescope for speed

      # Git Integration
      gitsigns-nvim # Git signs in the gutter
      vim-fugitive # Comprehensive Git wrapper

      # Utility Plugins
      nvim-comment # Easy commenting/uncommenting
      which-key-nvim # Shows available keybindings
      undotree # Visualizes undo history
      toggleterm-nvim # Integrated terminal
      nvim-autopairs # Auto-closes parentheses, brackets, etc.
      flash-nvim # Modern motion plugin
    ];

    # All Neovim options and plugin configurations are set here using Lua.
    extraConfigLua = ''
      -- Global Neovim settings (from your opts block)
      -- UI and Appearance
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"
      vim.opt.cmdheight = 1
      vim.opt.updatetime = 300
      vim.opt.laststatus = 2
      vim.opt.showtabline = 2
      vim.opt.scrolloff = 8
      vim.opt.sidescrolloff = 8

      -- Indentation and Formatting
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.autoindent = true
      vim.opt.smartindent = true
      vim.opt.wrap = false

      -- Search
      vim.opt.incsearch = true
      vim.opt.hlsearch = true
      vim.opt.ignorecase = true
      vim.opt.smartcase = true

      -- Performance and Behavior
      vim.opt.swapfile = false
      vim.opt.backup = false
      -- Use vim.fn.stdpath for a more standard cache directory location
      vim.opt.undodir = vim.fn.stdpath("cache") .. "/nvim/undodir"
      vim.opt.undofile = true
      vim.opt.writebackup = false
      vim.opt.completeopt = "menu,menuone,noselect"
      vim.opt.conceallevel = 0
      vim.opt.hidden = true
      vim.opt.fileencoding = "utf-8"

      -- Disable Netrw (often done by file explorers like NvimTree or Oil)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Plugin Configurations (translated from NixVim's plugin settings)

      -- oil.nvim: File explorer
      require("oil").setup({})

      -- lualine.nvim: Status line
      require("lualine").setup({
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        options = {
          icons_enabled = true,
          theme = "auto", -- Use the current colorscheme's theme
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "NvimTree", "packer" },
            winbar = {},
          },
          always_last_session = true,
        },
      })

      -- bufferline.nvim: Tab/buffer line
      require("bufferline").setup({
        options = {
          mode = "tabs", -- or "buffers"
          separatorStyle = "thin", -- or "slant" or "padded_slant"
          showCloseIcon = false,
          showBufferCloseIcons = false,
          showTabCloseIcons = false,
          diagnostics = "nvim_lsp", -- Show LSP diagnostics
        },
      })

      -- indent-blankline.nvim: Indent guides (Lua module is 'ibl')
      require("ibl").setup({
        char = "│",
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
        context_patterns = { "class", "function", "method", "block", "if", "for", "while", "do", "table" },
      })

      -- nvim-lspconfig: Language Server Protocol configuration
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.gopls.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.yamlls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.nil_ls.setup({})

      -- nvim-cmp: Autocompletion
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "cmdline" },
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.snippet.active() then
              vim.fn.feedkeys(vim.snippet.jumpable(1), "")
            else
              fallback()
            end
          end, { 'i', 's' }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet.active() then
              vim.fn.feedkeys(vim.snippet.jumpable(-1), "")
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      })

      -- luasnip: Snippet engine
      require("luasnip.loaders.from_vscode").lazy_load()

      -- mini.nvim: Collection of small, focused plugins
      require("mini.base16").setup({})
      require("mini.icons").setup({})
      -- If you want to enable mockDevIcons, you might need to set a global variable
      -- or configure it through mini.icons based on mini.nvim documentation.
      -- E.g., vim.g.mini_icons_mock_devicons = true

      -- nvim-treesitter: Enhanced syntax highlighting and parsing
      require("nvim-treesitter.configs").setup({
        autoinstall = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true }, -- Auto-close HTML/XML tags
      })

      -- telescope.nvim: Powerful fuzzy finder
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            preview_width = 0.5,
            horizontal = {
              mirror = false,
            },
            vertical = {
              mirror = false,
            },
          },
          sorting_strategy = "ascending",
          file_sorter = "fzy_sort",
          generic_sorter = "fzy_sort",
          path_display = { "truncate" },
          set_env = { COLORTERM = "truecolor" },
        },
        extensions = {
          ["fzf-native"] = {
            enable = true,
          },
        },
      })
      require("telescope").load_extension("fzf-native")

      -- gitsigns.nvim: Git signs in the gutter
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "契" },
          topdelete = { text = "契" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        wordhl = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 100,
          ignore_whitespace = false,
        },
        -- The on_attach function is directly embedded here
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          -- Navigation
          map('n', ']g', function()
            if vim.wo.diff then return end
            vim.wo.cursorbind = false
            gs.next_hunk()
          end, { desc = "Next hunk" })
          map('n', '[g', function()
            if vim.wo.diff then return end
            vim.wo.cursorbind = false
            gs.prev_hunk()
          end, { desc = "Previous hunk" })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
          map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
          map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
          map('n', '<leader>hb', function() gs.blame_line{ full = true } end, { desc = "Blame line" })
          map('n', '<leader>hd', gs.diffthis, { desc = "Diff this" })
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff this (~)" })
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
        end
      })

      -- nvim-comment: Commenting plugin
      require("nvim_comment").setup({
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
      })

      -- which-key.nvim: Show available keybindings
      local wk = require("which-key")
      wk.setup({})
      wk.register({
        f = { name = "Find" },
        g = { name = "Git" },
        h = { name = "Hunk" },
        l = { name = "LSP" },
        t = { name = "Toggle" },
        w = { name = "Window" },
        b = { name = "Buffer" },
        c = { name = "Code" }, -- For code actions, comment
        s = { name = "Search" },
        r = { name = "Rename" },
      }, { prefix = "<leader>" })

      -- toggleterm.nvim: Integrated terminal
      require("toggleterm").setup({
        size = 20,
        open_mapping = "[[<C-t>]]", -- This mapping is specific to your config
        direction = "float",
        float_opts = {
          border = "curved",
          width = 1,
          height = 1,
        },
      })

      -- nvim-autopairs: Auto-close parentheses, brackets, etc.
      require("nvim-autopairs").setup({})

      -- flash.nvim: Modern motion plugin
      require("flash").setup({})
      -- Keybindings for flash.nvim (as they were in your extraConfigLua)
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(flash)", { desc = "Flash a character" })
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(flash-f)", { desc = "Flash forward" })
      vim.keymap.set("o", "r", "<Plug>(flash-r)", { desc = "Flash reverse" })
      vim.keymap.set({ "n", "x", "o" }, "R", "<Plug>(flash-t)", { desc = "Flash treesitter" })
      vim.keymap.set({ "n", "x", "o" }, "<C-s>", "<Plug>(flash-toggle)", { desc = "Toggle Flash Search" })

      -- Auto-commands for file types, etc.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "json,jsonc",
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      })

      -- Highlight on yank
      vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
        callback = function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
        end,
      })
    '';

    # Keybindings (beyond plugin-specific ones)
    keymaps = [
      # Window navigation
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options = { desc = "Window left"; }; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options = { desc = "Window right"; }; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options = { desc = "Window down"; }; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options = { desc = "Window up"; }; }
      # Note: <leader>e is used for Oil, so NvimTreeToggle is commented out
      { mode = "n"; key = "<leader>e"; action = ":Oil --float<CR>"; options = { desc = "Open Oil In Floating Window"; }; }

      # Buffer navigation
      { mode = "n"; key = "<Tab>"; action = ":bnext<CR>"; options = { desc = "Next buffer"; }; }
      { mode = "n"; key = "<S-Tab>"; action = ":bprevious<CR>"; options = { desc = "Previous buffer"; }; }
      # Changed from <leader>bd to just bd for common Neovim setup, revert to "<leader>bd" if preferred
      { mode = "n"; key = "bd"; action = ":bdelete<CR>"; options = { desc = "Delete buffer"; }; }

      # NvimTree toggle (commented out as Oil is enabled with <leader>e)
      # { mode = "n"; key = "<leader>e"; action = ":NvimTreeToggle<CR>"; options = { desc = "Toggle file explorer"; }; }

      # Saving and Quitting
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; options = { desc = "Save file"; }; }
      { mode = "n"; key = "<leader>q"; action = ":q<CR>"; options = { desc = "Quit window"; }; }
      { mode = "n"; key = "<leader>Q"; action = ":qa!<CR>"; options = { desc = "Quit all (force)"; }; }

      # Terminal Toggle (from toggleterm)
      { mode = "n"; key = "<leader>t"; action = ":ToggleTerm<CR>"; options = { desc = "Toggle terminal"; }; }

      # Undo Tree
      { mode = "n"; key = "<leader>u"; action = ":UndotreeToggle<CR>"; options = { desc = "Toggle Undo Tree"; }; }

      # General editing
      { mode = "n"; key = "<leader>s"; action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>"; options = { desc = "Search and replace current word"; }; }
    ];
  };

  # Ensure necessary packages are available for plugins
  # These packages are added to your home environment.
  home.packages = with pkgs; [
    ripgrep # Used by Telescope for live_grep
    fd      # Used by Telescope for find_files
    nodejs  # For some LSP servers (e.g., tsserver) and Mason
    python3 # For some LSP servers (e.g., pyright) and Mason
  ];
}

