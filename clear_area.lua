require "stdlib"
Hand = "right"

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
        moveTo({j,i,0})
        Dig(Hand)
        SetRotation(1)
        for k = 0, sizeZ, 1 do
            local isFull = false
            if not Dig(Hand) then isFull = true end 
            if not DigUp(Hand) then isFull = true end
            if not DigDown(Hand) then isFull = true end
            if isFull then
                local currentPos = Position()
                local currentRotation = Direction()
                moveTo()
                SetRotation(3)
                TransferAll()
                moveTo(currentPos)
                SetRotation(currentRotation)

            end
            Forward(1)
        end
        moveTo({j,i,0})
        while GetFuelLevel() < 10 do
            AutoRefuel(16, 10)
        end
    end
end