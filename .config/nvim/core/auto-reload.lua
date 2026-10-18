local w = vim.uv.new_fs_event()
local watched_path = vim.fn.expand("~/.config/nvim/core/plugins.lua")
local debounce_timer = nil

local session_file = string.format("/tmp/session_%d.vim", vim.uv.os_getpid())

local function on_change(err, fname, status)
    if err then
        return
    end

    if debounce_timer then
        debounce_timer:stop()
        debounce_timer:close()
    end

    debounce_timer = vim.uv.new_timer()
    debounce_timer:start(
        500,
        0,
        vim.schedule_wrap(function()
            vim.cmd("mksession! " .. session_file .. " | restart source " .. session_file)

            w:stop()
            watch_file(watched_path)

            debounce_timer:close()
            debounce_timer = nil
        end)
    )
end

function watch_file(fname)
    local fullpath = vim.api.nvim_call_function("fnamemodify", { fname, ":p" })
    w:start(
        fullpath,
        {},
        vim.schedule_wrap(function(...)
            on_change(...)
        end)
    )
end

watch_file(watched_path)
