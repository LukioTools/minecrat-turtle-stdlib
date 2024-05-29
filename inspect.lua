-- Returns the ID string and metadata of the block in front of the Turtle 
function Inspect()
    local i, d = turtle.inspect()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = d.metadata
        Data.name = d.name
        Data.state = d.state     
    end
    return isInspectable, Data
end

-- Returns the ID string and metadata of the block above the Turtle
function InspectUp()
    local i, d = turtle.inspectUp()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = d.metadata
        Data.name = d.name
        Data.state = d.state     
    end
    return isInspectable, Data
end

-- Returns the ID string and metadata of the block below the Turtle 
function InspectDown()
    local i, d = turtle.inspectDown()
    local isInspectable = false
    local Data = {metadata = 0, name = "minecraft:air", state = {}}
    
    if i == true then
        isInspectable = true;
        Data.metadata = d.metadata
        Data.name = d.name
        Data.state = d.state     
    end
    return isInspectable, Data
end
