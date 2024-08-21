-- local inspect = require("inspect")
require('plugins.time')

local luasocket = require('socket')
local Log = require('plugins.log')

local Server = {
    name = "server",
    socket = nil,
    ip = "127.0.0.1",
    port = 12345,
    timeout = 0;
    elapsed_time = 0,
    start_time = 0,
    paused = false,
    running = false,
    clients = {},
    unit = "s"
}

Server = require('plugins.class').class(Server, function(self, ip, port, time_start, name)
    local mod_color = require('plugins.gruvbox-term').bright_orange
    self.elapsed_time = 0
    -- local Socket = require('plugins.socket')
    -- self.socket = Socket(ip, port, self.timeout, mod_color)
    if time_start then
        self.start_time = time_start
    end
    self.name = name or self.name

    self.running = false
    self.paused = false
    self.log = Log("tserver")
    self.log.module_color = mod_color
    self.log:log("server created.")

    return self
end)

function Server:decode_message(message)
    local client, data = unpack(message)
    self.log:debug("decoding message." .. data)
    if data then
        local message = data:match("^%s*(.-)%s*$")
        self.log:debug("received message: " .. message)
        if message == "pause" then
            self:pause()
        elseif message == "restart" then
            self:restart()
        elseif message == "reset" then
            self:reset()
        elseif message == "resume" then
            self:resume()
        elseif message == "start" then
            self.log:debug("received message: " .. message)
        elseif message == "stop" then
            self:stop(client)
        else
            self.log:warn("received invalid message: " .. message)
        end
    else
        self.log:log("server received empty message.")
    end
end

function Server:start(ip, port, time_start)
    if self.running then
        self.log:log("server is already running.")
        return
    end

    if self.paused then
        self.log:log("server paused.")
        return
    end
    self.running = true
    self.ip = ip or self.ip
    self.port = port or self.port
    self.log:debug("server started at " .. clock.now() .. " with client time start at " .. time_start .. " seconds")
    if time_start == 0 then
        self.log:error('Start time is zero, please set a start time.') -- if not time_start then
        time_start = clock.now()
        self.log:warn('setting start time to now: ' .. time_start) -- if not time_start then
    end

    self.start_time = time_start

    -- local inspect = require('inspect')
    require'plugins.utils'
    -- self.log:log(time_start)
    self:config()
    self.socket = assert(luasocket.bind(ip, port))
    self.socket:settimeout(0)
    self.log:info('Server started at ' .. clock.now() .. ' with client time start at ' .. time_start .. ' seconds')
    self.log:info('Server listening to ' .. self.ip .. ':' .. self.port)
    -- if not self.socket then
    --     self.socket = Socket(self.ip, self.port)
    -- end

    -- local client = self.socket:accept()

    local i = 0
    self.log:log("starting loop\n")
    while self.running do
        self.log:log(self.name .. " iter " .. i)
        local messages = self:listen_to_clients()

        if #messages > 0 then
            self.log:debug("received " .. #messages .. " messages.")
            for _, message in ipairs(messages) do
                self:decode_message(message)
            end
        else
            self.log:log("server did not received any messages")
        end

        i = i + 1

        clock.sleep(0.1)
        if not self.paused then
            local t_now = math.floor(clock.now() - self.start_time)
            self.log:log(t_now .. " s")
        end
    end
    self.log:info('server stopped')
end

function Server:listen_to_clients()
    local new_client = self.socket:accept()
    if new_client then
        -- new_client.settimeout(0)
        table.insert(self.clients, new_client)
        self.log:log('new client connected')
        -- clock.sleep(0.1)
    else
        self.log:log('no new clients connected')
    end

    local ready_to_read = {self.socket}

    if #self.clients > 0 then
        self.log:log("clients connected: " .. #self.clients)
        for i, client in ipairs(self.clients) do
            ready_to_read[#ready_to_read + 1] = client
        end
        self.log:log("ready to read clients list: " .. #ready_to_read)
    else
        self.log:log("no clients connected.")
    end

    -- Use select to wait for activity with a timeout
    if #ready_to_read == 0 then
        self.log:log("no clients to read from.")
        return {}
    elseif #ready_to_read == 1 and ready_to_read[1] == self.socket then
        self.log:log("only the server is ready to read.")
    end
    self.log:log("server socket inspection." ..require('inspect')(self.socket))
    local readable, _, err = luasocket.select(ready_to_read, nil, 0)
    self.log:log("readable clients list: " .. #readable)

    if err then
        self.log:trace("select: " .. err)
    end
    local messages = {}
    -- Handle readable clients
    for _, client in ipairs(readable) do
        if client == self.socket then
            self.log:log("server socket is ready to read.")
            -- Skip the server socket itself, since it's handled above
        else
            self.log:log("client is ready to read.")
            client:settimeout(0)
            local message, err = client:receive()
            if err then
                if err == "closed" then
                    self.log:trace("client disconnected.")
                    -- Remove client from the list
                    for i, c in ipairs(self.clients) do
                        if c == client then
                            table.remove(self.clients, i)
                            break
                        end
                    end
                    client:close()
                else
                    self.log:error("receive error: " .. err)
                    if not message then
                        self.log:error("message is nil.")
                    end
                    -- print(' a' .. self.err)
                end
            elseif message then
                self.log:debug("received new message from client " .. require'inspect'.inspect(client) .. ": " .. message)
                -- client:send("echo: " .. message .. "\n")
                table.insert(messages, {client, message})
                -- print(' an' .. self.ok)
            end
            -- print('a' .. self.ok)
        end
    end
    -- if #readable > 0 then
    --     print('j' .. self.als)
    -- end

    return messages
end


-- Function to restart the Server
function Server:restart()
    if not self.running then
        self.log:info("no active Server to restart.")
        return nil
    end

    self.elapsed_time = 0
    self.start_time = clock.now()
    self.paused = false
    self.log:info(string.format("timer restarted at %s s", self.start_time))
    return true
end

-- Function to start the Server
function Server:config()
    self.elapsed_time = 0
    self.running = true
    self.paused = false
    if not self.start_time then
        self.start_time = clock.now()
    end
end

function Server:resume()
    if not self.running then
        self.log:log("no active Server to resume.")
        return
    end

    if not self.paused then
        self.log:debug("received pause command, but server is not paused.")
        return
    end

    self.start_time = clock.now() - self.elapsed_time
    self.log:info("timer resumed at " .. self.elapsed_time .. " seconds.")
    self.paused = false
end

function Server:reset()
    self.elapsed_time = 0
    self.start_time = clock.now()
    self.log:log("server reset.")
end


-- Function to pause the Server
function Server:pause()
    if not self.running then
        self.log:info("no active Server to pause.")
        return
    end

    if self.paused then
        self.log:info("server is already paused.")
        return
    end
    self.log:debug(string.format("elapsed time before %s seconds", self.elapsed_time))
    self.log:debug(string.format("start time before %s seconds", self.start_time))
    self.elapsed_time = self.elapsed_time + clock.now() - self.start_time

    self.paused = true
    self.log:info(string.format("paused at %s seconds", self.elapsed_time))
end

-- Function to stop the Server and get the self.elapsed time
function Server:stop(client)
    self.log:debug('Server: stop() called')
    if not self.running then
        self.running = false
        if not self.paused then
            self.log:log("server has not started to stop.")
        else
            self.log:info("server is paused")
            -- self.log:info("total elapsed time: " .. self.elapsed_time .. " seconds.")
        end
        return
    end

    if not self.paused then
        self.elapsed_time = clock.now() - self.start_time + self.elapsed_time
    end
    self.log:debug("server stopping:\n start time: " .. self.start_time .. " s" .. "\n elapsed time: " .. self.elapsed_time .. " s")
    self.paused = false
    self.running = false
    local _, err = client:send(self.elapsed_time)
    if err then
        self.log:error(string.format("error sending message: %s", err))
    else
        self.log:debug(string.format("elasped time successully sent to client: %s seconds", self.elapsed_time or 0))
    end
    -- clock.sleep(10)
    self.log:info(string.format('server stopping, elapsed time sent to client: %s seconds', self.elapsed_time))
    -- Stop the Server by killing the thread
end

return Server

