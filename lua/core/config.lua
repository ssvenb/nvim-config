-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.cmd("set noshowmode")

-- Copy Paste
vim.opt.clipboard = "unnamedplus"
vim.opt.iskeyword:append("-")

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.keymap.set("n", "<left>", "<<")
vim.keymap.set("n", "<right>", ">>")
vim.keymap.set("v", "<left>", "<")
vim.keymap.set("v", "<right>", ">")

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Arrow Keys
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Other Keymaps
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-p>", '"0p')

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})
