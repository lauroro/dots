-- use system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- enable mouse support
vim.opt.mouse = "a"

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- absolute numbers
vim.opt.number = true

-- cursor line
vim.opt.cursorline = false

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- mode viewer
vim.opt.showmode = false

-- searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- single status bar
vim.opt.laststatus = 3

-- avoid text wrapping
vim.opt.wrap = false

-- termguicolors
vim.opt.termguicolors = true

-- timeout
vim.opt.timeoutlen = 300

-- cursorline
vim.opt.cursorline = true

-- hide cmd line
vim.opt.cmdheight = 0
