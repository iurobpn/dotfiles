local gruvbox = require'plugins.gruvbox-term'

local Log = {
    log_level = "info",
    level = "info",
    module = nil,
    color = gruvbox.light0_hard,
    time_color = gruvbox.bright_purple,
    module_color = gruvbox.bright_yellow,
    dbg = require('debug'),
    time = require('plugins.time'),
    debug = function(self, msg)
        self:print(self:format(msg, "debug", gruvbox.bright_purple),"debug")
    end,
    info = function(self, msg)
        self:print(self:format(msg, "info", gruvbox.bright_green),"info")
    end,
    warn = function(self, msg)
        self:print(self:format(msg, "warn", gruvbox.bright_yellow), 'warn')
    end,
    error = function(self, msg)
        self:print(self:format(msg, "error", gruvbox.bright_red), 'error')
    end,
    fatal = function(self, msg)
        self:print(self:format(msg, "fatal", gruvbox.bright_red), 'fatal')
    end,
    trace = function(self, msg)
        self:print(self:format(msg, "trace", gruvbox.bright_aqua), 'trace')
    end,
    log = function(self, msg)
        self:print(self:format(msg,"trace", gruvbox.bright_aqua), 'trace')
    end,
}



function Log.level2num(level)
    if level == "debug" then
        return 6
    elseif level == "fatal" then
        return 5
    elseif level == "error" then
        return 4
    elseif level == "warn" then
        return 3
    elseif level == "trace" then
        return 2
    elseif level == "info" then
        return 1
    else
        return 0
    end
end

-- format: [time] [level] [file:line] [message]
function Log:format (message, level, color)
    local reset = gruvbox.light0
    if not color then
        color = ''
        reset = ''
    end
    if not level then
        level = self.level
    end

    if self.module then
        return string.format("%s[%s] %s[%s]%s %s[%s]%s %s%s\n", self.time_color, self.time.now(), color, level, reset, self.module_color, self.module, self.color,  message, gruvbox.reset)
    else
        return string.format("%s[%s] [%s] %s", self.color, self.time.now(), level, message, self.reset)
    end
    -- return string.format("[%s] [%s] [%s:%d] %s", self.time.now(), level, self.dbg.getinfo(2).short_src, self.dbg.getinfo(2).currentline, message)
end

function Log:print(msg,level)
    -- print("level: ",level)
    -- print("log_level: ",self.log_level)

    if self.level2num(self.log_level) >= self.level2num(level) then
        print(msg)
    end
end

Log = require('plugins.class').class(Log, function(obj, module)
    if module then
        obj.module = module
    end
    return obj
end)
return Log
