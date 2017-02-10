local _mimitypes = {
  html = "text/html",
  htm = "text/html",
  shtml = "text/html",
  css = "text/css",
  xml = "text/xml",
  gif = "image/gif",
  jpeg = "image/jpeg",
  jpg = "image/jpeg",
  js = "application/javascript",
  atom = "application/atom+xml",
  rss = "application/rss+xml",

  mml = "text/mathml",
  txt = "text/plain",
  jad = "text/vnd.sun.j2me.app-descriptor",
  wml = "text/vnd.wap.wml",
  htc = "text/x-component",

  woff = "application/font-woff",
  jar = "application/java-archive",
  war = "application/java-archive",
  ear = "application/java-archive",
  json = "application/json",
  hqx = "application/mac-binhex40",
  doc = "application/msword",
  pdf = "application/pdf",
  ps = "application/postscript",
  eps = "application/postscript",
  ai = "application/postscript",
  rtf = "application/rtf",
  m3u8 = "application/vnd.apple.mpegurl",
  xls = "application/vnd.ms-excel",
  eot = "application/vnd.ms-fontobject",
  ppt = "application/vnd.ms-powerpoint",
  wmlc = "application/vnd.wap.wmlc",
  kml = "application/vnd.google-earth.kml+xml",
  kmz = "application/vnd.google-earth.kmz",
  ["7z"] = "application/x-7z-compressed",
  cco = "application/x-cocoa",
  jardiff = "application/x-java-archive-diff",
  jnlp = "application/x-java-jnlp-file",
  run = "application/x-makeself",
  pl = "application/x-perl",
  pm = "application/x-perl",
  prc = "application/x-pilot",
  pdb = "application/x-pilot",
  rar = "application/x-rar-compressed",
  rpm = "application/x-redhat-package-manager",
  sea = "application/x-sea",
  swf = "application/x-shockwave-flash",
  sit = "application/x-stuffit",
  tcl = "application/x-tcl",
  tk = "application/x-tcl",
  der = "application/x-x509-ca-cert",
  pem = "application/x-x509-ca-cert",
  crt = "application/x-x509-ca-cert",
  xpi = "application/x-xpinstall",
  xhtml = "application/xhtml+xml",
  xspf = "application/xspf+xml",
  zip = "application/zip",
  gz = "application/x-gzip",
  wgz = "application/x-nokia-widget",
  apk = "application/vnd.android.package-archive",

  bin = "application/octet-stream",
  exe = "application/octet-stream",
  dll = "application/octet-stream",
  deb = "application/octet-stream",
  dmg = "application/octet-stream",
  iso = "application/octet-stream",
  img = "application/octet-stream",
  msi = "application/octet-stream",
  msp = "application/octet-stream",
  msm = "application/octet-stream",

  docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation",

  mid = "audio/midi",
  midi = "audio/midi",
  kar = "audio/midi",
  mp3 = "audio/mpeg",
  ogg = "audio/ogg",
  m4a = "audio/x-m4a",
  ra = "audio/x-realaudio",

  ["3gpp"] = "video/3gpp",
  ["3gp"] = "video/3gpp",
  ts = "video/mp2t",
  mp4 = "video/mp4",
  mpeg = "video/mpeg",
  mpg = "video/mpeg",
  mov = "video/quicktime",
  webm = "video/webm",
  flv = "video/x-flv",
  m4v = "video/x-m4v",
  mng = "video/x-mng",
  asx = "video/x-ms-asf",
  asf = "video/x-ms-asf",
  wmv = "video/x-ms-wmv",
  avi = "video/x-msvideo"
}

local _file_ext = {
  ["FFD8FF"] = "jpg",
  ["89504E47"] = "png",
  ["47494638"] = "gif",
  ["49492A00"] = "tif",
  ["424DC001"] = "bmp",
  ["41433130"] = "dwg",
  ["38425053"] = "psd",
  ["7B5C727466"] = "rtf",
  ["3C3F786D6C"] = "xml",
  ["68746D6C3E"] = "html",
  ["44656C6976657279"] = "eml",
  ["CFAD12FEC5FD746F"] = "dbx",
  ["2142444E"] = "pst",
  ["D0CF11E0"] = "xls",
  ["D0CF11E0"] = "doc",
  ["5374616E64617264"] = "mdb",
  ["FF575043"] = "wpd",
  ["25504446"] = "pdf",
  ["AC9EBD8F"] = "qdf",
  ["E3828596"] = "pwl",
  ["504B0304"] = "zip",
  ["526172211A07"] = "rar",
  ["57415645"] = "wav",
  ["41564920"] = "avi",
  ["2E7261FD"] = "ram",
  ["2E524D46"] = "rm",
  ["000001BA"] = "mpg",
  ["000001B3"] = "mpg",
  ["6D6F6F76"] = "mov",
  ["3026B2758E66CF11"] = "asf",
  ["4D546864"] = "mid",
  ["1F8B"] = "gz",
  ["464F524D"] = "txt",
  ["4D5A"] = "exe",
  ["377ABCAF271C"] = "7z"
}

local _backup = {
  ["FFD8FF"] = "jpg",
  ["89504E47"] = "png",
  ["47494638"] = "gif",
  ["49492A00"] = "tif",
  ["424DC001"] = "bmp",
  ["41433130"] = "dwg",
  ["38425053"] = "psd",
  ["7B5C727466"] = "rtf",
  ["3C3F786D6C"] = "xml",
  ["68746D6C3E"] = "html",
  ["44656C6976657279"] = "eml",
  ["CFAD12FEC5FD746F"] = "dbx",
  ["2142444E"] = "pst",
  ["D0CF11E0"] = "xls",
  ["D0CF11E0"] = "doc",
  ["5374616E64617264"] = "mdb",
  ["FF575043"] = "wpd",
  ["25504446"] = "pdf",
  ["AC9EBD8F"] = "qdf",
  ["E3828596"] = "pwl",
  ["504B0304"] = "zip",
  ["526172211A07"] = "rar",
  ["57415645"] = "wav",
  ["41564920"] = "avi",
  ["2E7261FD"] = "ram",
  ["2E524D46"] = "rm",
  ["000001BA"] = "mpg",
  ["000001B3"] = "mpg",
  ["6D6F6F76"] = "mov",
  ["3026B2758E66CF11"] = "asf",
  ["4D546864"] = "mid",
  ["1F8B"] = "gz",
  ["464F524D"] = "txt",
  ["4D5A"] = "exe",
  ["377ABCAF271C"] = "7z"
}

function get_type(fn, h)
  if fn == nil or fn == "" then
    return ""
  end
  local ext = fn:match(".+%.(%w+)$")
  if ext == nil then
    ext = get_ext(h)
  end
  if ext == nil then
    return ""
  end
  local type = _mimitypes[ext]
  if type == nil then
    type = ""
  end
  return type
end

function get_ext(h)
  if h == nil or string.len(h) ~= 8 then
    return nil, "header length is less than 8"
  end
  local hexs = string.gsub(h, "(.)", function (x) return string.format("%02X", string.byte(x)) end)
  for i=4,16,2 do
    local t = _file_ext[hexs:sub(1, i)]
    if t ~= nil then
      return t
    end
  end
end

return {
  get_type = get_type
}

