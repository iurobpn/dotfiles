-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
    name = "zellij run",
    builder = function()
        local file = vim.fn.expand("%:p")
        local cmd = { file }
        if vim.bo.filetype == "go" then
            cmd = { "go", "run", file }
        end
        if vim.bo.filetype == "python" then
            cmd = { "python", file }
        end
        if vim.bo.filetype == "lua" then
            cmd = { "zellij", "run", "-d", "right", "--", "lua", file }
        end
        return {
            cmd = cmd,
            components = {
                { "on_output_quickfix", set_diagnostics = true },
                "on_result_diagnostics",
                "default",
                -- {"open_output", on_start = "always"},
            },
            strategy = {
                "terminal",

                use_shell = true,
                close_on_exit = false,
                quit_on_exit = "never",
                open_on_start = false,
                -- hidden = false,
            }
        }
    end,
    -- action = "vsplit",
    condition = {
        filetype = { "sh", "python", "go", "lua" },
    },
}
