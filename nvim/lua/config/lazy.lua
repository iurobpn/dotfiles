
-- and to all directories under current directory recursively
-- set path+=$PWD/**
vim.g.maplocalleader = "ç"
-- Example for configuring Neovim to load user-installed installed Lua rocks:
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks51/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks51/share/lua/5.1/?.lua"

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
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "cpp", "latex" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {'nvim-treesitter/nvim-treesitter-refactor'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    {'nvim-treesitter/nvim-treesitter-context'},
    
    {"preservim/vim-markdown"},
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },
    {
	    'junegunn/fzf', 
	    dir = '~/.fzf',
	    build = './install --bin',
    },
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
    {'tpope/vim-fugitive'},
    {'itchyny/calendar.vim'},
    {'lewis6991/gitsigns.nvim'},
    -- {'Shougo/vimproc.vim', build = "make"},
    {'HiPhish/rainbow-delimiters.nvim'},
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'stevearc/overseer.nvim',
        'Civitasv/cmake-tools.nvim'
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    {'nvim-tree/nvim-web-devicons'},
    -- {'andymass/vim-matchup'},
    -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
    {'junegunn/vim-easy-align' },
    {'bfrg/vim-cpp-modern' },
    {'octol/vim-cpp-enhanced-highlight'},
    {'jiangmiao/auto-pairs'},
    {'mhinz/vim-grepper'},
    {'SirVer/ultisnips'},
    {'honza/vim-snippets'},
    -- install without yarn or npm
    -- {'gelguy/wilder.nvim'},
    {'puremourning/vimspector'},
    {'skywind3000/asynctasks.vim'},
    {
        "ptdewey/pendulum-nvim",
        config = function()
            require("pendulum").setup()
        end,
    },
    {
        "SunnyTamang/pendulum.nvim",
        config = function()
            require"pendulum".setup()
        end
    },
    -- Example for configuring Neovim to load user-installed installed Lua rocks:
    -- lazy snippet
    -- {
    --     "3rd/image.nvim",
    -- },
    --
    {'ludovicchabant/vim-gutentags'},
    {'MunifTanjim/nui.nvim'},
    { 'echasnovski/mini.nvim', version = '*' },
    {'junegunn/vim-easy-align'},
    {'rcarriga/nvim-notify'},
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
