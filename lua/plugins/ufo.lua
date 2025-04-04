return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  config = function()
    local ufo = require("ufo")
    ufo.setup({
      -- Configuration options here (see plugin documentation)
      -- Example: Enable LSP folding
      provider_selector = function()
        return { "lsp", "treesitter", "indent" } -- Order of providers
      end,
    })

    -- Enable folding
    vim.opt.foldenable = true
    vim.opt.foldcolumn = "0" -- Set to '1' if you want fold markers
    vim.opt.foldlevel = 99 -- Adjust as needed
    vim.opt.foldlevelstart = 99
  end,
  keys = {
    { "zR", "<cmd>UfoOpenAll<cr>", desc = "Open all folds (Ufo)" },
    { "zM", "<cmd>UfoCloseAll<cr>", desc = "Close all folds (Ufo)" },
    { "zo", "<cmd>UfoOpen<cr>", desc = "Open fold (Ufo)" },
    { "zc", "<cmd>UfoClose<cr>", desc = "Close fold (Ufo)" },
    { "zr", "<cmd>UfoOpenOuter<cr>", desc = "Open outer fold (Ufo)" },
    { "zm", "<cmd>UfoCloseOuter<cr>", desc = "Close outer fold (Ufo)" },
    { "zO", "<cmd>UfoOpenBuffer<cr>", desc = "Open all folds in buffer (Ufo)" },
    { "zC", "<cmd>UfoCloseBuffer<cr>", desc = "Close all folds in buffer (Ufo)" },
    { "zj", "<cmd>UfoJumpNextFold<cr>", desc = "Jump to next fold (Ufo)" },
    { "zk", "<cmd>UfoJumpPrevFold<cr>", desc = "Jump to previous fold (Ufo)" },
  },
}
