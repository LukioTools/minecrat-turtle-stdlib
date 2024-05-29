require "inventory"

-- Detects if the block in front is the same as the selected or if left out, one in the currently selected slot 
function Compare(slot)
    local result = false
    if slot then
        SelectSlot(slot)
        result = turtle.compare()
        return result
    else
        result = turtle.compare()
        return result
    end 
end

-- Detects if the block above is the same as the selected or if left out, one in the currently selected slot 
function CompareUp(slot)
    local result = false
    if slot then
        SelectSlot(slot)
        result = turtle.compareUp()
        return result
    else
        result = turtle.compareUp()
        return result
    end 
end


-- Detects if the block bellow is the same as the selected or if left out, one in the currently selected slot 
function CompareDown(slot)
    local result = false
    if slot then
        SelectSlot(slot)
        result = turtle.compareDown()
        return result
    else
        result = turtle.compareDown()
        return result
    end 
end

function CompareTo(slot, current)
    if current then
        
    end
end

CompareDown()