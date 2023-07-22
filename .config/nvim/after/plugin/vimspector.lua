vim.g.vimspector_install_gadgets = { 'vscode-cpptools', 'debugpy', 'vscode-bash-debug', 'vscode-js-debug', 'vscode-node-debug2' }

vim.g.vimspector_sidebar_width = 80
vim.g.vimspector_bottombar_height = 20
vim.g.vimspector_base_dir = '/Users/spencer/.local/share/nvim/site/pack/packer/start/vimspector'

vim.keymap.set("n", "<F5>", ":call vimspector#Continue()<CR>")
vim.keymap.set("n", "<F6>", ":call vimspector#Restart()<CR>")
vim.keymap.set("n", "<F7>", ":call vimspector#Reset()<CR>")
vim.keymap.set("n", "<F8>", ":call vimspector#ToggleBreakpoint()<CR>")
vim.keymap.set("n", "<F9>", ":call vimspector#ClearBreakpoints()<CR>")
vim.keymap.set("n", "<F10>", "<Plug>VimspectorStepOver")
vim.keymap.set("n", "<F11>", "<Plug>VimspectorStepInto")
vim.keymap.set("n", "<F12>", "<Plug>VimspectorStepOut")
