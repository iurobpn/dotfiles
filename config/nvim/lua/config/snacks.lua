---@class snacks.toggle.Config
---@field icon? string|{ enabled: string, disabled: string }
---@field color? string|{ enabled: string, disabled: string }
return {
    map = vim.keymap.set, -- keymap.set function to use
    which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
    notify = true, -- show a notification when toggling
    -- icons for enabled/disabled states
    icon = {
        enabled = " ",
        disabled = " ",
    },
    -- colors for enabled/disabled states
    color = {
        enabled = "green",
        disabled = "yellow",
    },
    ---@type snacks.scope.Config
    scope = {
        min_size = 5,
        max_size = 20,
        siblings = true,
    },
    -- animate scopes. Enabled by default for Neovim >= 0.10
    -- Works on older versions but has to trigger redraws during animation.
    ---@type snacks.animate.Config|{enabled?: boolean}
    animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        easing = "outQuad",
        duration = {
            step = 20, -- ms per step
            total = 300, -- maximum duration
        },
    },
    -- what buffers to dim
    filter = function(buf)
        return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
    end,
    bigfile = {
        notify = true, -- show notification when big file detected
        size = 1.5 * 1024 * 1024, -- 1.5MB
        -- Enable or disable features when big file detected
        ---@param ctx {buf: number, ft:string}
        setup = function(ctx)
            vim.cmd([[NoMatchParen]])
            require'snacks'.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
            vim.b.minianimate_disable = true
            vim.schedule(function()
                vim.bo[ctx.buf].syntax = ctx.ft
            end)
        end,
    },
}
