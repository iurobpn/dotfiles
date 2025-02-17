return {
    'daic0r/hashtags.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local hashtags = require('hashtags')
        hashtags.setup()
        vim.keymap.set('n', '<leader>hn', hashtags.nav_next)
        vim.keymap.set('n', '<leader>hp', hashtags.nav_prev)
        vim.keymap.set('n', '<leader>hs', hashtags.show_ui)
    end
}
