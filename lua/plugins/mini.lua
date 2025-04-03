-- vim: ts=2 sts=2 sw=2 et
return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  version = "*",
  lazy = false,
  opts = {
    -- *
    n_linex = 2000,
    try_as_border = false,
    use_icons = vim.g.have_nerd_font,

    -- mini.indentscope
    symbol = "┆", -- Dashed line character for all levels
    scope = {
      show = true,
      char = "│", -- Solid line character for the current scope
      -- highlight = 'IndentScope', -- You might need to define this highlight group
    },

    -- mini.clues
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },

      -- Built-in completion
      { mode = "i", keys = "<C-x>" },

      -- `g` key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },

      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },

      -- Registers
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },

      -- Window commands
      { mode = "n", keys = "<C-w>" },

      -- `z` key
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },

      -- brackets
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open()
      end,
      desc = "Explore",
    },
  },
  config = function(_, opts)
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup(opts)

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup(opts)

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    -- set use_icons to true if you have a Nerd Font
    require("mini.statusline").setup(opts)
    require("mini.indentscope").setup(opts)
    require("mini.pairs").setup(opts)
    require("mini.icons").setup(opts)
    require("mini.clue").setup(opts)
    require("mini.files").setup(opts)
    require("mini.git").setup(opts)
    require("mini.diff").setup(opts)
    require("mini.bracketed").setup(opts)
  end,
}
