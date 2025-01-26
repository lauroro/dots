return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		-- keymaps
		vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find file" })
		vim.keymap.set("n", "<Leader>lg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<Leader>gr", builtin.lsp_references, { desc = "Get references" })
	end,
}
