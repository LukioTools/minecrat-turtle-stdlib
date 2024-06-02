function EmptyInventoryToChest()
    local currentPos = Position()
    local currentRotation = Direction()
    moveTo()
    SetRotation(3)
    TransferAll(16, true)
    moveTo(currentPos)
    SetRotation(currentRotation)
end

Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

