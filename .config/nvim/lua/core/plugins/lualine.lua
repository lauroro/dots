return {
	'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			}
		})
	end
}
