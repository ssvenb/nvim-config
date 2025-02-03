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
vim.opt.iskeyword:append("-")
vim.keymap.set("n", "grc", ":%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i")
vim.keymap.set("n", "gra", ":%s/<c-r><c-w>/<c-r><c-w>/g<c-f>$F/i")

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Arrow Keys
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")
vim.keymap.set("i", "<C-h>", "<left>")

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
