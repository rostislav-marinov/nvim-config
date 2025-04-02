-- vim: ts=2 sts=2 sw=2 et
return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { "diff", "lua", "luadoc", "markdown", "markdown_inline", "vim", "vimdoc" },
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
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufRead",
    opts = {
      enable = true,
      -- colors = {}, -- Optionally specify custom colors
      -- termcolors = {} -- Optionally specify custom terminal colors
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
        rainbow = opts,
      })
    end,
  },
}
