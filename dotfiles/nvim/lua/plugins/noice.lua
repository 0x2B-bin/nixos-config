return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
      lsp = {
          progress = {
              enabled = false
          }
      }
  },
  dependencies = {
    "rcarriga/nvim-notify",
  }
}
