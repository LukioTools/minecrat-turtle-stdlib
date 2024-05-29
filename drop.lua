-- Drops all items in the selected slot, or specified, drops count items.
function Drop(amount)
    local success = false
    if amount then
        success = turtle.drop(amount)
    else
        success = turtle.drop()
    end
end

-- Drops all items in the selected slot, or specified, drops count items.
function DropUp(amount)
    local success = false
    if amount then
        success = turtle.dropUp(amount)
    else
        success = turtle.dropUp()
    end
end

-- Drops all items in the selected slot, or specified, drops count items.
function DropDown(amount)
    local success = false
    if amount then
        success = turtle.dropDown(amount)
    else
        success = turtle.dropDown()
    end
end
