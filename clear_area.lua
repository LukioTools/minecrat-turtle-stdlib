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

Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

if GetItemDetail(GetSelectedSlot()).name == "minecraft:diamond_pickaxe" then
    EquipRight()
end

for i = 1, sizeY, 3 do     
    for j = 0, sizeX, 1 do
        print(Position()[1], Position()[2], Position()[3])
        moveTo({j,i,0})
        print(Position()[1], Position()[2], Position()[3])
        SetRotation(2)
        Dig(hand)
        SetRotation(1)
        for k = 0, sizeZ, 1 do
            Dig(Hand) 
            DigUp(Hand) 
            DigDown(Hand)
            if IsFullInventory(16) then
                print("Returning to home to unload shit")
                EmptyInventoryToChest()
            end
            while not Forward(1) do
                print("mining until is able to go forward")
                Dig(Hand)
            end
        end
        moveTo({j,i,0})
        while GetFuelLevel() < 10 do
            print("trying to fuel up until fuel is present")
            AutoRefuel(16, 10)
        end
    end
end