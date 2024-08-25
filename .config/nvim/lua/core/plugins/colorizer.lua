return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			vim.keymap.set("n", "<Leader>c", ":ColorizerToggle<CR>", {}),
		})
	end,
}
