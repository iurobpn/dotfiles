local inspect = require'inspect'
function print_table(...)
    for i,v in pairs({...}) do
        print(inspect(v))
    end
    -- print(inspect(t,{depth=3}))
end

function print_mt(t)
    local mt = getmetatable(t)
    print_table(mt)
end

