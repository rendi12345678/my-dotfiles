return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",  -- This ensures parsers are updated after installation
  dependencies = {
    "windwp/nvim-ts-autotag",  -- Autotagging plugin for HTML, JSX, and XML
  },
  config = function()
    -- Safely import nvim-treesitter configs
    local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not treesitter_ok then
      vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
      return
    end

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Add custom parser for Blade templates (used in Laravel)
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- Add custom filetype association for Blade templates
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",  -- Maps .blade.php files to Blade filetype
      },
    })

    -- Configure Treesitter with necessary languages and options
    treesitter.setup({
      highlight = {
        enable = true,  -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,  -- Avoid conflict with Vim's native highlighting
      },
      indent = {
        enable = true,  -- Enable Treesitter-based indentation
      },
      autotag = {
        enable = true,  -- Enable automatic closing tags (useful for HTML/JSX)
      },
      -- Languages to ensure parsers are installed for
      ensure_installed = {
        "json",
        "html",
        "php",
        "rust",
        "yaml",
        "javascript",
        "typescript",
        "cmake",
        "c",
        "query",
        "tsx",
        "vim",
        "css",
        "markdown",
        "markdown_inline",
        "lua",
        "vimdoc",
      },
      -- Incremental selection keymaps for easier selection expansion
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",  -- Initialize selection
          node_incremental = "<C-space>",  -- Expand to the next node
          scope_incremental = false,  -- Scope expansion disabled for simplicity
          node_decremental = "<bs>",  -- Shrink the selection
        },
      },
    })
  end,
}
