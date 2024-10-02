
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set('i', '<C-ç>w', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-ç>l', '<Plug>(copilot-accept-line)')
vim.keymap.set('i', '<C-ç>d', '<Plug>(copilot-accept-dismiss)')
vim.keymap.set('i', '<C-ç>n', '<Plug>(copilot-accept-next)')
vim.keymap.set('i', '<C-ç>p', '<Plug>(copilot-accept-previous)')
vim.keymap.set('i', '<C-ç>s', '<Plug>(copilot-accept-suggest)')

-- :Copilot panel



