local Log = {
    module = nil,
    level = "info",
    dbg = require('debug'),
    time = require('plugins.time'),
    -- format: [time] [level] [file:line] [message]
    format = function (self, message, level)
        level = level or self.level
        if self.module then
            return string.format("[%s] [%s] [%s] %s", self.time.now(), level, self.module, message)
        else
            return string.format("[%s] [%s] %s", self.time.now(), level, message)
        end
        -- return string.format("[%s] [%s] [%s:%d] %s", self.time.now(), level, self.dbg.getinfo(2).short_src, self.dbg.getinfo(2).currentline, message)
    end,
    debug = function(self, msg)
        print(self:format(msg, "debug"))
    end,
    info = function(self, msg)
        print(self:format(msg, "info"))
    end,
    warn = function(self, msg)
        print(self:format(msg, "warn"))
    end,
    error = function(self, msg)
        print(self:format(msg, "error"))
    end,
    fatal = function(self, msg)
        print(self:format(msg, "fatal"))
    end,
    trace = function(self, msg)
        print(self:format(msg, "trace"))
    end,
    log = function(self, msg)
        print(self:format(msg))
    end,
}

Log = require('plugins.class').class(Log, function(obj, module)
    if module then
        obj.module = module
    end
    return obj
end)
return Log
