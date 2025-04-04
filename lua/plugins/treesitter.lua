-- vim: ts=2 sts=2 sw=2 et
return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        -- Basic
        "diff",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        -- Shells
        "bash",
        "powershell",
        -- Data
        "yaml",
        "toml",
        "json",
        "xml",
        -- Programming
        "python",
        "julia",
        "matlab",
        "regex",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
      fold = { enable = true, disable = {} },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>rv", "<cmd>TSVariableRename<cr>", desc = "Rename Variable" },
      { "<leader>rf", "<cmd>TSFunctionRename<cr>", desc = "Rename Function" },
      { "<leader>re", "<cmd>TSExtractVariable<cr>", desc = "Extract Variable" },
      { "<leader>ri", "<cmd>TSInlineVariable<cr>", desc = "Inline Variable" },
      -- Add more key mappings as needed based on the plugin's documentation
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = {
        enable = true, -- Enable the plugin
        max_lines = 15, -- Show context up to this many lines
        trim_scope = "outer", -- How to trim the scope
        patterns = { -- Match patterns for different languages
          default = {
            "if_statement",
            "for_statement",
            "while_statement",
            "function_definition",
            "method_definition",
            "class_definition",
          },
          python = { "if", "for", "while", "def", "class" },
          typescript = { "if", "for", "while", "function", "method", "class" },
          -- Add more languages as needed
        },
        -- Below is the rainbow parentheses configuration:
        rainbow = {
          enable = true,
          extended_mode = false, -- Also color non-parentheses delimiters
          max_file_lines = nil, -- Do not enable for files with more than this many lines
        },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
