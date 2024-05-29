function GetRefuelLevel()
    local result = 0
    result = turtle.getFuelLevel()
    return result
end

function GetFuelLimit()
    local result = 0
    result = turtle.getFuelLimit()
    return result
end

function Refuel()
    local result = false
    result = turtle.refuel()
    return result
end

-- How many items it consumes,amount of slots
function AutoRefuel(slots, fuelAmount)
    local success = false
    if fuelAmount then
        for i = 1, slots, 1 do
            local wasAble = turtle.refuel(fuelAmount)
            if wasAble then
                success = true
                break
            end
        end
    else
        for i = 1, slots, 1 do
            local wasAble = turtle.refuel()
            if wasAble then
                success = true
                break
            end
        end
    end
    return success

end