-- local inspect = require("inspect")

local Log = require('plugins.log')
local Timer = {
    name = "server",
    socket = nil,
    elapsed_time = 0,
    start_time = 0,
    paused = false,
    running = false,
    alive = false,
    unit = "s"
}

Timer = require('plugins.class').class(Timer, function(self, ip, port, time_start, name)
    self.elapsed_time = 0
    local Socket = require('plugins.socket')
    self.socket = Socket(ip, port,2)
    if time_start then
        self.start_time = time_start
    end
    self.name = name or self.name

    self.running = false
    self.paused = false
    self.log = Log("tserver")
    self.log:log("Server Timer created.")

    return self
end)

function Timer:decode_message(data)
    if data then
        local message = data:match("^%s*(.-)%s*$")
        if message == "pause" then
            self:pause()
        elseif message == "restart" then
            self:restart()
        elseif message == "reset" then
            self:reset()
        elseif message == "resume" then
            self:resume()
        elseif message == "stop" then
            self:stop()
        else
            self.log:log("Server received invalid message: " .. message)
        end
    else
        self.log:log("Server received empty message.")
    end
end

function Timer:start(ip, port, time_start)
    if self.running then
        self.log:log("Server: Timer is already running.")
        return
    end

    if self.paused then
        self.log:log("Server: Timer paused.")
        return
    end

    self.time_start = time_start

    -- local inspect = require('inspect')
    local time = require('plugins.time')
    local uv = require('luv')

    require'plugins.utils'
    -- self.log:log(time_start)
    self:config()
    self.log:log('Server started at ' .. time.now() .. ' with client time start at ' .. time_start .. ' seconds')
    self.socket:bind(ip, port)
    self.log:log('Server listening to ' .. self.socket.ip .. ':' .. self.socket.port)
    -- if not self.socket then
    --     self.socket = Socket(self.ip, self.port)
    -- end

    local client = self.socket:accept()

    local i = 0
    self.log:log("starting loop")
    while self.running do
        self.log:log(self.name .. " iter " .. i)
        i = i + 1
        local ok
        local msg
        ok, msg, client = self.socket:listen(client)
        self.log:log('server: message return from socket')
        if ok then
            self:decode_message(msg)
        else
            self.log:log("no message received")
        end

        time.sleep(1)
        if not self.paused then
            local t_now = math.floor(time.now() - self.start_time)
            self.log:log(t_now .. " s")
        end
    end
    self.log:log('server stopped')
end


-- Function to restart the timer
function Timer:restart()
    if self.running then
        self:_reset()
        self:start()
    end

    if not self.paused then
        self.log:log("Timer is not paused.")
        return
    end

    self.elapsed_time = 0
    local time = require('plugins.time')
    self.start_time = time.now()
    self.paused = false
    self.log:log("Timer restarted.")
end

-- Function to start the timer
function Timer:config()
    local time = require('plugins.time')
    self.elapsed_time = 0
    self.running = true
    self.paused = false
    self.alive = true
    if not self.start_time then
        self.start_time = time.now()
    end
end

function Timer:resume()
    if not self.running then
        self.log:log("No active timer to resume.")
        return
    end

    if not self.paused then
        self.log:log("Timer is not paused.")
        return
    end

    local time = require('plugins.time')
    self.start_time = time.now() - self.elapsed_time
    self.paused = false
end

function Timer:reset()
    self.elapsed_time = 0
    self.start_time = require'time'.now()
    self.log:log("Timer reset.")
end


-- Function to pause the timer
function Timer:pause()
    if not self.running then
        self.log:log("No active timer to pause.")
        return
    end

    if self.paused then
        self.log:log("Timer is already paused.")
        return
    end

    self.paused = true
    self.log:log("Timer paused.")
end

-- Function to stop the timer and get the self.elapsed time
function Timer:stop()
    self.log:log('Server: stop() called')
    if not self.running then
        self.running = false
        if not self.paused then
            self.log:log("Server: no active timer to stop.")
        else
            self.log:log("Server: timer was paused. Total elapsed time: " .. self.elapsed_time .. " seconds.")
        end
        return
    end

    local time = require('plugins.time')
    self.elapsed_time = time.now() - self.start_time + self.elapsed_time
    self.log:log("\nServer: timer stopping:\n Start time: " .. self.start_time .. " s, Stop time: " .. self.stop_time .. " s")
    self.paused = false
    self.running = false
    self.socket:send(self.elapsed_time)
    self.log:log('server: time elapsed sent to client')
    -- Stop the timer by killing the thread
    self.log:log("Server: timer stopped. total elapsed time: " .. self.elapsed_time .. " seconds.")
    self.alive = false
end

return Timer
