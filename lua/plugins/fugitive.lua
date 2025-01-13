function toggle_diff()
	local buf_modifiable = vim.bo[vim.api.nvim_win_get_buf(0)].modifiable
	local open_windows = #vim.api.nvim_list_wins()
	if open_windows == 1 and buf_modifiable then
		vim.cmd.Gvdiffsplit()
		local move_to_right_window = vim.api.nvim_replace_termcodes("<C-w>l", true, false, true)
		vim.api.nvim_feedkeys(move_to_right_window, "n", false)
	elseif open_windows == 2 then
		if not buf_modifiable then
			vim.cmd("q")
			vim.cmd.Gvdiffsplit()
			local move_to_right_window = vim.api.nvim_replace_termcodes("<C-w>l", true, false, true)
			vim.api.nvim_feedkeys(move_to_right_window, "n", false)
		else
			local keep_only_current_window = vim.api.nvim_replace_termcodes("<C-w><C-o>", true, false, true)
			vim.api.nvim_feedkeys(keep_only_current_window, "n", false)
		end
	end
end

function toggle_git()
	local buf_modifiable = vim.bo[vim.api.nvim_win_get_buf(0)].modifiable
	local open_windows = #vim.api.nvim_list_wins()
	if open_windows == 1 then
		local cmd_str = ":vertical G<cr><C-w>25<"
		local cmd = vim.api.nvim_replace_termcodes(cmd_str, true, false, true)
		vim.api.nvim_feedkeys(cmd, "n", false)
	elseif open_windows == 2 then
		if buf_modifiable then
			local cmd_str = "<C-w><C-o>:vertical G<cr><C-w>25<"
			local cmd = vim.api.nvim_replace_termcodes(cmd_str, true, false, true)
			vim.api.nvim_feedkeys(cmd, "n", false)
		else
			vim.cmd("q")
		end
	end
end

vim.keymap.set("n", "gdd", toggle_diff)
vim.keymap.set("n", "git", toggle_git)

return {
	"tpope/vim-fugitive",
}
