return {
	"echasnovski/mini.base16",
	version = false,
	priority = 1000,
	config = function()
		local _palette = require("core.palette")
		require("mini.base16").setup({
			palette = _palette,
		})
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None", fg = _palette.base03 })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "None", fg = _palette.base03 })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "None", fg = _palette.base05 })
		vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "None" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
		vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "None", fg = _palette.base08 })
		vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "None", fg = _palette.base0A })
		vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "None", fg = _palette.base0E })
		vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "None", fg = _palette.base0D })
		vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "None", fg = _palette.base0C })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "None", fg = _palette.base09 })
		vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "None", fg = _palette.base0E })
	end,
}
