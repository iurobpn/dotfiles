local M = {}
-- local uv = require("luv")
local inspect = require("inspect")

local Socket = require('plugins.socket')
local Log = require('plugins.log')

local Thread = require('plugins.thread')
local Timer = {
    name = "timer",
    ip = '127.0.0.1',
    port = 12345,
    socket = nil,
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

Timer = require('plugins.class').class(Timer, function(self, ip, port, name)

    self.name = name or Timer.name
    self.ip = ip or Timer.ip
    self.port = port or Timer.port

    self.socket = Socket(self.ip, self.port)
    self.log = Log("tclient")
    self.log:log("Client Timer created.")

    return self
end)

function Timer:join()
    if not self.thread then
        self.log:log("No active timer to join.")
        return
    end
    self.thread:join()
end

function Timer:restart()
    self.socket:send("restart")
end

-- Function to start the timer
function Timer:start()
    if self.thread and self.running then
        self.log:log("Timer is already running.")
        return
    end

    if self.paused then
        self.log:log("Timer paused.")
        return
    else
        -- local Thread = require('plugins.thread')
        self.elapsed_time = 0
        self.thread = Thread(function (ip, port, time_start, name)
            local Server = require('plugins.timer_server')
            local timer = Server(ip, port, time_start, name)
            timer:start(ip, port, time_start, name)
        end)

        local time = require('plugins.time')
        self.start_time = time.now()
        self.log:log("timer start time: " .. inspect(self.start_time) .. " seconds.")

        self.thread:start(self.ip, self.port, self.start_time)

        time.sleep(0.1)
        self.socket:connect(self.ip, self.port)
        self.log:log("socket connected at " .. self.ip .. ":" .. self.port)
        return self.start_time
    end
end



function Timer:pause()
    if not self.thread or not self.running then
        self.log:log("No active timer to pause.")
        return
    end
    self.socket:send("pause")
end

function Timer:reset()
    if not self.thread then
        self.log:log("Timer is  not running. Stop the timer before resetting.")
        return
    end
    self.socket:send("reset")
end

function Timer:resume()
    if not self.thread or not self.running then
        self.log:log("No active timer to resume.")
        return
    end

    if not self.paused then
        self.log:log("Timer is not paused.")
        return
    end

    self.socket:send("resume")
    self.log:log("Timer resumed.")
end


-- Method to send commands to the timer thread
function Timer:send(msg)
    -- local serpent = require('serpent')

    -- message = serpent.dump(command)
    self.socket:send(msg)
end


function Timer:stop()
    self.log:log('Stop command sent to server')
    self.socket:send("stop")

    local time = require 'plugins.time'
    self.socket:settimeout(10)
    require'plugins.time'.sleep(0.1)
    local msg, err = self.socket:receive()
    if not err then
        self.log:log("received:" .. msg)
        self.elapsed_time = tonumber(msg)
    else
        self.log:log("error:" .. err)
    end

    return err, self.elapsed_time
end

if vim then
    M.t = Timer()

    M.start = function()
        print("Timer start.")
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
end
M.Timer = Timer

return M
