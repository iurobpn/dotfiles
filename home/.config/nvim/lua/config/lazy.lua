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

-- require("lazy").setup({
------------ PLUGINS   --------------
plugins = {
    {"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {'nvim-tree/nvim-tree.lua'},
    -- {"nvim-treesitter/nvim-treesitter-refactor"},
    -- {"nvim-treesitter/nvim-treesitter-context"},
    -- {"git@github.com:iurobpn/tasks.nvim"},
    {"neovim/nvim-lspconfig"},
    {
        "godlygeek/tabular",
        "preservim/vim-markdown"
    },
    {'laktak/tome'},
    {"RRethy/vim-illuminate"},
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
    {'rust-lang/rust.vim'},
    {"mfussenegger/nvim-lint"},
    {"github/copilot.vim"},
    {"vzze/cmdline.nvim"},
    -- {"vim-airline/vim-airline"},
    -- {"vim-airline/vim-airline-themes"},
    {"mbbill/undotree"},
    {"tpope/vim-surround"},
    {"tomtom/tcomment_vim"},
    {"tpope/vim-repeat"},
    {"airblade/vim-gitgutter"},
    {"tpope/vim-fugitive"},
    {"HiPhish/rainbow-delimiters.nvim"},
    -- {"stevearc/overseer.nvim"},
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
    {"nvim-tree/nvim-web-devicons"},
    {"morhetz/gruvbox", config = function() vim.cmd.colorscheme("gruvbox") end },
    {"bfrg/vim-cpp-modern" },
    {"octol/vim-cpp-enhanced-highlight"},
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
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    { import = "plugins" }
}
local isdev = os.getenv("ISDEV")
if isdev == "1" then
    table.insert(plugins, { "iurobpn/katu"})
    table.insert(plugins, { "iurobpn/tasks.nvim"})
end
require("lazy").setup(plugins)
-- require("fzf-lua").setup(require("plugins.fzf-lua"))

