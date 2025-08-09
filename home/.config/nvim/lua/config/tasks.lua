local isdev = os.getenv("ISDEV") or "0"
if isdev=="0" then
    local path = vim.fn.stdpath("data") .. "/ggn/tasks.nvim"
    if not vim.uv.fs_stat(path) then
        os.execute("git clone https://github.com/iurobpn/tasks.nvim.git " .. path)
    end
    vim.opt.rtp:prepend(path)
end
-- vim.cmd('set rtp^=' .. path)

_G.Tasks = require'tasks'

local function open_daily_template()
    if _G.pkm_dir == nil then
        _G.pkm_dir = os.getenv('HOME') .. '/pkm'
    end
    local dir = _G.pkm_dir .. "/daily"
    local fname = os.date("%Y-%m-%d") .. ".md"
    --check if fname exists in dir
    local full_path = dir .. "/" .. fname

    if not require'katu.utils.fs'.file_exists(full_path) then
        local tmpl_dir =  vim.fn.stdpath("config") .. '/templates'
        vim.fn.mkdir(dir, "p")
        vim.cmd('edit ' .. full_path)

        vim.cmd('TemplIns ' .. tmpl_dir .. '/daily.tpl')
        vim.cmd('write')
    else
        vim.cmd('edit ' .. full_path)
    end
end
vim.api.nvim_create_user_command("Daily", open_daily_template, { desc = "Open daily note from template" })

