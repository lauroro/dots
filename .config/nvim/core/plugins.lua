local add = vim.pack.add

----------------------
-------- MINI --------
----------------------
add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()


local _palette = {
	-- <%pyrice:base00:282828>
	base00 = "#282828",
	-- <%pyrice:base01:3c3836>
	base01 = "#3c3836",
	-- <%pyrice:base02:504945>
	base02 = "#504945",
	-- <%pyrice:base03:665c54>
	base03 = "#665c54",
	-- <%pyrice:base04:bdae93>
	base04 = "#bdae93",
	-- <%pyrice:base05:d5c4a1>
	base05 = "#d5c4a1",
	-- <%pyrice:base06:ebdbb2>
	base06 = "#ebdbb2",
	-- <%pyrice:base07:fbf1c7>
	base07 = "#fbf1c7",
	-- <%pyrice:base08:fb4934>
	base08 = "#fb4934",
	-- <%pyrice:base09:fe8019>
	base09 = "#fe8019",
	-- <%pyrice:base0A:fabd2f>
	base0A = "#fabd2f",
	-- <%pyrice:base0B:b8bb26>
	base0B = "#b8bb26",
	-- <%pyrice:base0C:8ec07c>
	base0C = "#8ec07c",
	-- <%pyrice:base0D:83a598>
	base0D = "#83a598",
	-- <%pyrice:base0E:d3869b>
	base0E = "#d3869b",
	-- <%pyrice:base0F:d65d0e>
	base0F = "#d65d0e",
}

require("mini.base16").setup({
	palette = _palette
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
vim.api.nvim_set_hl(0, "Keyword", { fg = _palette.base0E, bold = false })


local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },
		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },
		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },
		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },
		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },
		-- Window commands
		{ mode = 'n', keys = '<C-w>' },
		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
		-- `[` and `]` keys
		{ mode = 'n', keys = '[' },
		{ mode = 'n', keys = ']' },
	},
	clues = {
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
	window = {
		delay = 500,
		config = {
			width = "auto"
		}
	}
})


local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})


require("mini.pick").setup()
local pick = MiniPick
pick.setup({
	mappings = {
		sys_paste = {
			char = "<C-v>",
			func = function()
				pick.set_picker_query({ vim.fn.getreg("+") })
			end,
		},
	}
})
local load_temp_rg = function(f)
	local rg_env = 'RIPGREP_CONFIG_PATH'
	local cached_rg_config = vim.uv.os_getenv(rg_env) or ''
	vim.uv.os_setenv(rg_env, vim.fn.stdpath('config') .. '/.rg')
	f()
	vim.uv.os_setenv(rg_env, cached_rg_config)
end
pick.registry.ff = function()
	load_temp_rg(function()
		pick.builtin.files({ tool = 'rg' })
	end)
end
pick.registry.lg = function()
	load_temp_rg(function()
		pick.builtin.grep_live({ tool = 'rg' })
	end)
end
vim.keymap.set("n", "<Leader>pf", ":Pick ff<CR>", { desc = "files" })
vim.keymap.set("n", "<Leader>pg", ":Pick lg<CR>", { desc = "grep" })
vim.keymap.set("n", "<Leader>pH", ":Pick help<CR>", { desc = "Help" })


require("mini.extra").setup()
vim.keymap.set("n", "<Leader>pd", ":Pick diagnostic<CR>", { desc = "diagnostic" })
vim.keymap.set("n", "<Leader>pGh", ":Pick git_hunks<CR>", { desc = "git hunks" })
vim.keymap.set("n", "<Leader>pGb", ":Pick git_branches<CR>", { desc = "git branches" })
vim.keymap.set("n", "<Leader>pGc", ":Pick git_commits<CR>", { desc = "git commits" })
vim.keymap.set("n", "<Leader>ph", ":Pick hipatterns<CR>", { desc = "hipatterns" })
vim.keymap.set("n", "<Leader>pk", ":Pick keymaps<CR>", { desc = "keymaps" })
vim.keymap.set("n", "<Leader>pr", ':Pick lsp scope="references"<CR>', { desc = "references" })
vim.keymap.set("n", "<Leader>pb", ":Pick buffers<CR>", { desc = "buffers" })


require("mini.completion").setup({
	delay = { completion = 100, info = 100, signature = 1000 }
})
-- use `<Tab>` and `<S-Tab>` for navigation through completion list
local imap_expr = function(lhs, rhs)
	vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
_G.cr_action = function()
	-- Accept selecetion with <C-y> or fallback to "return"
	if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
	return '\r'
end
vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })


require("mini.files").setup()
vim.keymap.set("n", "<Leader>e", ":lua MiniFiles.open()<CR>", { desc = "explorer" })




-----------------------
---- OTHER PLUGINS ----
-----------------------
add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup()
vim.keymap.set("n", "<Leader>GB", ":Gitsigns blame<CR>", { desc = "Git Blame" })


local servers = {
	"lua_ls",
	"gopls",
	"pylsp",
	"ts_ls",
	"jsonls",
	"bashls",
	"rust_analyzer"
}
add({ "https://github.com/mason-org/mason.nvim" })
add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig"
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	vim.lsp.enable(servers)
})


add({ "https://github.com/akinsho/toggleterm.nvim" })
require("toggleterm").setup({
	on_open = function()
		vim.cmd("startinsert")
	end,
	shade_terminals = false,
})
vim.keymap.set("n", "<Leader>t", ":ToggleTerm<CR>", {})
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})


vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		if ev.data.spec.name == 'nvim-treesitter' then
			vim.cmd('TSUpdate')
		end
	end
})
add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'lua', 'vimdoc' },
	highlight = { enable = true },
	auto_install = true,
})
