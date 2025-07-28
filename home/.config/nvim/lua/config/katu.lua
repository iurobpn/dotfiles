local isdev = os.getenv("ISDEV") or "0"
if isdev=="0" then
    local path = vim.fn.stdpath("data") .. "/ggn/katu"
    if not vim.uv.fs_stat(path) then
        os.execute("git clone https://github.com/iurobpn/katu.git " .. path)
    end
    vim.opt.rtp:prepend(path)
end
_G.Katu = require('katu')
