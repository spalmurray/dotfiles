local lsp_zero = require('lsp-zero').preset({})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'eslint',
        'tsserver',
        'lua_ls',
        'marksman',
        'pyright',
        'rust_analyzer',
    },
    handlers = {
        lsp_zero.default_setup,
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_format = lsp_zero.cmp_format()

cmp.setup({
    formatting = cmp_format,
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<TAB>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
})

