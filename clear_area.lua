require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

for i = 0, sizeY, 1 do     
    for j = 0, sizeX, 1 do
        moveTo({i,j,0})
        SetRotation(1)
        for k = 0, sizeZ, 1 do
            Dig("left")
            Forward(1)
            AutoRefuel(16, 1)
        end
        moveTo({i,j,0})
        
    end
end

