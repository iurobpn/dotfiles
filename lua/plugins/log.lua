local gruvbox = require'plugins.gruvbox-term'
local Log = {
    module = nil,
    color = gruvbox.light0_hard,
    time_color = gruvbox.bright_purple,
    module_color = gruvbox.bright_yellow,
    level = "info",
    dbg = require('debug'),
    time = require('plugins.time'),
    -- format: [time] [level] [file:line] [message]
    format = function (self, message, level, color)
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
    end,
    debug = function(self, msg)
        print(self:format(msg, "debug", gruvbox.bright_purple))
    end,
    info = function(self, msg)
        print(self:format(msg, "info", gruvbox.bright_green))
    end,
    warn = function(self, msg)
        print(self:format(msg, "warn", gruvbox.bright_yellow))
    end,
    error = function(self, msg)
        print(self:format(msg, "error", gruvbox.bright_red))
    end,
    fatal = function(self, msg)
        print(self:format(msg, "fatal", gruvbox.bright_red))
    end,
    trace = function(self, msg)
        print(self:format(msg, "trace", gruvbox.bright_aqua))
    end,
    log = function(self, msg)
        print(self:format(msg,"trace", gruvbox.bright_aqua))
    end,

}

Log = require('plugins.class').class(Log, function(obj, module)
    if module then
        obj.module = module
    end
    return obj
end)
return Log
