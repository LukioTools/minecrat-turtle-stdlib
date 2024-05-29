local tArgs = { ... }
if #tArgs ~= 1 then
    print("Usage: <filename>")
    return
end
local file = fs.open( tArgs[1], "r" )
write(file.readAll())