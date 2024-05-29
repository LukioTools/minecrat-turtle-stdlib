require "keys"

local asArgv = { ... }
if #asArgv ~= 1 then
    print("Usage: <filename>")
    return
end

local function ReadLines(sFilename) --array<string>
    local asLines = {}
    local oFile = fs.open(sFilename, "r");
    if not oFile then return asLines, "Could not open file" end
    while true do
        local sLine = oFile.readLine()
        if not sLine then
            break
        end
        asLines[#asLines+1] = sLine
    end
    return asLines;
end
local function WriteLines(sFilename, asLines)
    local oFile = fs.open(sFilename, "w")
    if not oFile then return "Could not open file" end
    for index, value in ipairs(asLines) do
        if value then
            oFile.writeLine(value);
        else
            oFile.writeLine('\n');
        end
    end
    oFile.close()
end

local asLines = ReadLines(asArgv[1]);

local bRun = true;
local bRedisplay = true;
local iX, iY = term.getSize();
iY = iY;
--display offsets
local iXOffset = 0;
local iYOffset = 0;

local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

-- modes: 1 = NORMAL, 2 = COMMAND, 3 = INSERT
local eMode = 1;
local deModes = {
    NORMAL=1,
    COMMAND=2,
    INSERT=3,
}


local function DrawString(str)
    if not str then
        return write('\n')
    end
    return write(string.sub(str, 1+iXOffset, iX+iXOffset)..'\n');
end

local sCommandString = "";
local iCommandCursor = 0;
local function DrawCommand()
    term.setCursorPos(1, iY);
    term.clearLine();
    ---string.sub(sCommandString, -(iX-1))
    write(":"..string.sub(sCommandString, -(iX-1)));
    term.setCursorPos(iCommandCursor+2,iY);
    term.setCursorBlink(true)
end

local iCursorX = 0;
local iCursorY = 0;
local function DrawNormal()
    term.setCursorBlink(true)

    local i=0;
    while i < iY-1 do
        i=i+1;
        DrawString(asLines[i])
    end

    term.setCursorPos(iCursorX-iXOffset,iCursorY-iYOffset);
end

local function DrawInsert()
    term.setCursorBlink(true)

    local i=0;
    while i < iY-1 do
        i=i+1;
        DrawString(asLines[i])
    end

    term.setCursorPos(iCursorX-iXOffset,iCursorY-iYOffset);
end

local function REDISPLAY() --nil
    if not bRedisplay then
        return
    end
    --term.clear();
    --term.setCursorPos(1,1);
    
    if eMode == deModes.NORMAL then
        DrawNormal()
    elseif eMode == deModes.COMMAND then
        DrawCommand();
    end

end



local function NORMAL(ev)
    if ev.sType == "key_up" then
        return
    end
    if ev.eKey == ':' then
        eMode = deModes.COMMAND;
    elseif ev.eKey == '/' then
        --search
    elseif ev.eKey == 'i' then
        eMode = deModes.INSERT;
    end
end

local function insert(s, thing, pos)
    return string.sub(s, 1,pos)..thing..string.sub(s, pos+1)
end
local function pop(s, pos)
    return string.sub(s,1, pos-1)..string.sub(s, pos+1)
end
local function write()
end
local function quit()
    bRun = false;
end


local sdCommands = {
    w=write,
    q=quit,
    wq=function ()
        write();
        quit();
    end,
    h=function ()
    end
}
local function COMMAND(ev)
    if ev.sType == "key" then
        if ev.eKey == DEKeys.BACKSPACE and iCommandCursor > 0 then
            sCommandString = pop(sCommandString, iCommandCursor);
            iCommandCursor=iCommandCursor-1;
        elseif ev.eKey == DEKeys.DEL then
            sCommandString = pop(sCommandString, iCommandCursor+1);
        elseif ev.eKey == DEKeys.ENTER then
            if sdCommands[sCommandString] then sdCommands[sCommandString]() end
            sCommandString = "";
            iCommandCursor = 0;
        end
    elseif ev.sType == "char" then
        sCommandString = insert(sCommandString, ev.eKey, iCommandCursor)
        iCommandCursor=iCommandCursor+1;
    end

end

local function INSERT(ev)
    eMode = deModes.COMMAND;
end

local function isMouse(ev)
    return string.sub(ev[1], 1, 6) == "mouse"
end
local function isMousepev(pev)
    return string.sub(pev.sType, 1, 6) == "mouse"
end


local afModeFn = {
    NORMAL,
    COMMAND,
    INSERT
}

term.clear()
term.setCursorPos(2,2);
while bRun do
    if afModeFn[eMode] then
        local ev = {os.pullEvent()}
        --term.clear()
        term.setCursorPos(1,1);
        if ev[3]==nil then ev[3] = false; end

        local parsed_event = {sType=ev[1], eKey=ev[2], bRep=ev[3]}
        --handle things that always should happen
        if parsed_event.eKey == DEKeys.ESC then
            eMode = deModes.NORMAL;
        elseif not isMousepev(parsed_event) then
            afModeFn[eMode](parsed_event)
        end
    else
        return
    end
    REDISPLAY()
end

term.clear()
term.setCursorPos(1,1);
