local M = {}

M.uv= require('luv')
local debug = require('debug')
local inspect = require('inspect')

require'plugins.utils'

local pipe = M.uv.new_pipe(false)
pipe:read_start(function(err, data)
    if err then
        print('Error reading from pipe:', err)
        return
    end
    print('Received data: ', data)
end)

M.Thread = {
    alive = false,
    thread = nil,
    func = function() print('empty function') end,
    pipe = pipe
}

-- function M.Thread.__call(func)
--     local self = set({func = func}, {__index = M.Thread})
--     return self
-- end

function M.Thread.start(self, ...)
    if self.thread and self.alive then
        print("Thread is already running.")
        return
    end
    self.alive = true
    self.thread = M.uv.new_thread(self.func, ...)
    -- print("Thread started.")
end

function M.Thread.join(self)
    if not self.thread or not self.alive then
        print("No active thread to join.")
        return
    end
    self.thread:join()
    self.alive = false
    -- print("Thread joined.")
end

M.Thread = require('plugins.class').class(M.Thread, function(obj, type, func, ...)
    print('\ncreate class')
    print('obj')
    print_table(obj)
    print('func')
    print_table(func)
    print('...')
    print_table(...)
    -- debug.debug()
    if func then
        obj.func = func
    end
    return obj
end)

print('Thread tab')
print_table(M.Thread)

return M
