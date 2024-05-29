require "stdlib"


Targ = {...}

local sizeX = Targ[1]
local sizeY = Targ[2]
local sizeZ = Targ[3]

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


