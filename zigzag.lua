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

while Position()[2] < sizeY do
    while Position()[1] < sizeX do
        while Position()[3] < sizeZ do
            
        end
    end
end