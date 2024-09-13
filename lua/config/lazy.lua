
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
    -- {
    --     "vhyrro/luarocks.nvim",
    --     priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    --     opts = {
    --         rocks = { "fzy", "pathlib.nvim ~> 1.0" }, -- specifies a list of rocks to install
    --         -- luarocks_build_args = { "--with-lua=/my/path" }, -- extra options to pass to luarocks's configuration script
    --     },
    -- },
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
    {
        "klen/nvim-config-local",
        config = function()
            require('config-local').setup {
                -- Default options (optional)

                -- Config file patterns to load (lua supported)
                config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

                -- Where the plugin keeps files data
                hashfile = vim.fn.stdpath("data") .. "/config-local",

                autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
                commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
                silent = false,             -- Disable plugin messages (Config loaded/ignored)
                lookup_parents = false,     -- Lookup config files in parent directories
            }
        end
    },
    -- Lazy
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("chatgpt").setup(
    --         {
    --                 api_cmd_key = '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',
    --                 -- this config assumes you have OPENAI_API_KEY environment variable set
    --                 openai_params = {
    --                     -- NOTE: model can be a function returning the model name
    --                     -- this is useful if you want to change the model on the fly
    --                     -- using commands
    --                     -- Example:
    --                     -- model = function()
    --                     --     if some_condition() then
    --                     --         return "gpt-4-1106-preview"
    --                     --     else
    --                     --         return "gpt-3.5-turbo"
    --                     --     end
    --                     -- end,
    --                     model = "gpt-4",
    --                     frequency_penalty = 0,
    --                     presence_penalty = 0,
    --                     -- max_tokens = 4095,
    --                     -- temperature = 0.2,
    --                     -- top_p = 0.1,
    --                     -- n = 1,
    --                 }
    --             }
    --         )
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "folke/trouble.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     },
    -- },
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ['core.ui.calendar'] = {},
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
    -- {
    --     'AckslD/messages.nvim',
    --     config = 'require("messages").setup()',
    -- },
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },
    -- {'ckunte/latex-snippets-vim'},
    -- {'gillescastel/latex-snippets'},
    -- {'AndrewRadev/linediff.vim'},
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
            vim.g.vimtex_mappings_enabled=1
            vim.g.vimtex_fold_enabled=0
            vim.g.vimtex_syntax_conceal_disable=1
            vim.g.vimtex_quickfix_enabled=1
            vim.g.vimtex_quickfix_open_on_warning = 0
            vim.g.vimtex_quickfix_ignore_filters = { 'Warning', 'Package', 'Missing character'}
            vim.g.vimtex_quickfix_mode = 1
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
    { 'glacambre/firenvim', build = ":call firenvim#install(0)" },
    -- {
    --     'stevearc/quicker.nvim',
    --     event = "FileType qf",
    --     ---@module "quicker"
    --     ---@type quicker.SetupOptions
    --     opts = {},
    -- },
    {"junegunn/fzf.vim"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'tpope/vim-surround'},
    {'tomtom/tcomment_vim'},
    -- {'vim-autoformat/vim-autoformat'},
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
    {'ibhagwan/fzf-lua'},
    {'lewis6991/gitsigns.nvim'},
    -- {'Shougo/vimproc.vim', build = "make"},
    -- {
    --     "williamboman/mason.nvim",
    --     "neovim/nvim-lspconfig",
    --     "williamboman/mason-lspconfig.nvim",
    --     "mfussenegger/nvim-dap",
    --     "jay-babu/mason-nvim-dap.nvim",
    --     "mfussenegger/nvim-lint",
    --     "rshkarin/mason-nvim-lint",   
    -- },
    -- {'sakhnik/nvim-gdb'},
    {'HiPhish/rainbow-delimiters.nvim'},
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'stevearc/overseer.nvim',
        'Civitasv/cmake-tools.nvim'
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    -- {
    --     "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    --     lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    --     dependencies = {
    --         -- main one
    --         { "ms-jpq/coq_nvim", branch = "coq" },
    --
    --         -- 9000+ Snippets
    --         { "ms-jpq/coq.artifacts", branch = "artifacts" },
    --
    --         -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    --         -- Need to **configure separately**
    --         { 'ms-jpq/coq.thirdparty', branch = "3p" }
    --         -- - shell repl
    --         -- - nvim lua api
    --         -- - scientific calculator
    --         -- - comment banner
    --         -- - etc
    --     },
    --     init = function()
    --         vim.g.coq_settings = {
    --             auto_start = true, -- if you want to start COQ at startup
    --             -- Your COQ settings here
    --         }
    --     end,
    --     -- config = function()
    --         -- Your LSP settings here
    --     -- end,
    -- },
    {'nvim-tree/nvim-web-devicons'},
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
    {'neoclide/coc.nvim', branch = 'release'},
    -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
    {'junegunn/vim-easy-align' },
    {'bfrg/vim-cpp-modern' },
    {'octol/vim-cpp-enhanced-highlight'},
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
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MdPreviewToggle", "MdPreview", "MdPreviewStop" },
        build = "cd app && yarn install",

        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
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
    -- { 'rasulomaroff/reactive.nvim' },
    {
        'nvimdev/template.nvim',
        cmd = {'Template','TemProject'},
        config = function()
            require('template').setup({
                temp_dir = '~/.config/nvim/templates',
        --         author = 'Iuro Nascimento',
        --         email = 'iuro@ufmg.br',
            })
        end
    },
    {
        'https://github.com/kperath/dailynotes.nvim',
        config = function() require "dailynotes".setup({
            path = '~/sync/obsidian/daily/',
        }) end
    },
    {'rcarriga/nvim-notify'},
    {'xuhdev/vim-latex-live-preview'},
    {
        "epwalsh/pomo.nvim",
        version = "*",  -- Recommended, use latest release instead of latest commit
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
        dependencies = {
            -- Optional, but highly recommended if you want to use the "Default" timer
            "rcarriga/nvim-notify",
        },
        opts = {
            -- See below for full list of options 👇
        },
    }
})

-- require('template').setup({
--     temp_dir = '/home/gagarin/.config/nvim/templates',
--     -- author = 'Iuro Nascimento',
--     -- email = 'iuro@ufmg.br',
-- })
-- Plug 'octol/vim-cpp-enhanced-highlight'
-- Plug 'shirk/vim-gas'
