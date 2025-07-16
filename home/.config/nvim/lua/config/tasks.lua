local isdev = os.getenv("ISDEV") or "0"
if isdev=="0" then
    local path = vim.fn.stdpath("data") .. "/ggn/tasks.nvim"
    vim.opt.rtp:prepend(path)
end
-- vim.cmd('set rtp^=' .. path)

_G.Tasks = require'tasks'

local function open_daily_template()
    local home = os.getenv("HOME")
    local dir = home .. "/git/my/home/pkm/daily"
    local fname = os.date("%Y-%m-%d") .. ".md"
    --check if fname exists in dir
    local full_path = dir .. "/" .. fname

    if not require'utils.fs'.file_exists(full_path) then
        local tmpl_dir =  home .. "/git/my/home/dotfiles/home/.config/nvim/templates"
        vim.fn.mkdir(dir, "p")
        vim.cmd('edit ' .. full_path)

        vim.cmd('TemplIns ' .. tmpl_dir .. '/daily.tpl')
        vim.cmd('write')
    else
        vim.cmd('edit ' .. full_path)
    end
end
vim.api.nvim_create_user_command("Daily", open_daily_template, { desc = "Open daily note from template" })

