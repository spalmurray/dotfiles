local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
	'bashls',
	'clangd',
	'cssls',
	'eslint',
	'tsserver',
	'lua_ls',
	'marksman',
	'jedi_language_server',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<TAB>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.setup()
