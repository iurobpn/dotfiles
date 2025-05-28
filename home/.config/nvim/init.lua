local home = os.getenv('HOME')
vim.cmd('set packpath^=' .. home .. "/.config/nvim/pack")
-- ~/git/dotfiles/lua/config/settings.lua
vim.g.gruvbox_palette = require("config.gruvbox-colors").palette
require("config")

-- vim.g.airline_symbols.colnr='Ꞩ'

-- local rocks_config = {
-- 	rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
-- }
--
-- vim.g.rocks_nvim = rocks_config
--
-- local luarocks_path = {
-- 	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
-- 	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
-- }
-- package.path = package.path .. ";" .. table.concat(luarocks_path, ";")
--
-- local luarocks_cpath = {
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
-- 	-- Remove the dylib and dll paths if you do not need macos or windows support
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
-- 	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
-- }
-- package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")
--
-- vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

-- /home/gagarin/git/dotfiles/lua/plugins/init.lua
-- require('plugins.timer_plug')

--require('init_packer')

