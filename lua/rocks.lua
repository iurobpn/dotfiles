-- local rocks_config = {
--     rocks_path = vim.fn.stdpath("data") .. "/rocks",
-- }
--
-- vim.g.rocks_nvim = rocks_config
--
-- local luarocks_path = {
--     vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.4", "?.lua"),
--     vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.4", "?", "init.lua"),
-- }
-- package.path = package.path .. ";" .. table.concat(luarocks_path, ";")
--
-- local luarocks_cpath = {
--     vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.4", "?.so"),
--     vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.4", "?.so"),
--
-- }
-- package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")
--
-- vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.4", "rocks.nvim", "*"))
