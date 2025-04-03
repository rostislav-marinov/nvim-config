-- vim: ts=2 sts=2 sw=2 et
local mode_map = {
  ["NORMAL"] = "NO",
  ["O-PENDING"] = "N?",
  ["INSERT"] = "IN",
  ["VISUAL"] = "VI",
  ["V-BLOCK"] = "VB",
  ["V-LINE"] = "VL",
  ["V-REPLACE"] = "VR",
  ["REPLACE"] = "RE",
  ["COMMAND"] = "!!",
  ["SHELL"] = "SH",
  ["TERMINAL"] = "TE",
  ["EX"] = "EX",
  ["S-BLOCK"] = "SB",
  ["S-LINE"] = "SL",
  ["SELECT"] = "S",
  ["CONFIRM"] = "Y?",
  ["MORE"] = "MO",
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = false,
  opts = {
    {
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return mode_map[s] or s
            end,
          },
        },
      },
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
    },
  },
}
