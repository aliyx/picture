module("util.stopwatch", package.seeall)

_VERSION = '0.1'

local mt = { __index = util.stopwatch }

local time = require("util.time")

function new(self, id)
    local obj = {
        id = id,
        taskList = {},
        keepTaskList = true,
        startTimeMillis = -1,
        running = false,
        currentTaskName = nil,
        lastTaskInfo = {},
        taskCount = 0,
        totalTimeMillis = 0
    }
    return setmetatable(obj, mt)
end

function setKeepTaskList(self, keepTaskList)
    self.keepTaskList = keepTaskList;
end

function start(self, taskName)
    if self.running then
        error("Can't start StopWatch: it's already running")
    end
    self.startTimeMillis = time.get_time_ms()
    self.running = true
    self.currentTaskName = taskName
end

function stop(self)
    if not (self.running) then
        error("Can't start StopWatch: it's already running")
    end
    self.taskCount = self.taskCount + 1
    local lastTime = time.get_time_ms() - self.startTimeMillis
    self.totalTimeMillis = self.totalTimeMillis + lastTime
    self.taskInfo = {
        taskName = self.currentTaskName,
        timeMillis = lastTime
    }
    if self.keepTaskList then
        self.taskList[self.taskCount] = self.taskInfo
    end
    self.running = false
    self.currentTaskName = nil
end

function isRunning(self)
    return self.running
end

function getLastTaskName(self)
    if not self.lastTaskInfo then
        error("No tasks run: can't get last task name")
    end
    return self.lastTaskInfo.taskName
end

function getLastTaskInfo(self)
    if not self.lastTaskInfo then
        error("o tasks run: can't get last task info")
    end
    return self.lastTaskInfo
end

function getTotalTimeMillis(self) 
    return self.totalTimeMillis;  
end

function getTaskCount(self)
    return self.taskCount
end

function prettyPrint(self)
    local sb = "\n"
    if not self.keepTaskList then
        sb = sb .. "No task info kept"
    else 
        sb = sb .. "-----------------------------------------\n"
        sb = sb .. "ms     %     Task name\n"
        sb = sb .. "-----------------------------------------\n"
        for i,v in ipairs(self.taskList) do
            sb = sb .. string.format("%3d", v.timeMillis) .. "  " .. 
                string.format("%3d", math.ceil(v.timeMillis / self.totalTimeMillis * 100)) 
                .. "%" .. "  " .. v.taskName .. "\n"
        end
    end
    return sb
end


-- to prevent use of casual module global variables
getmetatable(util.stopwatch).__newindex = function (table, key, val)
    error('attempt to write to undeclared variable "' .. key .. '": '
            .. debug.traceback())
end