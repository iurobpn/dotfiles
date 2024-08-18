local M = {}
M.uv = require("luv")
M.inspect = require("inspect")
M.serpent = require("serpent")

Thread = require('plugins.thread').Thread
Timer = {
    elapsed_time = 0,
    start_time = 0,
    paused = false,
    running = false,
    alive = false,
    unit = "s"
}

-- Timer.__call = function(obj)
--     local self = setmetatable(obj, {__index = Timer})
--     return self
-- end
--
Timer = require('plugins.class').class(Timer)
print(M.inspect(Timer))
function Timer:run(pipe_in, pipe_out, self_msg, msg)
    local ok
    local self
    local serpent = require('serpent')
    local inspect = require('inspect')
    local uv = require('luv')
    local time = require('plugins.time')
    ok, self = serpent.load(self_msg)
    if not ok then
        print("Error loading self on timer thread.")
        return
    end

    print(inspect(self))
    self.thread.thread = uv.thread_self()
    if msg then
        ok, self.time_start = serpent.load(msg)
        if not ok then
            print("Error loading start time on timer thread.")
            return
        end
    else
        print('Time_start not sent to thread')
        self.time_start = time.now()
    end
    self.elapsed_time = 0
    self.pipe_in = pipe_in
    self.pipe_out = pipe_out

    print("Timer thread started")
    self.running = true

    if self.pipe_in then
        self.pipe_in:read_start(function(err, data)
            assert(not err, err)
            if data then
                local message = data:match("^%s*(.-)%s*$")
                if message == "pause" then
                    self:_pause()
                elseif message == "restart" then
                    self:_restart()
                elseif message == "reset" then
                    self:_reset()
                elseif message == "resume" then
                    self:_resume()
                elseif message == "stop" then
                    self:_stop()
                end
            else
                self.pipe_in:close()
            end
        end)
    end

    local i = 0
    while self.running do
        print("Timer thread iter", i)
        i = i + 1

        time.sleep(100)
        if not self.paused then
            local t_now = math.floor(time.now() - self.start_time)
            print(t_now .. " s")
        end
    end
    self.send(self.pipe_out,"stopped")

end



function Timer:join()
    if not self.thread then
        print("No active timer to join.")
        return
    end
    self.thread:join()
end


function Timer:restart()
    self.send(self.thread.pipe_in, "restart")
end

-- Function to restart the timer
function Timer:_restart()
    if not self.thread or not self.running then
        self:_reset()
        self:start()
    end

    if not self.paused then
        print("Timer is not paused.")
        return
    end

    self.elapsed_time = 0
    local time = require('plugins.time')
    self.start_time = time.now()
    self.paused = false
    print("Timer restarted.")
end

-- Function to start the timer
function Timer:start()
    if self.thread and self.running then
        print("Timer is already running.")
        return
    end

    if self.paused then
        print("Timer paused.")
        return
    else
        self.elapsed_time = 0
        self.thread = Thread(self.run)
        self.thread.pipe_out:read_start(function(err, data)
            assert(not err, err)
            if data then
                local ok = false
                ok, self.elapsed_time = M.serpent.load(data)
                if not ok then
                    print("Error loading elapsed time.")
                end
                self.alive = false
            else
                self.pipe_out:close()
            end
        end)
        local time = require('plugins.time')
        self.start_time = time.now()
        print("Timer Started. Start time: " .. M.inspect(self.start_time) .. " seconds.")

        self.thread:start(M.serpent.dump(self), M.serpent.dump(self.start_time))
        return self.start_time
    end
end



function Timer:pause()
    if not self.thread or not self.running then
        print("No active timer to pause.")
        return
    end
    -- send message to the thread through the pipe

    self.send(self.thread.pipe_in, "pause")
end

function Timer:_resume()
    if not self.thread or not self.running then
        print("No active timer to resume.")
        return
    end

    if not self.paused then
        print("Timer is not paused.")
        return
    end

    local time = require('plugins.time')
    self.start_time = time.now() - self.elapsed_time
    self.paused = false
end

function Timer:_reset()
    self.elapsed_time = 0
    self.start_time = require'time'.now()
    print("Timer reset.")
end

function Timer:reset()
    if not self.thread then
        print("Timer is  not running. Stop the timer before resetting.")
        return
    end
    self.send(self.thread.pipe_in, "reset")
end

function Timer:resume()
    if not self.thread or not self.running then
        print("No active timer to resume.")
        return
    end

    if not self.paused then
        print("Timer is not paused.")
        return
    end

    self.send(self.thread.pipe_in,"resume")
    print("Timer resumed.")
end


-- Method to send commands to the timer thread
function Timer.send(pipe, msg)
    -- local serpent = require('serpent')

    -- message = serpent.dump(command)
    pipe:write(msg .. "\n")
end


-- Function to pause the timer
function Timer:_pause()
    if not self.thread or not self.running then
        print("No active timer to pause.")
        return
    end

    if self.paused then
        print("Timer is already self.paused.")
        return
    end

    self.paused = true
    print("Timer self.paused.")
end

function Timer:stop()
    self.send(self.thread.pipe_in, "stop")

    local time = require 'plugins.time'
    while not self.thread.alive do
        time.sleep(100)
    end

    return self.elapsed_time
end
-- Function to stop the timer and get the self.elapsed time
function Timer:_stop()
    if not self.thread or not self.running then
        self.running = false
        if not self.paused then
            print("No active timer to stop.")
        else
            print("Timer was self.paused. Total self.elapsed time: " .. self.elapsed_time .. " seconds.")
        end
        return
    end

    local time = require('plugins.time')
    self.elapsed_time = time.now() - self.start_time + self.elapsed_time
    print("\nTimer stopped:\n Start time: " .. self.start_time .. " s, Stop time: " .. self.stop_time .. " s")
    print("Total elapsed time: " .. self.elapsed_time .. " seconds.")
    self.paused = false
    self.running = false
    -- Stop the timer by killing the thread
    print("Timer stopped. Total elapsed time: " .. self.elapsed_time .. " seconds.")
end

M.t = Timer()

M.start = function()
    print("Timer.start().")
    M.t:start()
end
M.stop = function()
    M.t:stop()
end
M.pause = function()
    M.t:pause()
end

-- Register the commands
if vim then
    vim.api.nvim_create_user_command("Start", M.start, {})
    vim.api.nvim_create_user_command("Pause", M.pause, {})
    vim.api.nvim_create_user_command("Stop", M.stop, {})
end

return M
