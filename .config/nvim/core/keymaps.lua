local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>w", ":w<CR>", { desc = "write" })
keymap("n", "<leader>q", ":q<CR>", { desc = "quit" })
keymap("n", "<leader>r", ":mksession! /tmp/session.vim | restart source /tmp/session.vim<CR>", { desc = "restart" })
keymap("n", "<leader>f", function()
    require("conform").format({ async = true })
    -- vim.lsp.buf.format as fallback in conform
end, { desc = "format" })

keymap("n", "<ScrollWheelUp>", "<C-Y>", {})
keymap("n", "<ScrollWheelDown>", "<C-E>", {})

keymap("n", "<leader>sr", ":vertical split<CR>", { desc = "split right" })
keymap("n", "<leader>sd", ":horizontal split<CR>", { desc = "split down" })

keymap("n", "<C-a>", "ggVG", { desc = "Select all" })

keymap("n", "gD", vim.diagnostic.open_float, { desc = "Diagnostic" })
