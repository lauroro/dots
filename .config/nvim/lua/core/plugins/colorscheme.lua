return {
	"echasnovski/mini.base16",
	version = false,
	priority = 1000,
	config = function()
		local _palette = require("core.palette")
		require("mini.base16").setup({
			palette = _palette,
		})
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", fg = _palette.base03 })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = _palette.base03 })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = _palette.base01, fg = _palette.base05 })
	end,
}
