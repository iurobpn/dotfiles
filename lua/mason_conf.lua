require("mason").setup()

require("mason-nvim-dap").setup({
    ensure_installed = { "cppdbg" }
})

require("mason-nvim-lint").setup({
    ensure_installed = { "clangd" }
})
--[[
require("mason-lspconfig").setup( {
    ensure_installed = {
        "lua_ls",
        "bashls",
        "rust_analyzer",
        "clangd",
        "cmake",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "emmet_language_server",
        "fortls",
        "html",
        "jsonls",
        "tsserver",
        "autotools_ls",
        "ltex",
        "markdown_oxide",
        "matlab_ls",
        "mesonlsp",
        "opencl_ls",
        "openscad_lsp",
        "jedi_language_server",
        "r_language_server",
        "sqlls",
        "solidity",
        "tsserver",
        "vimls",
        "lemminx",
        "gitlab_ci_ls"
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
}
)
--]]
-- require("mason-nvim-dap").setup({
--     ensure_installed = { "python", "delve" }
-- })local dap = require("dap")
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "-i", "dap" }
-- }
