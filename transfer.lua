-- Transfers quantity items from the selected slot to slot. If quantity isn't specified, will attempt to transfer everything in the selected slot to slot. 
function TransferTo(slot, quantity)
    if quantity then
        turtle.transferTo(slot, quantity)
    else
        turtle.transferTo(slot)
    end
    
end

function TransferAll(slots)
    for i = 1, slots, 1 do
        SelectSlot(i)
        Drop()
    end
end