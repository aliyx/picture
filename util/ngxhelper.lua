local VERSION = '0.01'

function get_client_ip(xff)
  if xff == nil or xff == '' then
    return ''
  end
  return string.match(xff, "%d+.%d+.%d+.%d+", "1")
end

local self = {
  get_client_ip = get_client_ip,
  VERSION = VERSION
}

return setmetatable({}, { __index = self})