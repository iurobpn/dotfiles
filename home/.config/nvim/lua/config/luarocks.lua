
local function run(cmd, raw)
    if raw == nil then raw = true end
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end
-- package.cpath = package.cpath .. lrocks_path .. ';'
-- require('config.rocks')
local path = vim.env.HOME .. "/.luarocks"
function set_lua_paths(path)

    local cmd = [[luarocks path --bin | sed -n '/LUA_PATH/p' | sed -e 's/.*\'\(.*\)\'/\1/']]

    local luarocksbin_path = run(cmd)

    local luarocks_path = {
        vim.fs.joinpath(path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";") .. ';' .. luarocksbin_path
    -- print('cmd 1:' .. cmd)
    -- print('luarocks bin path: ' .. luarocksbin_path)

    -- package.path = package.path .. ';' .. lrocks_path
    cmd = [[luarocks path --bin | sed -n '/LUA_CPATH/p' | sed -e 's/.*\'\(.*\)\'/\1/']]
    local luarocksbin_cpath = run(cmd)
    local luarocks_cpath = {
        vim.fs.joinpath(path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";") .. ';' .. luarocksbin_cpath
    vim.opt.runtimepath:append(vim.fs.joinpath(path, "lib", "luarocks", "*"))
end
set_lua_paths(path)
-- print('cmd 2:' .. cmd)
-- print('luarocks bin cpath: ' .. luarocksbin_cpath)

