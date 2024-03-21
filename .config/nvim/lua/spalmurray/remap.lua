vim.keymap.set("t", "<esc>", "<C-\\><C-N>")

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float)

-- remap quickfix next, previous, close
vim.keymap.set("n", "<C-n>", vim.cmd.cnext)
vim.keymap.set("n", "<C-p>", vim.cmd.cprev)
vim.keymap.set("n", "<leader>q", vim.cmd.cclose)
