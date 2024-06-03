require "stdlib"
Hand = "right"

function EmptyInventoryToChest()
    local currentPos = Position()
    local currentRotation = Direction()
    moveTo()
    SetRotation(3)
    TransferAll(16, true)
    moveTo(currentPos)
    SetRotation(currentRotation)
end

function DigAndMove(hand)
    while not Forward(1) do
        print("mining until is able to go forward")
        Dig(hand)
    end 
end

Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2]) -- Not used
local sizeZ = tonumber(Targ[3])

while GetFuelLevel() < 10 do
    print("trying to fuel up until fuel is present")
    AutoRefuel(16, 10)
end

for i = 1, sizeX, 1 do
    for i = 1, sizeZ, 1 do
        DigUp(Hand) 
        DigDown(Hand)
        DigAndMove(hand)
    end 

    SetRotation(2)
    DigAndMove((Hand))
    SetRotation(3)

    for i = 1, sizeZ, 1 do
        DigUp(Hand) 
        DigDown(Hand)
        DigAndMove(hand)
    end 

    if IsFullInventory(16) then
        print("Returning to home to unload shit")
        EmptyInventoryToChest()
    end

    SetRotation(2)
    DigUp(Hand) 
    DigDown(Hand)
    DigAndMove(hand)
    SetRotation(1)
    

    
end