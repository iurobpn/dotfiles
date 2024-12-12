local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, {desc = 'Add current file to harppon list' })
vim.keymap.set("n", "<F11>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'Toggle Harpoon window'})

    -- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'Harpoon list prev' })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'Harpoon list next' })
