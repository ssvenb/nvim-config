return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		vim.keymap.set("n", "ff", ":Telescope find_files<CR>"),
		vim.keymap.set("n", "fg", ":Telescope live_grep<CR>"),
		vim.keymap.set("n", "fb", ":Telescope buffers<CR>"),
	},
}
