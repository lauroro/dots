return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,		--python
				-- null_ls.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>p", vim.lsp.buf.format, { desc = "Prettify code" })
	end,
}
