local inspect = require'inspect'
function print_table(...)
    for i,v in pairs({...}) do
        print(inspect(v))
    end
    -- print(inspect(t,{depth=3}))
end

function print_mt(t)
    local mt = getmetatable(t)
    print_table(mt)
end

function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end
