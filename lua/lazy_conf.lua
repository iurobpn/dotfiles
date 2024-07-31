
-- and to all directories under current directory recursively
-- set path+=$PWD/**
vim.g.maplocalleader = "ç"

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
                ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "cpp" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "/home/gagarin/sync/norg",
                            },
                            default_workspace = "notes",
                            index = "index.norg", -- The name of the main (root) .norg file
                        },
                    },
                    ["core.qol.todo_items"] = {
                        config = {
                            create_todo_items = true,
                            create_todo_parents = true,
                        },
                    },
                },
            }

            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end,
    },
    {'AndrewRadev/linediff.vim'},
    {"ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    {"github/copilot.vim"},
    {"vim-airline/vim-airline"},
    {"vim-airline/vim-airline-themes"},
    {'mbbill/undotree'},
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        build = "./install --bin"
        -- init = function()
        --     vim.cmd("call fzf#install()")
        -- end
    },
    {"junegunn/fzf.vim"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'tpope/vim-surround'},
    {'tomtom/tcomment_vim'},
    {'vim-autoformat/vim-autoformat'},
    -- {'windwp/nvim-ts-autotag'},
    {'preservim/tagbar'},
    {'tpope/vim-repeat'},
    {'tpope/vim-fugitive'},
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed, not both.
            -- "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {'lewis6991/gitsigns.nvim'},
    {'Shougo/vimproc.vim', build = "make"},
    {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
        "mfussenegger/nvim-lint",
        "rshkarin/mason-nvim-lint",   
    },
    -- {'sakhnik/nvim-gdb'},
    {'HiPhish/rainbow-delimiters.nvim'},
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'stevearc/overseer.nvim',
        'Civitasv/cmake-tools.nvim'
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
        "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
        lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            -- main one
            { "ms-jpq/coq_nvim", branch = "coq" },

            -- 9000+ Snippets
            { "ms-jpq/coq.artifacts", branch = "artifacts" },

            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            -- Need to **configure separately**
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
            -- - shell repl
            -- - nvim lua api
            -- - scientific calculator
            -- - comment banner
            -- - etc
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = true, -- if you want to start COQ at startup
                -- Your COQ settings here
            }
        end,
        -- config = function()
            -- Your LSP settings here
        -- end,
    },
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-treesitter/nvim-treesitter-refactor'},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    {'nvim-treesitter/nvim-treesitter-context'},
    -- {'andymass/vim-matchup'},
    -- {
    --     'dense-analysis/ale',
    --     config = function()
    --         -- Configuration goes here.
    --         local g = vim.g
    --
    --         g.ale_ruby_rubocop_auto_correct_all = 1
    --
    --         g.ale_linters = {
    --             ruby = {'rubocop', 'ruby'},
    --             lua = {'lua_language_server'}
    --         }
    --     end
    -- },
    -- {'neoclide/coc.nvim', branch = 'release'},
    -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
    {'junegunn/vim-easy-align' },
    -- {'bfrg/vim-cpp-modern' },
    -- {'octol/vim-cpp-enhanced-highlight'},
    {'jiangmiao/auto-pairs'},
    {'mhinz/vim-grepper'},
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {'SirVer/ultisnips'},
    {'honza/vim-snippets'},
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "research",
                    path = "~/sync/obsidian",
                },
            },

            -- see below for full list of options 👇
        },
    },
    -- {'gelguy/wilder.nvim'},
    {'puremourning/vimspector'},
})
vim.cmd('nmap <C-Space> <Plug>neorg.qol.todo-items.todo.task-cycle')

-- Plug 'octol/vim-cpp-enhanced-highlight'
-- Plug 'shirk/vim-gas'
