-- LSPs list
local servers = {
	"lua_ls",
	--"gopls",
	"pylsp",
	"tsserver",
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
		-- For completion capabilities
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- servers setup
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities
				})
			end

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gR", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
			-- C-x-o for autocomplete suggestion
		end,
	},
}
