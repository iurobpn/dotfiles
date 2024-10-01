local MiniFiles = require('mini.files')
local M = {}

MiniFiles.setup(
    {
        -- Customization of shown content
        content = {
            -- Predicate for which file system entries to show
            filter = nil,
            -- What prefix to show to the left of file system entry
            prefix = nil,
            -- In which order to show file system entries
            sort = nil,
        },
        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = 'L',
            go_out      = 'h',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = '=',
            trim_left   = '<',
            trim_right  = '>',
        },
        -- General options
        options = {
            -- Whether to delete permanently or move into module-specific trash
            permanent_delete = true,
            -- Whether to use for editing directories
            use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
            -- Maximum number of windows to show side by side
            max_number = 10,
            -- Whether to show preview of file/directory under cursor
            preview = true,
            -- Width of focused window
            width_focus = 50,
            -- Width of non-focused window
            width_nofocus = 15,
            -- Width of preview window
            width_preview = 25,
        },
    })

M.minifiles_toggle = function()
    if not MiniFiles.close() then MiniFiles.open() end
end

M.show_dotfiles = true
vim.api.nvim_create_user_command('Dir', M.minifiles_toggle, {})
vim.api.nvim_set_keymap('n', '<F2>', ':Dir<CR>', { noremap = true })

M.filter_show = function(fs_entry) return true end

M.filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, '.')
end

M.toggle_dotfiles = function()
    M.show_dotfiles = not M.show_dotfiles
    local new_filter = M.show_dotfiles and M.filter_show or M.filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set('n', 'g.', M.toggle_dotfiles, { buffer = buf_id })
    end,
})

M.show_dotfiles = true

M.filter_show = function(fs_entry) return true end

M.filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, '.')
end

M.toggle_dotfiles = function()
    M.show_dotfiles = not M.show_dotfiles
    local new_filter = M.show_dotfiles and M.filter_show or M.filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set('n', 'g.', M.toggle_dotfiles, { buffer = buf_id })
    end,
})

M.set_mark = function(id, path, desc)
    MiniFiles.set_bookmark(id, path, { desc = desc })
end
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
        M.set_mark('c', vim.fn.stdpath('config'), 'Config') -- path
        M.set_mark('w', vim.fn.getcwd, 'Working directory') -- callable
        M.set_mark('~', '~', 'Home directory')
    end,
})
