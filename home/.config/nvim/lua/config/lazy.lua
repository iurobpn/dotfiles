-- lazy snippet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

------------ PLUGINS   --------------
require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    -- {"milisims/nvim-luaref"},
    -- {"richardbizik/nvim-toc"},
    -- {"nvim-treesitter/nvim-treesitter-refactor"},
    -- {"nvim-treesitter/nvim-treesitter-context"},
    {"git@github.com:iurobpn/tasks.nvim"},
    {"duckdm/neowarrior.nvim"},
    {"neovim/nvim-lspconfig"},
    {
        "godlygeek/tabular",
        "preservim/vim-markdown"
    },
    {'laktak/tome'},
    {"RRethy/vim-illuminate"},
    -- {
    --     "chrisgrieser/nvim-origami",
    --     event = "VeryLazy",
    --     opts = {}, -- needed even when using default config
    -- },
    -- {"kikofmas/grammarous.nvim"},
    -- {"dpelle/vim-LanguageTool"},
    -- {"potamides/pantran.nvim"},
    -- {"uga-rosa/translate.nvim"},
    {
        "junegunn/fzf",
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = true,
        },
        dir = "~/.fzf",
        build = "./install --bin",
    },
    {"junegunn/fzf.vim"},
    -- {"AndrewRadev/linediff.vim"},
    {"mfussenegger/nvim-lint"},
    {"github/copilot.vim"},
    -- {"vim-airline/vim-airline"},
    -- {"vim-airline/vim-airline-themes"},
    {"mbbill/undotree"},
    {"tpope/vim-surround"},
    {"tomtom/tcomment_vim"},
    -- {"vim-autoformat/vim-autoformat"},
    {"tpope/vim-repeat"},
    {"airblade/vim-gitgutter"},
    {"tpope/vim-fugitive"},
    -- {"itchyny/calendar.vim"},
    -- {"lewis6991/gitsigns.nvim"},
    -- {"Shougo/vimproc.vim", build = "make"},
    {"HiPhish/rainbow-delimiters.nvim"},
    -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- {"stevearc/overseer.nvim"},
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
    {"nvim-tree/nvim-web-devicons"},
    -- {"andymass/vim-matchup"},
    {"morhetz/gruvbox", config = function() vim.cmd.colorscheme("gruvbox") end },
    -- {"bfrg/vim-cpp-modern" },
    -- {"octol/vim-cpp-enhanced-highlight"},
    {"jiangmiao/auto-pairs"},
    {"mhinz/vim-grepper"},
    {"SirVer/ultisnips"},
    {"honza/vim-snippets"},
    {"ckunte/latex-snippets-vim"},
    -- install without yarn or npm
    -- {"gelguy/wilder.nvim"},
    -- {"puremourning/vimspector"},
    {"ludovicchabant/vim-gutentags"},
    {"MunifTanjim/nui.nvim"},
    {
        "echasnovski/mini.nvim",
        version = false
    },
    { "tiagovla/scope.nvim" },
    {"junegunn/vim-easy-align"},
    { import = "plugins" }
})

-- require("fzf-lua").setup(require("plugins.fzf-lua"))
vim.g.calendar_google_calendar = 0

