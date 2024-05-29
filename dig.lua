-- Breaks the block in front. With hoe: tills the dirt in front of it. 
function Dig(hand)
    local success = false
    success = turtle.dig(hand)
    return success
end

function DigUp(hand)
    local success = false
    success = turtle.digUp(hand)
    return success
end

function DigDown(hand)
    local success = false
    success = turtle.digDown(hand)
    return success
end