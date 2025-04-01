package = "conf-test"

version = "0.1-1"
-- revision = "1"

source = {
  url = ""
}

dependencies = {
    "lua = 5.1",
    "luasec",
    "luasocket",
    "lua-cjson",
    "dkjson",
    "inspect",
    "lsqlite3",
    "luafilesystem",
    "luasql-sqlite3",
    "lustache",
    "sqlite.lua"
}

build = {
    type="builtin",
}

-- "lua = 5.1",
