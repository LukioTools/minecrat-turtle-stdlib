-- Breaks the block in front. With hoe: tills the dirt in front of it. 
function Dig(hand)
    local success = false
    success = turtle.Dig(hand)
    return success
end

function DigUp(hand)
    local success = false
    success = turtle.DigUp(hand)
    return success
end

function DigDown(hand)
    local success = false
    success = turtle.DigDown(hand)
    return success
end