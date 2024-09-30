vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.iskeyword:append("-")

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true })
vim.api.nvim_set_keymap('i', "(", "()<left>", { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', { noremap = true })
vim.api.nvim_set_keymap('i', '{;<CR>', '{<CR>};<ESC>O', { noremap = true })