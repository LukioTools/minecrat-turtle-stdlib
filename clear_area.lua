require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

for i = 1, sizeY, 1 do     
    for i = 1, sizeX, 1 do
        for i = 1, sizeZ, 1 do
            Forward(1)
            Dig("right")
            AutoRefuel(16, 1)
        end
    end
end

