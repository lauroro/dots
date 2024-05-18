return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			-- keymaps
			vim.keymap.set("n", "<Leader>GP", ":Gitsigns preview_hunk<CR>", { desc = "Git Preview" })
		end,
	},
}
