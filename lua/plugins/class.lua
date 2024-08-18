local M = {}

function M.class(type, func_handle_args)
    local mt = {}
    mt.__call = function(...)
        local obj = {}
        if func_handle_args then
            obj = func_handle_args(obj, ...)
        end
        setmetatable(obj, {__index = type})
        return  obj
    end
    type = setmetatable(type, mt)
    return type
end

return M

