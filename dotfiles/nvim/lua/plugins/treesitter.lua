return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
      ensured_installed = {
          "lua",
          "rust",
          "nix",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "go",
          "javascript"
      },

      sync_install = false,
      auto_install = true,
      highlight = {
          enable = true
      },
      indent = {
          enable = true
      }
  }
}
