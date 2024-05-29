local x = 0;
local y = 0;
local z = 0;


-- 1 - 4
local dir = 1;

function DirectionName(d)
    if(d == nil)then
        d = dir;
    end
    -- forward
    if d == 1 then
        return "Forward"
    -- right
    elseif d == 2 then
        return "Right"
    -- backward
    elseif d == 3 then
        return "Backward"
    --left
    elseif d == 4 then
        return "Left"
    end

    return "Unknown"
end

--nill safe and 0 doesnt move

function Forward(n)
    if n == nil then n = 1; end
    if n == 0 then return 0; end
    if n < 0 then return Backward(-n); end
    local to_move = n;


    while n ~= 0 do
        local b = turtle.forward();

        if b == false then
            return to_move - n;
        end;

        -- forward
        if dir == 1 then
            z = z + 1;
        -- backward
        elseif dir == 3 then
            z = z - 1;
        -- right
        elseif dir == 2 then
            x = x + 1;
        --left
        elseif dir == 4 then
            x = x - 1;
        end

        n = n-1;
    end

    return 0;
end

function Backward(n)
    if n == nil then n = 1; end
    if n == 0 then return 0; end
    if n < 0 then return Forward(-n); end
    local to_move = n;


    while n ~= 0 do
        local b = turtle.back();

        if b == false then
            return to_move - n;
        end;

        -- forward
        if dir == 1 then
            z = z - 1;
        -- backward
        elseif dir == 3 then
            z = z + 1;
        -- right
        elseif dir == 2 then
            x = x - 1;
        --left
        elseif dir == 4 then
            x = x + 1;
        end

        n = n-1;
    end

    return 0;
end

function Upward(n)
    if n == nil then n = 1; end
    if n == 0 then return 0; end
    if n < 0 then return Downward(-n); end

    local to_move = n;

    while n ~= 0 do
        local b = turtle.up();
        if b==false then
            return to_move - n;
        end
        y = y + 1;
        n = n-1;
    end
    return 0;
end

function Downward(n)
    if n == nil then n = 1; end
    if n == 0 then return 0; end
    if n < 0 then return Upward(-n); end

    local to_move = n;

    while n ~= 0 do
        if turtle.down()==false then
            return to_move - n;
        end
        y = y -1;

        n = n-1;
    end

    return 0;
end

function Rotate(n)
    if n == nil or n==0 then return 0 end
    local to_move = n;

    if n > 0 then
        while n ~= 0 do
            if turtle.turnRight() == false then
                return to_move-n;
            end
            dir = dir+1;
            if dir > 4 then
                dir = 1;
            end
            n=n-1;
        end
    else
        while n~=0 do
            if turtle.turnLeft() == false then
                return n-to_move;
            end
            dir = dir-1;
            if dir < 1 then
                dir = 4;
            end
            n=n+1;
        end
    end

end
local function abs(n)
    if n < 0 then
        return -n;
    end
    return n;
end

function GetRotation()
    return dir;
end
function GetDirection()
    return dir;
end

function SetRotation(d)
    if d == nil then d = 1; end
    if d < 1 or d > 4 then return 0 end
    if d == dir then return 0 end;

    a = dir - 1
    b = d - 1

    -- Calculate the clockwise distance
    local clockwise = (b - a) % 4

    -- Calculate the counterclockwise distance
    local counterclockwise = (a - b) % 4

    if clockwise <= counterclockwise then
        Rotate(clockwise)
    else
        Rotate(-counterclockwise)
    end
    
end

function SetOrigo()
    x = 0;
    y = 0;
    z = 0;
    dir = 1;
end

function Position()
    return {x,y,z}
end

function PositionXYZ()
    return {x=x,y=y,z=z}
end


