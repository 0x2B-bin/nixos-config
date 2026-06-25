return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {},
  keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>.", function() Snacks.picker.files() end, desc = "Find Files" },
  }
}
