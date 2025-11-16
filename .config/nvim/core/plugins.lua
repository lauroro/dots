-- MINI
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()

local _palette = {
	-- <%pyrice:base00:303446>
	base00 = "#303446",
	-- <%pyrice:base01:393D50>
	base01 = "#393D50",
	-- <%pyrice:base02:414559>
	base02 = "#414559",
	-- <%pyrice:base03:51576d>
	base03 = "#51576d",
	-- <%pyrice:base04:626880>
	base04 = "#626880",
	-- <%pyrice:base05:c6d0f5>
	base05 = "#c6d0f5",
	-- <%pyrice:base06:f2d5cf>
	base06 = "#f2d5cf",
	-- <%pyrice:base07:babbf1>
	base07 = "#babbf1",
	-- <%pyrice:base08:e78284>
	base08 = "#e78284",
	-- <%pyrice:base09:ef9f76>
	base09 = "#ef9f76",
	-- <%pyrice:base0A:e5c890>
	base0A = "#e5c890",
	-- <%pyrice:base0B:a6d189>
	base0B = "#a6d189",
	-- <%pyrice:base0C:81c8be>
	base0C = "#81c8be",
	-- <%pyrice:base0D:8caaee>
	base0D = "#8caaee",
	-- <%pyrice:base0E:ca9ee6>
	base0E = "#ca9ee6",
	-- <%pyrice:base0F:eebebe>
	base0F = "#eebebe",
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
	},
	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
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
vim.keymap.set("n", "<Leader>ff", ":Pick ff<CR>", { desc = "find files" })
vim.keymap.set("n", "<Leader>fg", ":Pick lg<CR>", { desc = "find grep" })


require("mini.extra").setup()
vim.keymap.set("n", "<Leader>fd", ":Pick diagnostic<CR>", { desc = "find diagnostic" })
vim.keymap.set("n", "<Leader>gh", ":Pick git_hunks<CR>", { desc = "git hunks" })
vim.keymap.set("n", "<Leader>gb", ":Pick git_branches<CR>", { desc = "git branches" })
vim.keymap.set("n", "<Leader>gc", ":Pick git_commits<CR>", { desc = "git commits" })
vim.keymap.set("n", "<Leader>hi", ":Pick hipatterns<CR>", { desc = "hipatterns" })
vim.keymap.set("n", "<Leader>km", ":Pick keymaps<CR>", { desc = "keymaps" })
vim.keymap.set("n", "<Leader>gr", ':Pick lsp scope="references"<CR>', { desc = "get references" })
vim.keymap.set("n", "<Leader>bb", ":Pick buffers<CR>", { desc = "get references" })

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
	-- If there is selected item in popup, accept it with <C-y>
	if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
	-- Fall back to plain `<CR>`. You might want to customize according
	-- to other plugins. For example if 'mini.pairs' is set up, replace
	-- next line with `return MiniPairs.cr()`
	return '\r'
end
vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })

require("mini.files").setup()
vim.keymap.set("n", "<Leader>e", ":lua MiniFiles.open()<CR>", { desc = "Explorer" })



-- OTHER PLUGINS
local add = MiniDeps.add

add({
	source = "lewis6991/gitsigns.nvim"
})
require("gitsigns").setup()
vim.keymap.set("n", "<Leader>GB", ":Gitsigns blame<CR>", { desc = "Git Blame" })

local servers = {
	"lua_ls",
	--"clangd",
	"gopls",
	"pylsp",
	-- "pyright",
	--"ts_ls",
	--"jsonls",
	"bashls",
}
add({
	source = "mason-org/mason.nvim"
})
add({
	source = "mason-org/mason-lspconfig.nvim",
	depends = { "neovim/nvim-lspconfig" }
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	vim.lsp.enable(servers)
})

add({
	source = "akinsho/toggleterm.nvim"
})
require("toggleterm").setup({
	on_open = function()
		vim.cmd("startinsert")
	end,
	shade_terminals = false,
})
vim.keymap.set("n", "<Leader>t", ":ToggleTerm<CR>", {})
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})

add({
	source = 'nvim-treesitter/nvim-treesitter',
	hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'lua', 'vimdoc' },
	highlight = { enable = true },
	auto_install = true,
})
