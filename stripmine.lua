require "move"
require "inventory"
require "dig"

local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <max-lenght>")
    return
end

local iMaxLenght = tonumber(asArgv[1])

while PositionXYZ().z < iMaxLenght do
    while Dig() do end
    Forward(1)
    while Dig() do end
end

