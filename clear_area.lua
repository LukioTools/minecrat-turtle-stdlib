require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

while sizeY < Position()[2] do
    while sizeX < Position()[1] do
        while sizeZ < Position()[3] do
            if Inspect() then
                Dig("left")
                Forward(1)
            end
        end    
    end
end


