local Server = require'plugins.timer_server'

local host = '127.0.0.1'
local port = 12345

local Log = require'plugins.log'
-- Log.log_level = Log.Level.DEBUG
local server = Server(host,port,0,'server 1')
server:start(host,port,0)

print('server process exit')
