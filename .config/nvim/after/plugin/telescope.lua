require('telescope').setup{
    defaults = {
        path_display = {
            "truncate"
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>r', function()
    builtin.live_grep({ additional_args = { '-U'} })
end)
vim.keymap.set('n', '<leader>w', function()
	builtin.grep_string({ search = vim.fn.input("Grep: ") })
end)
vim.keymap.set('n', '<leader>g', builtin.git_status, {})
