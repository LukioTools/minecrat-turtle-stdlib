-- Make the turtle select slot slotNum (1 is top left, 16 (9 in 1.33 and earlier) is bottom right) 
function SelectSlot(pos)
    status = false
    status = turtle.select(pos)
    return status 
end

-- Indicates the currently selected inventory slot 
function GetSelectedSlot()
    slot = 0
    slot = turtle.GetSelectedSlot()
    return slot
end

-- Counts how many items are in the currently selected slot or, if specified, slotNum slot w
function GetItemCount(pos)
    amount = 0
    if pos ~= nil then
        amount = turtle.getItemCount(pos)
    else
        amount = turtle.getSelectedSlot()
    end
    return amount
end

-- Counts how many remaining items you need to fill the stack in the currently selected slot or, if specified, slotNum slot 
function GetItemSpace(pos)
    amount = 0
    if pos ~= nil then
        amount = turtle.getItemSpace(pos)
    else
        amount = turtle.getItemSpace()
    end
    return amount
end

-- Returns the ID string, count and damage values of currently selected slot or, if specified, slotNum slot 
function GetItemDetail(pos)
    amount = 0
    if pos ~= nil then
        amount = turtle.getItemDetail(pos)
    else
        amount = turtle.getItemDetail()
    end
    return amount
end