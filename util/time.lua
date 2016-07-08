local VERSION = '0.01'

local ffi = require("ffi")
ffi.cdef[[
    struct timeval {
        long int tv_sec;
        long int tv_usec;
    };
    int gettimeofday(struct timeval *tv, void *tz);
]];

local tm = ffi.new("struct timeval");
function get_time_us()   
    ffi.C.gettimeofday(tm, nil);
    local sec = tonumber(tm.tv_sec);
    local usec = tonumber(tm.tv_usec);
    return sec * 10^6 + usec;
end

function get_time_ms()
    local us = get_time_us()
    local mod = us % 1000;
    if mod >= 500 then
        return math.ceil(us / 1000)
    else 
        return math.floor(us / 1000)
    end
end

local self = {
    get_time_ms = get_time_ms,
    get_time_ms = get_time_ms,
    VERSION = VERSION 
}

return setmetatable({}, { __index = self})
