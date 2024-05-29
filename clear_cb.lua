require "move"
require "dig"

local tArgs = { ... }
if #tArgs ~= 3 then
    print("Usage: <width> <height> <depth>")
    return
end

local size = {
    x=tonumber(tArgs[1]),
    y=tonumber(tArgs[2]),
    z=tonumber(tArgs[3]),
}

local x = 0;
while x < size.x do
    local y = 0;
    while y < size.y do
        local z = 0;
        while z<size.z do
            Dig()
            Forward(1)
            z=z+1;
        end
        DigUp()
        Upward(1)
        Rotate(2)
        y=y+1;
    end
    SetRotation(3)
    Downward(size.y)
    Forward(size.z)
    Rotate(1)
    Dig()
    Forward(1)
    Rotate(1)
    x=x+1;
end


