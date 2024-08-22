local M = {}

-- TODO create a private members table to be automatically detected by the __index metamethod
function M.class(type, func_handle_args)
    local mt = {}
    mt.__call = function(Type, ...)
        local obj = {}
        if func_handle_args then
            obj = func_handle_args(obj, ...)
        end
        setmetatable(obj, {__index = Type})
        return  obj
    end
    type = setmetatable(type, mt)
    return type
end

return M
