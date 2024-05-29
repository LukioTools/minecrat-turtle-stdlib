require "https"
local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <filename>")
    return
end

if string.find(asArgv[1], '.') then
    asArgv[1] = asArgv[1]..'.lua';
end
WriteTo(asArgv[1], GetHTTP("http://0.0.0.0/"..asArgv[1]));
