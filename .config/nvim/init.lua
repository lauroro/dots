package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/?.lua"

require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.auto-reload")
