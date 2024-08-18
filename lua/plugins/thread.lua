local M = {}

M.uv= require('luv')
local serpent = require('serpent')
-- local inspect = require('inspect')

require'plugins.utils'

local pipe_in = M.uv.new_pipe(false)
local pipe_out = M.uv.new_pipe(false)

M.Thread = {
    running = false,
    thread = nil,
    func = function() print('empty function') end,
    pipe_in = pipe_in,
    pipe_out = pipe_out,
    alive = false
}

function M.Thread.start(self, ...)
    if self.thread and self.running then
        print("Thread is already running.")
        return
    end
    self.alive = true
    self.running = true
    local self_msg = serpent.dump(self)
    local msg = serpent.dump({ ... })
    self.thread = M.uv.new_thread(self.func, self, self.pipe_in, self.pipe_out, msg)
    -- print("Thread started.")
end

function M.Thread.join(self)
    if not self.thread or not self.running then
        print("No active thread to join.")
        return
    end
    self.thread:join()
    self.running = false
    -- print("Thread joined.")
end

M.Thread = require('plugins.class').class(M.Thread, function(obj, type, func)
    if func then
        obj.func = func
    end
    return obj
end)

return M
