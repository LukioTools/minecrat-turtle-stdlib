require "stdlib"

local sizeX = arg[2]
local sizeY = arg[3]
local sizeZ = arg[4]

EquipRight()

while sizeY < Position()[2] do
    while sizeX < Position()[1] do
        while sizeZ < Position()[3] do
            if Inspect() then
                Dig("right")
                Forward(1)
            end
        end    
    end
end


