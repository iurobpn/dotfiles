local M = {}
M.uv = require('luv')
function M.now()
    -- Get the current high-resolution time in nanoseconds from a monotonic clock.
    return  M.uv.clock_gettime("monotonic").nsec/1e9

end

function M.sleep(seconds)
    M.uv.sleep(seconds*1e3)
end

-- M.apr = apr

return M

