-- LSPs list
local servers = {
	"lua_ls",
	"clangd",
	--"gopls",
	"pylsp",
	--"ts_ls",
	--"cssls",
}

return {
	{
		-- if it complains about registries, try to run:
		-- curl https://api.mason-registry.dev/
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			-- servers setup
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "grr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "grn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>p", vim.lsp.buf.format, { desc = "Prettify code" })
			-- C-x-o for autocomplete suggestion
		end,
	},
}
