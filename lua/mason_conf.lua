require("mason").setup()

require("mason-nvim-dap").setup({
    ensure_installed = { "cppdbg" }
})

require("mason-nvim-lint").setup({
    ensure_installed = { "clangd" }
})
require("mason-lspconfig").setup( {
    ensure_installed = {
        "lua_ls",
        "bashls",
        "rust_analyzer",
        "clangd",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "emmet_language_server",
        "html",
        "jsonls",
        "tsserver",
        "ltex",
        "markdown_oxide",
        "matlab_ls",
        "mesonlsp",
        "opencl_ls",
        "r_language_server",
        "sqlls",
        "solidity",
        "tsserver",
        "vimls",
        "lemminx",
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
-- require("mason-nvim-dap").setup({
--     ensure_installed = { "python", "delve" }
-- })local dap = require("dap")
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "-i", "dap" }
-- }
