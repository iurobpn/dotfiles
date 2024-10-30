-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
    name = "run: admmPre (Debug)",
    builder = function()
        return {
            cwd = "~/git/nmpc-obs/cpp/build/Debug", 
            -- args = { "Debug", "admmPre" },
            cmd = "zellij run -f -- ./admmPre",
            components = {
                { "on_output_quickfix", set_diagnostics = true },
                "on_result_diagnostics",
                "default",
                -- {"open_output", on_start = "always"},
            },
            -- strategy = {
            --     "toggleterm",
            --
            --     use_shell = true,
            --     close_on_exit = false,
            --     quit_on_exit = "never",
            --     open_on_start = true,
            --     -- hidden = false,
            -- },
        }
    end,
    condition = {
        dir = "~/git/nmpc-obs/cpp", 
    },
    -- action = "vsplit",
    -- condition = {
    --     filetype = { "cpp", "h", "hpp"},
    -- },
}
