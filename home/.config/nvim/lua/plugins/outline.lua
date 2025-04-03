return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    auto_jump = false,
    focus_on_open = true,
    keys = { -- Example mapping to toggle outline
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        -- Your setup opts here
    },
}
