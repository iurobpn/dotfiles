require'plugins.utils'

local A = {a=1, b=2, c=3}
local mt = {}
mt.__call = function(...)
    print_table(...)
end
setmetatable(A, mt)



A(3,2,1)

