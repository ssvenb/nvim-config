return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"black",
				"prettier",
				"clang-format",
			},
			automatic_installation = false,
			handlers = {},
		})
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black.with({
					extra_args = { "--line-length", "120", "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
