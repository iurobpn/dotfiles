timer = require 'timer'
Timer = timer.Timer


local t = Timer.new()

t.mode = "timer"
print("\n\ntimer in mode " .. t.mode)
t:reset()
t:start(5)

local t2 = Timer.new()
t2.mode = "stopwatch"
print("timer in mode " .. t2.mode)
t2:reset()
ts = t2:start()
k=0
for i=1, 1000000 do
    k=k+1
    k=k*1
end
print("\n")
print("ts: " ..ts)
local tf = t2:stop()
print("tf: " .. tf .. " " .. t2.unit)
t2:print()

timer.test()


