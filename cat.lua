local tArgs = { ... }
if #tArgs ~= 1 then
    return
end
local file = fs.open( tArgs[1], "r" )
write(file.readAll())