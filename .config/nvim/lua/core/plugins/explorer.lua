return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- check :h nvim-tree-setup
			disable_netrw = true,
			hijack_netrw = true,
			diagnostics = {
				enable = true,
			},
			update_focused_file = {
				enable = true,
			},
			view = {
				preserve_window_proportions = false,
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			renderer = {
				icons = {
					git_placement = "before",
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "★",
						modified = "●",
						git = {
							--unstaged = "✗",
							unstaged = "M",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "?",
							deleted = "D",
							ignored = "◌",
						},
					},
				},
			},
			actions = {
				open_file = {
					resize_window = false,
				},
			},
		})
	end,

	-- keymaps
	vim.keymap.set("n", "<Leader>e", ":NvimTreeFocus<CR>", { desc = "Explorer" }),
}
