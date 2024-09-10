local lsp = require('lsp-zero').preset({})
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities();

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})


cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completeion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
    },
    formatting = cmp_format,
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').tsserver.setup({
    capabilities = cmp_capabilities
})
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').lua_ls.setup({
    capabilities = cmp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

require('lspconfig').clangd.setup {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}
require("roslyn").setup({
    dotnet_cmd = "dotnet",              -- this is the default
    roslyn_version = "4.8.0-3.23475.7", -- this is the default
    on_attach = lsp.on_attach,          -- required
    capabilities = lsp.capabilities,    -- required
})

require('lspconfig').sourcekit.setup {
    capabilities = {
        workspace = {
            didChangeConfiguration = {
                dynamicRegistration = true,
            },
        },
    }

}

lsp.setup()
