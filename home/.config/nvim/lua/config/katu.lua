local isdev = os.getenv("ISDEV") or "0"
if isdev=="0" then
    local path = vim.fn.stdpath("data") .. "/ggn/katu"
    vim.opt.rtp:prepend(path)
end
_G.Katu = require('katu')
