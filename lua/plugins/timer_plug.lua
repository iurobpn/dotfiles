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
    local mod_color = require('plugins.gruvbox-term').bright_blue
    self.name = name or Timer.name
    self.ip = ip or Timer.ip
    self.port = port or Timer.port

    self.socket = Socket(self.ip, self.port, -1, mod_color)
    self.log = Log("tclient")
    self.log.module_color = mod_color
    self.log:log("Client Timer created.")

    if not self.socket then
        self.log:error("Error creating socket.")
    else
        self.log:log("Socket created.")
    end

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
        if not self.socket then
            self.log:error("Sokcet is empty on client start.")
        end
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
        self.log:log("Thread started.")
        if not self.socket then
            self.log:error("Socket is empty on client start.")
        end
        -- self.log:log("Sending start message to server.")
        -- time.sleep(0.1) -- self.socket.socket:sleep(0.5)
        -- self:send("start")
        self.log:log("Server started.")

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
function Timer:send(msg, noclose)

    self.log:log("Sending message to server: " .. msg)
    if not self.socket then
        self.log:error("Socket is empty on client start.")
    end
    self.log:log(string.format("Connecting to server at address %s:%s", self.ip, self.port))
    local client = self.socket:connect(self.ip, self.port)
    self.socket.socket = client

    if client then
        self.log:log("socket connected at " .. self.ip .. ":" .. self.port)
        local bytes, err = self.socket.socket:send(msg)
        if err then
            self.log:error("Error sending message: " .. err)
        else
            self.log:log("Message sent to server: " .. msg)
        end
    else
        self.log:error("socket connection error: " .. err)
    end
    -- self:check_connection()
    -- require'plugins.time'.sleep(0.1)  -- Prevent tight loop
    -- local serpent = require('serpent')
    return client
end

function Timer:receive()
    local client = self.socket:connect(self.ip, self.port)
    self.socket.socket = client
    local msg, err
    if client then
        msg, err = self.socket:receive()
        if err then
            if err == "closed" then
                self.log:error("Connection lost. Reconnecting...")
                self.socket:close()
            else
                self.log:error("Receive error: " .. err)
            end
        elseif msg then
            self.log:log("Received from server: " .. msg)
        end
    end
    require'plugins.time'.sleep(0.1) -- to prevent tight loop
    return msg, err
end


function Timer:stop()
    self.socket.socket = require'socket'.connect(self.ip, self.port)
    -- if self.socket.socket then
    --     self.log:log('socket connected to server')
    -- else
    --     self.log:error(string.format('Error sending stop command '))
    -- end
    -- local _, err = self.socket.socket:send("stop")
    -- if err then
    --     self.log:error("Error sending stop command: " .. err)
    -- else
    --     self.log:log("Stop command sent to server.")
    -- end
    -- -- local client = self:send("stop",true)
    --
    -- local time = require 'plugins.time'
    -- time.sleep(0.1)
    -- client = socket.connect(host, port)
    -- self.socket.socket = require'socket'.connect(self.ip, self.port)
    -- self.socket.socket:settimeout(5)
    local msg, err = self.socket.socket:receive()
    if not err then
        self.log:log("received:" .. msg)
        self.elapsed_time = tonumber(msg)
    else
        self.log:log("error connecting to server: " .. err)
    end

    -- self.socket:close()
    self.log:log("Timer client is returning.")
    self.log:log("Connected to server at " .. self.ip .. ":" .. self.port)
    return self.elapsed_time, err
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
