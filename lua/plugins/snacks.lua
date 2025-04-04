return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    git = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
  },
-- stylua: ignore
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep", },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History", },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer", }, 
  },
}
