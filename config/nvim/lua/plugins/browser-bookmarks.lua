return {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    -- Only required to override the default options
    opts = {
        -- Override default configuration values
        selected_browser = 'buku',
        url_open_command = 'xdg-open',
        -- config_dir = '~/.config/buku',
    },
    -- dependencies = {
    --   -- Only if your selected browser is Firefox, Waterfox or buku
    --   'kkharji/sqlite.lua',
    --
    --   -- Only if you're using the Telescope extension
    --   'nvim-telescope/telescope.nvim',
    -- }
}
