return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			on_open = function()
				vim.cmd("startinsert")
			end,
			shade_terminals = false,
		})

		-- Keymaps
		vim.keymap.set("n", "<Leader>t", ":ToggleTerm<CR>", {})
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})
	end,
}
