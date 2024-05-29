local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <filename>")
    return
end

local function ReadLines(sFilename) --array<string>
    local asLines = {}
    local oFile = fs.open(sFilename, "r");
    if not oFile then return asLines end
    while true do
        local sLine = oFile.readLine()
        if not sLine then
            break
        end
        asLines[#asLines+1] = sLine
    end
    return asLines;
end


local asLines = ReadLines(asArgv[1]);
local iScrollIndex = 0;
local iXOffsetIndex = 0;
local iX, iY = term.getSize();
iY = iY;
local function display() -- nil
    term.clear();
    term.setCursorPos(1,1);
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
            ln = ln..string.sub(line, 1+iXOffsetIndex, iX+iXOffsetIndex-2)..">"
        else
            ln = ln..string.sub(line, 1+iXOffsetIndex, iX+iXOffsetIndex-2).."";
        end

        if iPos+1<iY then
            ln=ln..'\n';
        end
        write(ln);
        iPos = iPos+1
    end
end


display();

while true do
    local siKt, siKey, bKey_Hold = os.pullEvent();
        --goto doesnt work smh
    if siKt ~= "key_up" then
        if siKey == '§' or siKey == 'q' then
            break
        end
        --up
        if siKey == 200 and iScrollIndex > 0 then
            iScrollIndex = iScrollIndex -1;
        --down
        elseif siKey == 208 and iScrollIndex+iY < #asLines then
            iScrollIndex = iScrollIndex +1;
    
        
        --left
        elseif siKey == 203 and iXOffsetIndex > 0 then
            iXOffsetIndex = iXOffsetIndex -1;
        --right
        elseif siKey == 205 then
            iXOffsetIndex = iXOffsetIndex +1;
        end
        display();
    end
end

term.clear();
term.setCursorPos(1,1);

