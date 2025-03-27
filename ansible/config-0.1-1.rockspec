package = "config"

version = "0.1-1"
-- revision = "1"

source = {
  url = ""
}
description = {
    license = 'MIT'
}
dependencies = {
    "lua = 5.1",
    "lua-cjson",
    "dkjson",
    "inspect",
    "lua-cjson",
    "luafilesystem",
    "luasql-sqlite3",
    "lustache",
}

build = {
    type="builtin",
}
