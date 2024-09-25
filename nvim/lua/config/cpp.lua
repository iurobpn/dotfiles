vim.api.nvim_set_keymap(
    "n",
    "<C-s>",
    [[:CocCommand clangd.switchSourceHeader<CR>]],
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<LocalLeader>s",
    [[:CocCommand clangd.symbolInfo<CR>]],
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<LocalLeader>m",
    [[:CocCommand clangd.memoryUsage<CR>]],
    { noremap = true, silent = true }
)

-- create user commands for the above mappings

vim.api.nvim_create_user_command("CppSourceHeader", "CocCommand clangd.switchSourceHeader", { nargs = 0 })
vim.api.nvim_create_user_command("CppSymbolInfo", "CocCommand clangd.symbolInfo", { nargs = 0 })
vim.api.nvim_create_user_command("ClangdMemoryUsage", "CocCommand clangd.memoryUsage", { nargs = 0 })

    -- :CocCommand clangd.switchSourceHeader vsplit
--:CocCommand clangd.symbolInfo
--semanticTokens.enable
--
    -- clangd.switchSourceHeader: switch between source/header files
    -- clangd.symbolInfo: resolve symbol info under the cursor
    -- clangd.memoryUsage: show memory usage
    -- clangd.ast: show AST
    -- clangd.install: install latest clangd release from GitHub
    -- clangd.update: check for updates to clangd from GitHub
