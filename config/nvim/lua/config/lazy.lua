-- lazy snippet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=v1.4.2", lazyrepo, lazypath })
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
    {'tpope/vim-sensible'},
    {'milisims/nvim-luaref'},
    {'richardbizik/nvim-toc'},
    {'nvim-treesitter/nvim-treesitter-refactor'},
    -- {'nvim-treesitter/nvim-treesitter-context'},
    {"neovim/nvim-lspconfig"},
    {"preservim/vim-markdown"},
    {'RRethy/vim-illuminate'},
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },
    {
        "chrisgrieser/nvim-origami",
        event = "VeryLazy",
        opts = {}, -- needed even when using default config
    },
    -- {'kikofmas/grammarous.nvim'},
    -- {'dpelle/vim-LanguageTool'},
    -- {
    --     'stevearc/dressing.nvim',
    --     opts = {},
    -- },
    -- {"potamides/pantran.nvim"},
    -- {'uga-rosa/translate.nvim'},
    {
        'junegunn/fzf',
        dir = '~/.fzf',
        build = './install --bin',
    },

    {'godlygeek/tabular'},
    {'junegunn/fzf.vim'},
    -- {'ckunte/latex-snippets-vim'},
    -- {'gillescastel/latex-snippets'},
    -- {'AndrewRadev/linediff.vim'},
    {"github/copilot.vim"},
    {"vim-airline/vim-airline"},
    {"vim-airline/vim-airline-themes"},
    {'mbbill/undotree'},
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
    },
    {'tpope/vim-surround'},
    {'tomtom/tcomment_vim'},
    -- {'vim-autoformat/vim-autoformat'},
    {'tpope/vim-repeat'},
    {"airblade/vim-gitgutter"},
    {'tpope/vim-fugitive'},
    {'itchyny/calendar.vim'},
    -- {'lewis6991/gitsigns.nvim'},
    -- {'Shougo/vimproc.vim', build = "make"},
    {'HiPhish/rainbow-delimiters.nvim'},
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'stevearc/overseer.nvim',
    },
    {'ckunte/latex-snippets-vim'},
    {'nvim-tree/nvim-web-devicons'},
    -- {'andymass/vim-matchup'},
    -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
    {'bfrg/vim-cpp-modern' },
    -- {'octol/vim-cpp-enhanced-highlight'},
    {'jiangmiao/auto-pairs'},
    {'mhinz/vim-grepper'},
    {'SirVer/ultisnips'},
    {'honza/vim-snippets'},
    -- {
    --     'torikatsupg/deepl.nvim',
    --     setup = function()
    --         vim.env.deepl_nvim_apikey = 'your apikey of freeplan'
    --         vim.keymap.set('v', '<C-t>', function()
    --             vim.env.deepl_nvim_apikey = 'your api key'
    --             require 'deepl'.translate()
    --         end, { noremap = true, silent = true })
    --     end,
    -- },
    -- install without yarn or npm
    -- {'gelguy/wilder.nvim'},
    {'puremourning/vimspector'},
    -- {
    --     "ptdewey/pendulum-nvim",
    --     config = function()
    --         require("pendulum").setup({
    --             timeout_len = 300,  -- 5 minutes
    --             timer_len = 60,     -- 1 minute
    --             gen_reports = true, -- Enable report generation (requires Go)
    --             top_n = 10,         -- Include top 10 entries in the report
    --         })
    --     end,
    -- },
    -- Example for configuring Neovim to load user-installed installed Lua rocks:
    -- lazy snippet
    -- {
    --     "3rd/image.nvim",
    -- },

    {'ludovicchabant/vim-gutentags'},
    {'MunifTanjim/nui.nvim'},
    {
        'echasnovski/mini.nvim',
        version = false
    },
    { "tiagovla/scope.nvim" },
    {'junegunn/vim-easy-align'},
    -- {'rcarriga/nvim-notify'},
    { import = "plugins" }
})

-- require('fzf-lua').setup(require('plugins.fzf-lua'))
vim.g.calendar_google_calendar = 0

-- require('template').setup({
--     temp_dir = '/home/gagarin/.config/nvim/templates',
--     -- author = 'Iuro Nascimento',
--     -- email = 'iuro@ufmg.br',
-- })
-- Plug 'octol/vim-cpp-enhanced-highlight'
-- Plug 'shirk/vim-gas'
