function inspect()
    tp = turtle.inspect()
    temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end

function inspectUp()
    tp = turtle.inspectUp()
    temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end

function inspectDown()
    tp = turtle.inspectDown()
    temp = {}
    temp.metadata = tp.metadata
    temp.name = tp.name
    temp.state = tp.state
    return temp
end