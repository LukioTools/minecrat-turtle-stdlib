function Inspect()
    local tp = turtle.inspect()
    print(tp)
    local temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end

function InspectUp()
    local tp = turtle.inspectUp()
    local temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end

function InspectDown()
    local tp = turtle.inspectDown()
    local temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end