local time = require 'plugins.time'
require 'plugins.timer_plug'


local t = Timer()

t.mode = "timer"
print("\n\ntimer in mode " .. t.mode)
t:start(5)

local t2 = Timer()
t2.mode = "stopwatch"
print("timer in mode " .. t2.mode)
-- t2:reset()
local ts = t2:start()
time.sleep(5)
print("\n")
print("ts: " ..ts)
local tf = t2:stop()
print("t2.tf: " .. tf .. " " .. t2.unit)
-- t:join()
-- t2:join()
-- t2:print()
tf = t:stop()
print("t.tf: " .. tf .. " " .. t.unit)

-- timer.test()

