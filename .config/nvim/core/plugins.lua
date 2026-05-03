local add = vim.pack.add

----------------------
-------- MINI --------
----------------------
add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()

local _palette = {
    -- @gohan:start
    base00 = "#181a1f",
    base01 = "#262b33",
    base02 = "#303843",
    base03 = "#4f565e",
    base04 = "#7b8c9a",
    base05 = "#a9b7c2",
    base06 = "#c3d0d8",
    base07 = "#e0ebf2",
    base08 = "#b06a73",
    base09 = "#b08a6a",
    base0A = "#b0a86a",
    base0B = "#6fa77a",
    base0C = "#6fa8a0",
    base0D = "#6f8fae",
    base0E = "#8f7fb0",
    base0F = "#8c7a86",
    -- @gohan:end
}

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
vim.api.nvim_set_hl(0, "Keyword", { fg = _palette.base0E, bold = false })

local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },
        -- Built-in completion
        { mode = "i", keys = "<C-x>" },
        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },
        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },
        -- Window commands
        { mode = "n", keys = "<C-w>" },
        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
        -- `[` and `]` keys
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
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
            width = "auto",
        },
    },
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
    highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

vim.uv.os_setenv("RIPGREP_CONFIG_PATH", vim.fn.stdpath("config") .. "/.rg")
local pick = require("mini.pick")
pick.setup({
    mappings = {
        sys_paste = {
            char = "<C-v>",
            func = function()
                pick.set_picker_query({ vim.fn.getreg("+") })
            end,
        },
    },
})
pick.registry.ff = function()
    return pick.builtin.files({ tool = "rg" })
end
pick.registry.lg = function()
    return pick.builtin.grep_live({ tool = "rg" })
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
    delay = { completion = 100, info = 100, signature = 1000 },
})
-- use `<Tab>` and `<S-Tab>` for navigation through completion list
local imap_expr = function(lhs, rhs)
    vim.keymap.set("i", lhs, rhs, { expr = true })
end
imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
_G.cr_action = function()
    -- Accept selecetion with <C-y> or fallback to "return"
    if vim.fn.complete_info()["selected"] ~= -1 then
        return "\25"
    end
    return "\r"
end
vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })

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
}
add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    vim.lsp.enable(servers),
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

add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
    formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        graphql = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        go = { "gofmt" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        timeout_ms = 1000,
    },
})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "nvim-treesitter" then
            vim.cmd("TSUpdate")
        end
    end,
})
-- !!!remeber to install tree-sitter-cli: sudo npm install -g tree-sitter-cli
add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
local ts = require("nvim-treesitter")
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TSAutoInstall", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local filetype = args.match
        if not vim.list_contains(ts.get_available(), filetype) then
            return
        end
        if vim.list_contains(ts.get_installed(), filetype) then
            vim.treesitter.start(bufnr)
            return
        end
        ts.install(filetype):await(function(ok)
            if vim.api.nvim_buf_is_loaded(bufnr) and ok then
                vim.treesitter.start(bufnr)
            else
                vim.defer_fn(function()
                    if vim.api.nvim_buf_is_loaded(bufnr) and vim.list_contains(ts.get_installed(), filetype) then
                        vim.treesitter.start(bufnr)
                    end
                end, 500)
            end
        end)
    end,
})
