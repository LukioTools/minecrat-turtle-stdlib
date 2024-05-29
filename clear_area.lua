require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

if GetItemDetail(GetSelectedSlot()).name == "minecraft:diamond_pickaxe" then
    EquipRight()
end
EquipRight()

for i = 1, sizeY, 3 do     
    for j = 0, sizeX, 1 do
        moveTo({j,i,0})
        SetRotation(1)
        for k = 0, sizeZ, 1 do
            Dig("right") 
            DigUp("right")
            DigDown("right")
            Forward(1)
        end
        moveTo({j,i,0})
        while GetFuelLevel() < 10 do
            AutoRefuel(16, 10)
        end
    end
end