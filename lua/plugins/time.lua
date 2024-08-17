local M = {}

function M.now()
    -- Get the current high-resolution time in nanoseconds
    return  require('luv').hrtime()
end

function M.sleep(seconds)
    require('luv').sleep(seconds*1e3)
end

-- M.apr = apr

return M

