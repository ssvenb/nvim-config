vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
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
			},
		})
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = lsp_capabilities,
				})
			end,
		})

		lspconfig.pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							maxLineLength = 120,
						},
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
