local M = {}
M.uv = require("luv")
local time = require('plugins.time')

local Thread = require('plugins.thread').Thread
local Timer = {elapsed_time = 0, start_time = 0, paused = false, running = false}

-- Timer.__call = function(obj)
--     local self = setmetatable(obj, {__index = Timer})
--     return self
-- end
--
Timer = require('plugins.class').class(Timer)


-- Function to start the timer
function Timer.start(self)
    print("Timer start().")
    if self.thread and self.alive then
        print("Timer is already running.")
        return
    end
    self.alive = true

    if self.paused then
        self.start_time = time.now() - self.elapsed_time
        self.paused = false
        print("Timer resumed.")
    else
        self.elapsed_time = 0
        self.start_time = time.now()
        print("Timer Started.")

        self.thread = Thread(function(self)
            self = self or {}
            print("Timer thread started")
            local time = require('plugins.time')
            local t_int = 0
            local running = true

            if self.pipe then
                self.pipe:read_start(function(err, data)
                    assert(not err, err)
                    if data then
                        local message = data:match("^%s*(.-)%s*$")
                        if message == "pause" then
                            self:_pause()
                        elseif message == "resume" then
                            self:_resume()
                        elseif message == "stop" then
                            self:_stop()
                        end
                    else
                        pipe:close()
                    end
                end)
            end
            while running do
                print("Timer thread iter", i)

                time.sleep(0.1)
                if not self.paused then
                    local t_now = math.floor(time.now() - self.start_time)
                    print(t_now .. " s")
                end
            end
        end)

        self.thread:start()
    end
end



function Timer.pause(self)
    print("Timer pause().")
    if not self.thread or not self.alive then
        print("No active timer to pause.")
        return
    end

    self.elapsed_time = 0
    self.start_time = 0
    self.paused = false
    self.running = false
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

    self.start_time = time.now() - self.elapsed_time
    self.paused = false
end


-- Function to pause the timer
function Timer._pause(self)
    if not self.thread or not self.alive then
        print("No active timer to pause.")
        return
    end

    if self.paused then
        print("Timer is already self.paused.")
        return
    end

    self.paused = true
    self.thread:pause() -- Pause the timer by stopping the thread
    print("Timer self.paused.")
end

-- Function to stop the timer and get the self.elapsed time
function Timer:_stop()
    if not self.thread or not self.alive then
        self.running = false
        if not self.paused then
            print("No active timer to stop.")
        else
            print("Timer was self.paused. Total self.elapsed time: " .. self.elapsed_time .. " seconds.")
        end
        return
    end

    self.elapsed_time = time.now() - self.start_time + self.elapsed_time
    self.paused = false
    self.running = false
    self.thread:stop()
    -- Stop the timer by killing the thread
    print("Timer stopped. Total elapsed time: " .. self.elapsed_time .. " seconds.")
end

M.Timer = Timer

M.t = M.Timer()

M.start = function()
    print("M.Timer.start().")
    M.t:start()
end
M.stop = function()
    M.t:stop()
end
M.pause = function()
    M.t:pause()
end
-- Register the commands
vim.api.nvim_create_user_command("Start", M.start, {})
vim.api.nvim_create_user_command("Pause", M.pause, {})
vim.api.nvim_create_user_command("Stop", M.stop, {})

return M
