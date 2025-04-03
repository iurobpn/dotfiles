
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', { replace_keycodes = false, expr = true })
vim.keymap.set('i', '<C-,>w', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-,>l', '<Plug>(copilot-accept-line)')
vim.keymap.set('i', '<C-,>d', '<Plug>(copilot-accept-dismiss)')
vim.keymap.set('i', '<C-,>n', '<Plug>(copilot-accept-next)')
vim.keymap.set('i', '<C-,>p', '<Plug>(copilot-accept-previous)')
vim.keymap.set('i', '<C-,>s', '<Plug>(copilot-accept-suggest)')

-- :Copilot panel



