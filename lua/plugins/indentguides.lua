vim.g.indent_guides_color_change_percent = 10
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0

local function set_indent_guides_color(name, odd)
	local cursor_color = vim.api.nvim_get_hl_by_name(name, true).background
	local cursor_color_hex = ("%06x"):format(cursor_color)
	if odd then
		vim.cmd(string.format("hi IndentGuidesOdd guibg=#%s", cursor_color_hex))
	else
		vim.cmd(string.format("hi IndentGuidesEven guibg=#%s", cursor_color_hex))
	end
end

return {
	"preservim/vim-indent-guides",
	priority = 10,
	config = function()
		set_indent_guides_color("CursorLine", true)
		set_indent_guides_color("Normal", false)
	end,
}
