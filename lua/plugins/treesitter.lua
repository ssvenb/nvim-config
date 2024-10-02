-- Code Tree Support / Syntax Highlighting
return {
	-- https://github.com/nvim-treesitter/nvim-treesitter
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			auto_install = true,
			indent = { enable = true },
			ensure_installed = {
				"lua",
				"vim",
			},
			modules = {},
			sync_install = false,
			ignore_install = {},
		})
	end,
}
