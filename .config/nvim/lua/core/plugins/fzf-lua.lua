-- be sure to download fzf and ripgrep
return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup()

		-- keymaps
		vim.keymap.set("n", "<Leader>ff", ":FzfLua files<CR>", { desc = "Find file" })
		vim.keymap.set("n", "<Leader>lg", ":FzfLua live_grep<CR>", { desc = "Live grep" })
		vim.keymap.set("n", "<Leader>gr", ":FzfLua lsp_references<CR>", { desc = "Get references" })
	end
}
