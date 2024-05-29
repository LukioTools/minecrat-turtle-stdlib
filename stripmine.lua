require "moveTo"
require "inventory"
require "dig"
require "suck"

local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <max-lenght>")
    return
end

local iMaxLenght = tonumber(asArgv[1])


while PositionXYZ().z < iMaxLenght do
    while Dig() do end
    Forward(1)
    while DigUp() do end
end




