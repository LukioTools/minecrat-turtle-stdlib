local function Forward(l)
end

local function Backward(l)
end

local function Upward(l)
end

local function Downward(l)
end

local function Rotate(l)
end

local function SetRotation(l)
    
end

local function rotateToDirection(cr,fr)
    local rotationAmount =  f_ry - c_ry
    if rotationAmount > 0 then
        for i = 1, rotationAmount, 1 do
            turtle.turnRight(i) 
        end
    elseif rotationAmount <0 then 
        for i = 1, rotationAmount, 1 do
            turtle.turnLeft(i) 
        end
    end
end

-- y = korkeus, z = eteenpäin, x = sivulle

-- 1 forward
-- 2 right
-- 3 backward
-- 4 left

-- global positions
--current rotation, current pos (x,y,z), future position (x,y,z)
function moveTo(d, c_x,c_y,c_z, f_x, f_y, f_z)
    local rel_x = f_x-c_x
    local rel_z = f_z-c_z
    local rel_y = f_y-c_y
    
    -- forward
    if d == 1 then
        Forward(rel_z)
        Upward(rel_y)
        SetRotation(2)
        Forward(rel_x)        

    -- right
    elseif d == 2 then
        Forward(rel_x)
        Upward(rel_y)
        SetRotation(1)
        Forward(rel_z)

    -- backward
    elseif d == 3 then
        Forward(-rel_z)
        Upward(rel_y)
        SetRotation(2)
        Forward(rel_x)

    --left
    elseif d == 4 then
        Forward(-rel_x)
        Upward(rel_y)
        SetRotation(1)
        Forward(rel_z)
    end

end


