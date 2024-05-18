return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			-- A list of parser names, or "all"
			ensure_installed = {"lua"},
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			highlight = {
				enable = true,
			}
		}
	end
}
