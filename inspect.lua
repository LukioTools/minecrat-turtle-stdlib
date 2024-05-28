function Inspect()
    local tp = turtle.inspect()
    local temp = {false, {metadata = 0, name = "", state = {}}}
    print(temp[1])
    if tp[1] then
        temp[1] = true;
        temp[2].metadata = tp.metadata
        temp[3].name = tp.name
        temp[4].state = tp.state     
    else
        temp[2].metadata = 0
        temp[3].name = "minecraft:air"
        temp[4].state = {}
    end
    return temp
end

function Inspect()
    local tp = turtle.inspectUp()
    local temp = {false, {metadata = 0, name = "", state = {}}}
    if tp[1] then
        temp[1] = true;
        temp[2].metadata = tp.metadata
        temp[3].name = tp.name
        temp[4].state = tp.state     
    else
        temp[2].metadata = 0
        temp[3].name = "minecraft:air"
        temp[4].state = {}
    end
    return temp
end

function Inspect()
    local tp = turtle.inspectDown()
    local temp = {false, {metadata = 0, name = "", state = {}}}
    if tp[1] then
        temp[1] = true;
        temp[2].metadata = tp.metadata
        temp[3].name = tp.name
        temp[4].state = tp.state     
    else
        temp[2].metadata = 0
        temp[3].name = "minecraft:air"
        temp[4].state = {}
    end
    return temp
end