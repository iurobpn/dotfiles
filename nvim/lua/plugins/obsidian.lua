return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    -- lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "research",
                path = "~/sync/obsidian",
            },
        }, 
        -- Optional, boolean or a function that takes a filename and returns a boolean.
        -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
        disable_frontmatter = false,

        -- Optional, alternatively you can customize the frontmatter data.
        ---@return table
        note_frontmatter_func = function(note)
            -- Add the title of the note as an alias.
            local out = note:frontmatter()
            -- if note.title then
            --     note:add_alias(note.title)
            -- end
            --
            -- local out = { id = note.id, aliases = note.aliases, tags = note.tags }
            --
            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,

        -- see below for full list of options 👇
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "daily",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y-%m-%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            -- Optional, default tags to add to each new daily note created.
            default_tags = { "daily-notes" },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = 'daily_nvim.md'
        },
        preferred_link_style = "wiki",
        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            
            -- ["M-t"] = {
            --     action = function()
            --         require('obsidian').today()
            --     end
            -- },
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
    
            -- Toggle check-boxes.
            ["<CR>"] = {
                action = function()
                    if not require'dev.lua.tasks'.recurrent_done() then
                        require("obsidian").util.toggle_checkbox()
                    end
                end,
                opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<c-space>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            }
        },
        picker = {
            -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
            name = "fzf-lua",
            -- Optional, configure key mappings for the picker. These are the defaults.
            -- Not all pickers support all mappings.
            note_mappings = {
                -- Create a new note from your query.
                new = "<LocalLeader>x",
                -- Insert a link to the selected note.
                insert_link = "<LocalLeader>l",
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = "<LocalLeader>x",
                -- Insert a tag at the current location.
                insert_tag = "<LocalLeader>t",
            },
        },
        -- Optional, define your own callbacks to further customize behavior.
        callbacks = {
            -- Runs at the end of `require("obsidian").setup()`.
            ---@param client obsidian.Client
            -- post_setup = function(client) end,

            -- Runs anytime you enter the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            -- enter_note = function(client, note) end,

            -- Runs anytime you leave the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            -- leave_note = function(client, note) end,

            -- Runs right before writing the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            -- pre_write_note = function(client, note) end,

            -- Runs anytime the workspace is set/changed.
            ---@param client obsidian.Client
            ---@param workspace obsidian.Workspace
            -- post_set_workspace = function(client, workspace) end,
        },
        -- Optional, configure additional syntax highlighting / extmarks.
        -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
        ui = {
            enable = true,  -- set to false to disable all additional syntax features
            update_debounce = 200,  -- update delay after a text change (in milliseconds)
            max_file_length = 5000,  -- disable UI features for files with more than this many lines
            -- Define how various check-boxes are displayed
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["!"] = { char = "", hl_group = "ObsidianImportant" },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = require('gruvbox').palette.bright_orange },
                ObsidianDone = { bold = true, fg = require('gruvbox').palette.bright_blue },
                ObsidianRightArrow = { bold = true, fg = require('gruvbox').palette.bright_orange },
                ObsidianTilde = { bold = true, fg = require('gruvbox').palette.bright_purple },
                ObsidianImportant = { bold = true, fg = require('gruvbox').palette.bright_red },
                ObsidianBullet = { bold = true, fg = require('gruvbox').palette.faded_blue },
                ObsidianRefText = { underline = true, fg = require('gruvbox').palette.bright_purple },
                ObsidianExtLinkIcon = { fg = require('gruvbox').palette.bright_purple },
                ObsidianTag = { italic = true, fg = require('gruvbox').palette.bright_blue },
                ObsidianBlockID = { italic = true, fg = require('gruvbox').palette.bright_blue },
                ObsidianHighlightText = { bg = require('gruvbox').palette.faded_orange },
            },
        },
        -- other fields ...
        templates = {
            folder = 'templates',
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
            substitutions = {
                daily_tasks = function()
                    local contents = require('dev.lua.templater').get_expanded_file('/home/gagarin/.config/nvim/templates/daily.tpl')
                    if type(contents) == 'table' then
                        return table.concat(contents, '\n')
                    else if type(contents) == 'string' then
                            return contents
                        else
                            return ''
                        end
                    end
                end,
                daily = function()
                    return os.date("%Y-%m-%d", os.time() - 86400)
                end
            }
        },

    },
}
