return {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    opts = {
        plugins = {
            noice = true,
            notify = true,
            nvim_cmp = true,
        },
        transparent_background = true
    },
    init = function()
        vim.cmd.colorscheme("neopywal")
    end
}
