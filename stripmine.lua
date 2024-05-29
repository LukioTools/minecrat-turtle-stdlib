require "moveTo"
require "inventory"
require "dig"

local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <max-lenght>")
    return
end

local iMaxLenght = tonumber(asArgv[1])


while PositionXYZ().z < iMaxLenght do
    Dig()
    Forward(1)
    DigUp()
end




