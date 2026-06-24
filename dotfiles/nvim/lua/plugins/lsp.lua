return {
    {
        "hrsh7th/cmp-nvim-lsp",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            vim.lsp.config("*", {
                capabilities = capabilities
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },

                snippet = {
                    expand = function (args)
                        vim.snippet.expand(args.body) 
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true })
                }),
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local servers = { "lua_ls", "rust_analyzer", "nixd", "gopls", "pylsp", "ts_ls" }
            vim.lsp.enable(servers)

            vim.diagnostic.config({ 
                virtual_text = {
                    current_line = true
                }
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
                    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
                    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
                    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
                    vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
                end
            })
        end
    }
}
