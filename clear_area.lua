require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

for i = 1, sizeY, 3 do     
    for j = 0, sizeX, 1 do
        moveTo({j,i,0})
        SetRotation(1)
        for k = 0, sizeZ, 1 do
            Dig("left") 
            DigUp("left")
            DigDown("left")
            Forward(1)
        end
        moveTo({j,i,0})
        if GetFuelLevel() < 10 then
            AutoRefuel(16, 10)
        end
    end
end