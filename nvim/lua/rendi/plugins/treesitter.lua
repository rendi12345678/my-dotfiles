return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",  -- Autotagging plugin for HTML and XML
  },
  config = function()
    -- Import nvim-treesitter configs
    local treesitter = require("nvim-treesitter.configs")
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- Configure Treesitter
    treesitter.setup({
      highlight = {
        enable = true,  -- Enable syntax highlighting
      },
      indent = {
        enable = true,  -- Enable indentation
      },
      autotag = {
        enable = true,  -- Enable autotagging with nvim-ts-autotag
      },
      -- Ensure these language parsers are installed
      ensure_installed = {
        "json",
        "html",
        "php",
        -- "dockerfile",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "markdown",
        "markdown_inline",
        "lua",
        "vimdoc",
      },
      -- Incremental selection keymaps
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",  -- Start selection
          node_incremental = "<C-space>",  -- Expand selection
          scope_incremental = false,  -- Disable scope selection
          node_decremental = "<bs>",  -- Shrink selection
        },
      },
    })

  end,
}
