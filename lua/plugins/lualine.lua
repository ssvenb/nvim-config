function get_unsaved_files(index)
	local unsaved_file_index = 1
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, "modified") then
			if index == unsaved_file_index then
				file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
				return file
			end
			unsaved_file_index = unsaved_file_index + 1
		end
	end
	return ""
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_z = {
					function()
						return get_unsaved_files(1)
					end,
					function()
						return get_unsaved_files(2)
					end,
					function()
						return get_unsaved_files(3)
					end,
				},
			},
		})
	end,
}
