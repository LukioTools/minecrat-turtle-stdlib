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
        Rotate(2) --rotate around to go back and fourth
        y=y+1;
    end
    
    Downward(size.y)
    if y%2 == 1 then
        SetRotation(3)
        Forward(size.z)
    end
    SetRotation(4)
    Dig()       --clear block in case
    Forward(1)
    Rotate(1)   -- goto rotation 1
    x=x+1;
end


