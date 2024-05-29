local tArgs = { ... }
if #tArgs ~= 1 then
    print("Usage: <filename>")
    return
end

local function ReadLines(filename)
    local lines = {}
    local file = fs.open(filename, "r");
    if not file then
        return
    end
    while true do
        local line = file.readLine()
        if not line then
            break
        end
        lines[#lines+1] = line
    end
    return lines;
end


local asLines = ReadLines(tArgs[1]);
local iScrollIndex = 0;
local iXOffsetIndex = 0;
local iX, iY = term.getSize();
iY = iY -1;
local function display()
    term.clear();
    if not asLines then
        return -1
    end
    local iPos = 0;
    while iPos < iY do
        local line = asLines[1+iPos+iScrollIndex];
        if not line then return end
        local ln = ""
        if iXOffsetIndex > 0 then ln = "<" end
        if #line > iX+iXOffsetIndex then
            ln = ln..string.sub(line, 1+iXOffsetIndex, iX+iXOffsetIndex-2)..">\n"
        else
            ln = ln..string.sub(line, 1+iXOffsetIndex, iX+iXOffsetIndex-2).."\n";
        end

        write(ln);
        --if iXOffsetIndex == 0 then
        --    write(string.sub(line, 1, iX)..'\n');
        --else
        --    write("<"..string.sub(line, 1+iXOffsetIndex, iX+iXOffsetIndex-1)..'\n');
        --end

        iPos = iPos+1
    end
end


display();

while true do
    local kt, key, key_hold = os.pullEvent();
    if key == '§' or key == 'q' then
        break
    end
    --up
    if key == 200 and iScrollIndex > 0 then
        iScrollIndex = iScrollIndex -1;
    --down
    elseif key == 208 and iScrollIndex+iY < #asLines then
        iScrollIndex = iScrollIndex +1;

    
    --left
    elseif key == 203 and iXOffsetIndex > 0 then
        iXOffsetIndex = iXOffsetIndex -1;
    --right
    elseif key == 205 then
        iXOffsetIndex = iXOffsetIndex +1;
    end
    display();
end


