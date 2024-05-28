require "move"

-- y = korkeus, z = eteenpäin, x = sivulle

-- 1 forward
-- 2 right
-- 3 backward
-- 4 left

-- global positions
--current rotation, current pos (x,y,z), future position (x,y,z)

function moveTo(fpos, pos, d)
    if pos == nil then
        pos = Position()
    end
    if d == nil then
        d = GetDirection()
    end

    if fpos == nil then
        fpos = {0,0,0}
        d = 1
    end

    print(fpos[1],fpos[2], fpos[3])
    print(pos[1],pos[2],pos[3])
    print(d)
    local rel_x = fpos[1]-pos[1]
    local rel_y = fpos[2]-pos[2]
    local rel_z = fpos[3]-pos[3]
    
    
    -- forward
    if d == 1 then
        print("forward")
        Forward(rel_z)
        Upward(rel_y)
        if rel_x ~= 0 then
            SetRotation(2)
            Forward(rel_x)     
        end
      

    -- right
    elseif d == 2 then
        print("right")
        Forward(rel_x)
        Upward(rel_y)
        if rel_z ~= 0 then
            SetRotation(1)
            Forward(rel_z)  
        end


    -- backward
    elseif d == 3 then
        print("backward")
        Forward(-rel_z)
        Upward(rel_y)
        if rel_x ~= 0 then
            SetRotation(2)
            Forward(rel_x)
        end
    --left
    elseif d == 4 then
        print("left")
        Forward(-rel_x)
        Upward(rel_y)
        if rel_z ~= 0 then
            SetRotation(1)
            Forward(rel_z)
        end
    end

end