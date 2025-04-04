-- vim: ts=2 sts=2 sw=2 et
return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  enabled = false,
  version = "*",
  lazy = false,
  opts = {},
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open()
      end,
      desc = "Explore",
    },
    {
      "<leader>m",
      function()
        require("mini.map").open()
      end,
      desc = "Explore",
    },
  },
  config = function()
    require("mini.icons").setup()
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.statusline").setup()
    require("mini.indentscope").setup({
      draw = {
        delay = 5,
        animation = function()
          return 0
        end,
      },
    })
    require("mini.pairs").setup()
    require("mini.clue").setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g`        key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Mar        ks
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
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),
        require("mini.clue").gen_clues.z(),
      },
      window = {
        delay = 400,
      },
    })
    require("mini.files").setup()
    require("mini.git").setup()
    require("mini.diff").setup()
    require("mini.bracketed").setup()
    require("mini.comment").setup()
    require("mini.move").setup()
    require("mini.hipatterns").setup()
    require("mini.map").setup()
  end,
}
