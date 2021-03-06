local VERSION = "0.0.1"
local ffi = require("ffi")
local lib
do
  local _m = require("magick.wand.lib")
  lib = _m.lib
end

local parse_geometry
parse_geometry = function(g, _w, _h, _x, _y)
    local is_g = lib.IsGeometry(g)
    if (is_g ~= 1) then
        return nil, "invalid geometry"
    end
    if not (_x) then
        _x = 0
    end
    if not (_y) then
        _y = 0
    end
    local x, y, w, h = ffi.new("ssize_t[1]", _x), ffi.new("ssize_t[1]", _y),
        ffi.new("size_t[1]", _w),ffi.new("size_t[1]", _h)

    lib.ParseMetaGeometry(g, x, y, w, h)

    return tonumber(w[0]), tonumber(h[0]), tonumber(x[0]), tonumber(y[0])
end

return {
    parse_geometry = parse_geometry,
    VERSION = VERSION
}