require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'ts_ls',
        'lua_ls',
        'marksman',
        'basedpyright',
        'rust_analyzer',
        'gopls',
        'intelephense'
    },
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').bashls.setup{ capabilities = capabilities }
require('lspconfig').clangd.setup{ capabilities = capabilities }
require('lspconfig').cssls.setup{ capabilities = capabilities }
require('lspconfig').ts_ls.setup{ capabilities = capabilities }
require('lspconfig').lua_ls.setup{ capabilities = capabilities }
require('lspconfig').marksman.setup{ capabilities = capabilities }
require('lspconfig').basedpyright.setup{ capabilities = capabilities }
require('lspconfig').rust_analyzer.setup{ capabilities = capabilities }
require('lspconfig').gopls.setup{ capabilities = capabilities }
require('lspconfig').intelephense.setup{ capabilities = capabilities }

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        typescript = {
            require("formatter.filetypes.typescript").prettierd,
            require("formatter.filetypes.typescript").eslint_d
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd,
            require("formatter.filetypes.typescriptreact").eslint_d
        },
        javascript = {
            require("formatter.filetypes.javascript").prettierd,
            require("formatter.filetypes.javascript").eslint_d
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd,
            require("formatter.filetypes.javascriptreact").eslint_d
        },
        markdown = {
            require("formatter.filetypes.markdown").prettierd
        },
        css = {
            require("formatter.filetypes.css").prettierd
        },
        html = {
            require("formatter.filetypes.html").prettierd
        },
        yaml = {
            require("formatter.filetypes.yaml").prettierd
        }
    }
}
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

require('lint').linters_by_ft = {
    javascript = {'eslint_d'},
    javascriptreact = {'eslint_d'},
    typescript = {'eslint_d'},
    typescriptreact = {'eslint_d'}
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
vim.api.nvim_create_autocmd({ "BufRead" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<TAB>'] = cmp.mapping.confirm({select = true}),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})
