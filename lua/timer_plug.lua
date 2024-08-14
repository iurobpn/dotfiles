local M = {}
M.llthreads = require("llthreads2.ex")
apr = require 'apr'
local Timer = {elapsed_time = 0, start_time = 0, paused = false}
function Timer.new()
    local self = setmetatable({}, {__index = Timer})
    return self
end

function M.now()
    return apr.time_now()
end

function Timer.sleep(seconds)
    apr.sleep(seconds)
end
-- Function to start the timer
function Timer.Tstart(self)
    if self.timer_thread and self.alive then
        print("Timer is already running.")
        return
    end
    self.alive = true

    if self.paused then
        self.start_time = M.now() - self.elapsed_time
        self.paused = false
        print("Timer resumed.")
    else
        self.elapsed_time = 0
        self.start_time = M.now()
        print("Timer started.")

        self.timer_thread = M.llthreads.new(function()

            local apr = require('apr')
            local start_time = apr.time_now()
            local t_int = 0;
            while true do
                apr.sleep(0.1)
                local t_now = math.floor(apr.time_now() - start_time)
                -- print(t_now .. " s")
                -- print(t_int .. " s")
                if t_int < t_now then
                    t_int = t_now
                    print(t_int .. " s\n")
                end
            end
        end)

        self.timer_thread:start()
    end
end

-- Function to pause the timer
function Timer:Tpause()
    if not self.timer_thread or not self.alive then
        print("No active timer to pause.")
        return
    end

    if self.paused then
        print("Timer is already self.paused.")
        return
    end

    self.elapsed_time = M.now() - self.start_time
    self.paused = true
    self.timer_thread:interrupt() -- Pause the timer by stopping the thread
    print("Timer self.paused.")
end

-- Function to stop the timer and get the self.elapsed time
function Timer:Tstop()
    if not self.timer_thread or not self.alive then
        self.alive = false
        if not self.paused then
            print("No active timer to stop.")
        else
            print("Timer was self.paused. Total self.elapsed time: " .. self.elapsed_time .. " seconds.")
        end
        return
    end

    self.alive = false
    self.elapsed_time = M.now() - self.start_time
    self.paused = false
    self.timer_thread:interrupt()
    -- Stop the timer by killing the thread
    print("Timer stopped. Total elapsed time: " .. self.elapsed_time .. " seconds.")
end

M.Timer = Timer
M.t = Timer.new()

M.tstart = function()
    M.t:Tstart()
end
M.tstop = function()
    M.t:Tstop()
end
M.tpause = function()
    M.t:Tpause()
end
-- Register the commands
vim.api.nvim_create_user_command("Start", M.tstart, {})
vim.api.nvim_create_user_command("Pause", M.tpause, {})
vim.api.nvim_create_user_command("Stop", M.tstop, {})

return M
