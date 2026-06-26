vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight when yanking text",
    callback = function()
        vim.hl.on_yank()
    end
})

require("core.options")
require("core.keymaps")
require("config.lazy")
