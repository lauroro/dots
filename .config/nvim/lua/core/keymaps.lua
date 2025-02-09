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

-- Split
keymap("n", "<Leader>sr", ":vs<CR>", { desc = "Split > right" })
keymap("n", "<Leader>sd", ":split h<CR>", { desc = "Split > down" })

-- Navigate splits
keymap("n", "<C-Left>", ":winc h<CR>", {})
keymap("n", "<C-Down>", ":winc j<CR>", {})
keymap("n", "<C-Up>", ":winc k<CR>", {})
keymap("n", "<C-Right>", ":winc l<CR>", {})

-- Select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all" })
