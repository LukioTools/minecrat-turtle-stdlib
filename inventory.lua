-- Make the turtle select slot slotNum (1 is top left, 16 (9 in 1.33 and earlier) is bottom right) 
function SelectSlot(pos)
    local status = false
    status = turtle.select(pos)
    return status 
end

-- Indicates the currently selected inventory slot 
function GetSelectedSlot()
    local slot = 0
    slot = turtle.GetSelectedSlot()
    return slot
end

-- Counts how many items are in the currently selected slot or, if specified, slotNum slot w
function GetItemCount(pos)
    local amount = 0
    if pos ~= nil then
        amount = turtle.getItemCount(pos)
    else
        amount = turtle.getSelectedSlot()
    end
    return amount
end

-- Counts how many remaining items you need to fill the stack in the currently selected slot or, if specified, slotNum slot 
function GetItemSpace(pos)
    local amount = 0
    if pos ~= nil then
        amount = turtle.getItemSpace(pos)
    else
        amount = turtle.getItemSpace()
    end
    return amount
end

-- Returns the ID string, count and damage values of currently selected slot or, if specified, slotNum slot 
function GetItemDetail(pos)
    local detail = {name="minecraft:air", damage=0, count=1}
    if pos ~= nil then
        local temp = turtle.getItemDetail(pos)
        if temp then
            detail.name = temp.name
            detail.damage = temp.damage
            detail.count = temp.count
            return detail
        end
    else
        local temp = turtle.getItemDetail()
        if temp then
            detail.name = temp.name
            detail.damage = temp.damage
            detail.count = temp.count
            return detail
        end
    end
    return detail
end