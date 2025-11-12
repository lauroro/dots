local keymap = vim.keymap.set

-- Leader key (Space bar)
vim.g.mapleader = " "

-- :w shortcut
keymap("n", "<Leader>w", ":w<CR>", { desc = "Write" })

-- :q shortcut
keymap("n", "<Leader>q", ":q<CR>", { desc = "Quit/Close" })

-- :bc shortcut
keymap("n", "<Leader>c", ":bd<CR>", { desc = "close buffer" })

-- Scroll with mouse
keymap("n", "<ScrollWheelUp>", "<C-Y>", {})
keymap("n", "<ScrollWheelDown>", "<C-E>", {})

-- Split
keymap("n", "<Leader>sr", ":vertical split<CR>", { desc = "Split > right" })
keymap("n", "<Leader>sd", ":horizontal split<CR>", { desc = "Split > down" })

-- Navigate splits
keymap("n", "<C-h>", ":winc h<CR>", {})
keymap("n", "<C-j>", ":winc j<CR>", {})
keymap("n", "<C-k>", ":winc k<CR>", {})
keymap("n", "<C-l>", ":winc l<CR>", {})

-- Select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all" })

-- LSP
keymap("n", "K", vim.lsp.buf.hover, {})
keymap("n", "gd", vim.lsp.buf.definition, {})
keymap("n", "gD", vim.diagnostic.open_float, {})
keymap("n", "grr", vim.lsp.buf.references, {})
keymap("n", "grn", vim.lsp.buf.rename, {})
keymap("n", "ca", vim.lsp.buf.code_action, {})
keymap("n", "<leader>p", vim.lsp.buf.format, { desc = "Prettify code" })
-- C-x-o for autocomplete suggestion
