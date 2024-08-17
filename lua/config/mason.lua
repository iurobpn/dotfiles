require("mason").setup()

require("mason-nvim-dap").setup({
    ensure_installed = { "cppdbg" }
})

require("mason-nvim-lint").setup({
    -- A list of linters to automatically install if they're not already installed. Example: { "eslint_d", "revive" }
    -- This setting has no relation with the `automatic_installation` setting.
    -- Names of linters should be taken from the mason's registry.
    ---@type string[]
    ensure_installed = {'clangd'},

    -- Whether linters that are set up (via nvim-lint) should be automatically installed if they're not already installed.
    -- It tries to find the specified linters in the mason's registry to proceed with installation.
    -- This setting has no relation with the `ensure_installed` setting.
    ---@type boolean
    automatic_installation = true,

    -- Disables warning notifications about misconfigurations such as invalid linter entries and incorrect plugin load order.
    quiet_mode = false,
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
