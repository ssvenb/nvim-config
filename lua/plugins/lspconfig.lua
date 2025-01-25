vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "grs", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ge", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

vim.diagnostic.config({
	virtual_text = false,
})
vim.o.updatetime = 250
return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"yamlls",
				"pylsp",
				"clangd",
				"emmet_ls",
				"ts_ls",
			},
		})
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = lsp_capabilities,
					on_attach = function(_, bufnr)
						vim.api.nvim_create_autocmd("CursorHold", {
							buffer = bufnr,
							callback = function()
								local opts = {
									focusable = false,
									close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
									border = "rounded",
									source = "always",
									prefix = " ",
									scope = "cursor",
								}
								vim.diagnostic.open_float(nil, opts)
							end,
						})
					end,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
						pylsp = {
							plugins = {
								pycodestyle = {
									maxLineLength = 200,
								},
							},
						},
					},
					cmd = server_name == "clangd" and { "clangd", "--clang-tidy", "--fallback-style=none" } or nil,
				})
			end,
		})
	end,
}
