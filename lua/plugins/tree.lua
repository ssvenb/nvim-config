vim.keymap.set("n", "ö", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "c-ö", ":NvimTreeFocus<CR>")

-- Auto-close nvim-tree when opening a file
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if not vim.bo.buflisted then return end
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    }
  end,
}
