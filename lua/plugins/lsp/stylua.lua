return {
	"ckipp01/stylua-nvim",
	ft = "lua",
	config = function()
		-- Automatically format file buffer when saving
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "*.lua",
			callback = function()
				vim.cmd('lua require("stylua-nvim").format_file()')
			end,
		})
	end,
}
