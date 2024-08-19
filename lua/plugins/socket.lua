local luasocket = require('socket')
local Log = require('plugins.log')

local Socket = {
    socket = nil,
    ip = "127.0.0.1",
    port = 12345,
    timeout = 0.1
}

function Socket:bind(ip, port)
    self.ip = ip or self.ip
    self.port = port or self.port
    self.socket = assert(luasocket.bind(self.ip, self.port))
    self.log:log("Binding to " .. self.ip .. ":" .. self.port)
    self.ip, self.port = self.socket:getsockname()
end

Socket = require('plugins.class').class(Socket, function(self, ip, port, timeout)

    self.ip = ip or Socket.ip
    self.port = port or Socket.port
    self.timeout = timeout or Socket.timeout
    self.log = Log('socket')
    self.log:log('socket created')
    -- self.socket = assert(require('socket').bind(self.ip, self.port))

    return self
end)

function Socket:send(data)
    if self.socket then
        self.socket:send(data)
    else
        self.log:log("socket not connected")
    end
end

function Socket:accept()
    if self.socket then
        return self.socket:accept()
    end
end

function Socket:close()
    if self.socket then
        self.socket:close()
        self.log:log("socket closed")
    end
end


function Socket:settimeout(timeout)
    if self.socket then
        self.socket:settimeout(timeout)
    end
end

function Socket:receive()
    if self.socket then
        return self.socket:receive()
    end
end

-- return lists of sockets that are ready to read or write
-- can be used with client on both lists in case of one server, one client communication
function Socket:select(recvs, sends, timeout)
    self.socket:settimeout(timeout)
    return self.socket:select(recvs, sends, timeout)
end

function Socket:listen(client)
    local out = false
    self.log:log('checking if client is listening')
    if client then
        local ip, port = client:getsockname()
        self.log:log("client ip address: " .. ip .. ":" .. port)
        local message, err = client:receive()
        if message then
            self.log:log('client received empty message with errot: ' .. err)
        else
            self.log:error('client received message: ' .. message .. ' with error: ' .. err)
        end
        self.log:log('client received message: ' .. message .. ' with error: ' .. err)
        if not err then
            self.log:log("Server received: " .. message)
            out = true
        else
            self.log:error("Server error while listening: " .. err)
            out = false
        end
    else
        client = self.socket:accept()
        self.log:error('client not connected')
        out = false
    end
    return out, msg, client
end

function Socket:connect(ip, port)
    self.ip = ip or self.ip
    self.port = port or self.port
    self.socket = assert(luasocket.connect(self.ip, self.port))
    self.log:log("client connected to " .. self.ip .. ":" .. self.port)
end

function Socket:getsockname()
    if self.socket then
        return self.socket:getsockname()
    end
end

return Socket
