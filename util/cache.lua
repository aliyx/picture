local VERSION = '0.01'

function path_label(dir, lab, tfsname, fmt, q, w, h, r, gv, gv_x, gv_y) 
    local _src = string.format("/%s/%s/%s/%s%s", 
        dir, lab, gv, tfsname, toGv(gv_x, gv_y))
    local _size, _q, _fmt = toSize(w, h, r), toQ(q), toFmt(fmt)
    local _dest = string.format("%s%s%s%s", _src, _size, _q, _fmt)
    return _dest, _src, _size, _q, _fmt
end

function path_comp(dir, cn, bn, fmt, q, w, h, r, gv, gv_x, gv_y) 
    local _src = string.format("/%s/%s/%s,%s%s", 
        dir, gv, cn, bn, toGv(gv_x, gv_y))
    local _size, _q, _fmt = toSize(w, h, r), toQ(q), toFmt(fmt)
    local _dest = string.format("%s%s%s%s", _src, _size, _q, _fmt)
    return _dest, _src, _size, _q, _fmt
end

function path_zoom(dir, tfsname, fmt, q, w, h, r)
    local _size = toSize(w, h, r)
    if _size == '' then
        return nil
    end
    local _src = string.format("/%s/%s%s", dir, tfsname, _size)
    local _q, _fmt = toQ(q), toFmt(fmt)
    local _dest = string.format("%s%s%s", _src, _q, _fmt)
    return _dest, _src, _q, _fmt
end

function path_src(dir, f)
    return string.format('/%s/%s', dir, f)
end

function path_src2(dir, f, fmt)
    local _fmt = toFmt(fmt)
    local _dest = string.format("/%s/%s%s", dir, f, _fmt)
    return _dest
end

function isNil(s)
    return s == nil or s == ""
end

function toFmt(fmt) 
    if not(isNil(fmt)) then
        return "_." .. fmt
    else
        return ""
    end
end

function toQ(q) 
    if not(isNil(q)) then
        return "_q" .. q
    else
        return ""
    end
end

function toSize(w, h, r) 
    if isNil(w) then
        w = ""
    end
    if isNil(h) then
        h = ""
    end
    if isNil(r) then
        r = ""
    end
    local str = string.format("_%sx%s%s", w, h, r)
    if str == "_x" then
        return ""
    else
        return str;
    end
end

function toGv(x, y) 
     if isNil(x) then
        x = ""
    end
    if isNil(y) then
        y = ""
    end
    local str = string.format("_x%sy%s", x, y)
    if str == "_xy" then
        return ""
    else
        return str;
    end 
end

function file_exists(path)
    local file = io.open(path, "r")
    if file then 
        file:close() 
    end
    return file ~= nil
end

function make_trace() 
    local flags = {}
    local trace = function (k, v)
        if v == nil then
            return flags[k]
        else
            flags[k] = v
        end
    end
    return trace
end

function splitpath(p)
    return string.match(p,"^(.-)[\\/]?([^\\/]*)$")
end
function make_dir(p)
    local d, f = splitpath(p)
    if not file_exists(d) then
        os.execute('mkdir -p ' .. d)
    end
end

local self = {
    path_label = path_label,
    make_trace = make_trace,
    make_dir = make_dir,
    isNil = isNil,
    path_src = path_src,
    path_src2 = path_src2,
    path_comp = path_comp,
    path_zoom = path_zoom,
    VERSION = VERSION 
}

return setmetatable({}, { __index = self})