vim.keymap.set("n", "ö", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "c-ö", ":NvimTreeFocus<CR>")

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})
	end,
}
