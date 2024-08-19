local time = require 'plugins.time'
local Timer = require 'plugins.timer_plug'.Timer
local uv = require 'luv'
local Log = require 'plugins.log'
log = Log("main")

local ip = "127.0.0.1"
local port1 = 12345
local port2 = 12346

local t = Timer(ip, port1, "timer 1")

-- t.mode = "timer"
-- print("\n\ntimer in mode " .. t.mode)
local ts1 = t:start(5)
log:log("ts1: " .. ts1)

-- local t2 = Timer(ip, port2, "timer 2")
-- t2.mode = "stopwatch"
-- print("timer in mode " .. t2.mode)
-- t2:reset()
-- local ts = t2:start()
-- uv.run('nowait')
time.sleep(5)
print("\n")
-- log:log("ts2: " ..ts)
-- local tf = t2:stop()
-- print("t2.tf: " .. tf .. " " .. t2.unit)
-- t:join()
-- t2:join()
-- t2:print()
-- tf = t:stop()
time.sleep(1)
local tf = t:stop()
log:log("t.tf: " .. tf .. " " .. t.unit)
time.sleep(5)
-- tf = t2:stop()
-- print("t2.tf: " .. tf .. " " .. t2.unit)
-- t:join()
-- t2:join()
-- timer.test()
time.sleep(5)
-- while true do
--    uv.run('nowait')
-- end

