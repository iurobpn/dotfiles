return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MdPreviewToggle", "MdPreview", "MdPreviewStop" },
    build = "cd app && yarn install",

    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}

