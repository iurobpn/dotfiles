require("obsidian").setup({
    mappings = {
            ["gf"] = {
                action = function()
                    local cur = vim.fn.expand('<cWORD>')
                    if cur:match("#%w+") then
                        return dev.lua.tasks.views.open_current_tag(cur)
                    else
                        return require("obsidian").util.gf_passthrough()
                    end
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
    }
}
