local keymap = vim.keymap.set

-- Leader key (Space bar)
vim.g.mapleader = " "

-- :w shortcut
keymap("n", "<Leader>w", ":w<CR>", { desc = "Write" })

-- :q shortcut
keymap("n", "<Leader>q", ":q<CR>", { desc = "Quit/Close" })

-- Scroll with mouse
keymap("n", "<ScrollWheelUp>", "<C-Y>", {})
keymap("n", "<ScrollWheelDown>", "<C-E>", {})

-- Split vertically
keymap("n", "<Leader>s", ":vsplit<CR>", {})

-- Navigate splits
keymap("n", "<C-Left>", ":winc h<CR>", {})
keymap("n", "<C-Down>", ":winc j<CR>", {})
keymap("n", "<C-Up>", ":winc k<CR>", {})
keymap("n", "<C-Right>", ":winc l<CR>", {})

-- Resize current split
keymap("n", "<Leader>+", ":vertical resize +5<CR>", {})
keymap("n", "<Leader>-", ":vertical resize -5<CR>", {})

-- Select all
keymap("n", "<Leader>a", "ggVG", { desc = "Select all" })
