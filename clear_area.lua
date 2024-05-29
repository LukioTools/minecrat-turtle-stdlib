require "stdlib"


Targ = {...}

local sizeX = tonumber(Targ[1])
local sizeY = tonumber(Targ[2])
local sizeZ = tonumber(Targ[3])

print(Targ[1], Targ[2], Targ[3])
print(sizeX, sizeY, sizeZ)

local x = 0
local y = 0
local z = 0

while sizeY > Position()[2] do
    while sizeX > Position()[1] do
        while sizeZ > Position()[3] do
            if Inspect() then
                print("digging")
                Dig("left")
                Forward(1)
            end
        end    
        pos = Position()
        moveTo({pos[1],pos[2], 0})
        sleep(0.5)
        moveTo({pos[1],pos[2], pos[3]+1})
    end
end


