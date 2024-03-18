vim.g.copilot_assume_mapped = true 
vim.keymap.del('i', '<Tab>')
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-y>', 'copilot#Accept("")', {
  expr = true,
  replace_keycodes = false
})
