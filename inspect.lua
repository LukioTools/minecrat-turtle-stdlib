function Inspect()
    local i, d = turtle.inspect()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = tp.metadata
        Data.name = tp.name
        Data.state = tp.state     
    end
    return temp
end

function InspectUp()
    local i, d = turtle.inspectUp()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = tp.metadata
        Data.name = tp.name
        Data.state = tp.state     
    end
    return temp
end

function InspectDown()
    local i, d = turtle.inspectDown()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = tp.metadata
        Data.name = tp.name
        Data.state = tp.state     
    end
    return temp
end
