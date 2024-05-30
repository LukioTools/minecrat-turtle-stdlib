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
local sFilename = asArgv[1];
local asLines = ReadLines(sFilename);

local bRun = true;
local bRedisplay = true;
local iX, iY = term.getSize();
iY = iY;
--display offsets
local iXDisplay = 0;
local iYDisplay = 0;

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



local sCommandString = "";
local iCommandCursor = 0;

local iXCursor = 0;
local iYCursor = 0;


local function CurrentLine() return asLines[1+iYCursor]; end



local function CursorXTo(n)
    local out = {
        success=false
    }
    if type(n) ~= "number" then return out end
    if not n then return out end
    if n > #CurrentLine() or n < 0 then return out end
    iXCursor = n;
    if iXCursor < iXDisplay then
        iXDisplay = iXCursor
    elseif iXCursor >= iXDisplay+iX then
        iXDisplay = iXCursor-iX+1;
    end
    out.success = true;
    return out;
end
local function CursorYTo(n)
    local out = {
        success=false
    }
    if type(n) ~= "number" then return out end
    if not n then return out end
    if not n < #asLines or n < 0 then return out end
    iYCursor = n;
    if iYCursor < iYDisplay then
        iYDisplay = iYCursor
    elseif iYCursor >= iYDisplay+iY then
        iYDisplay = iYCursor-iY;
    end
    out.success = true;
    return out;
end

local function CursorTo(x, y)
    if CursorYTo(y).success then
        return CursorXTo(x).success
    end
    return false
end


local function incCursorY()
    local bIncremented = false;
    local bScrolled = false;
    if iYCursor < #asLines then
        iYCursor=iYCursor+1;
        bIncremented = true;
    end
    if iYCursor-(iYDisplay+iY) >= 0 and iYDisplay < #asLines then
        iYDisplay=iYDisplay+1;
        bScrolled = true;
    end
    if iXCursor > #CurrentLine() then
        iXCursor = #CurrentLine()
    end
    return {bIncremented=bIncremented, bScrolled=bScrolled}
end
local function decCursorY()
    local bDecremented = false;
    local bScrolled = false;
    if iYCursor > 0 then
        iYCursor=iYCursor-1;
        bDecremented = true;
    end
    if iYCursor-(iYDisplay) < 0  then
        iYDisplay=iYDisplay-1;
        bScrolled = true;
    end
    if iXCursor > #CurrentLine() then
        iXCursor = #CurrentLine()
    end
    return {bDecremented=bDecremented, bScrolled=bScrolled}
end


local function incCursorX()
    if iXCursor < #CurrentLine() then
        iXCursor=iXCursor+1;
    elseif incCursorY().bIncremented then
        iXCursor = 0;
        iXDisplay = 0;
    end
    if iXCursor >= iXDisplay+iX then
        iXDisplay=iXDisplay+1;
    end
end
local function decCursorX()
    if iXCursor > 0 then
        iXCursor=iXCursor-1;
    elseif decCursorY().bDecremented then
        CursorXTo(#CurrentLine())
    end
    if iXCursor < iXDisplay then
        iXDisplay=iXDisplay-1;
    end

end
local function DrawCommand()
    term.setCursorPos(1, iY);
    term.clearLine();
    ---string.sub(sCommandString, -(iX-1))
    write(":"..string.sub(sCommandString, -(iX-1)));
    term.setCursorPos(iCommandCursor+2,iY);
    term.setCursorBlink(true)
end

local function DrawNormal()
    term.clear()
    term.setCursorPos(1,1);

    local i=0;
    local str = "";
    while i < iY do
        i=i+1;
        str="";
        if asLines[i+iYDisplay] then
            str = str .. string.sub(asLines[i+iYDisplay], 1+iXDisplay, iX+iXDisplay);
        else str = "~"
        end
        if i < iY then str=str..'\n'; end
        write(str);
    end

    term.setCursorPos(iXCursor-iXDisplay+1,iYCursor-iYDisplay+1);
    term.setCursorBlink(true)
end

local function DrawInsert()
    DrawNormal();
    term.setCursorPos(1, iY);
    term.clearLine();
    write(string.sub("[INSERT]", 1, iX));
    term.setCursorPos(iXCursor-iXDisplay+1,iYCursor-iYDisplay+1);
    term.setCursorBlink(true)
end

local function REDISPLAY() --nil
    if not bRedisplay then
        return
    end
    --term.clear();
    --term.setCursorPos(1,1);
    
    if eMode == deModes.NORMAL then
        DrawNormal()
    elseif eMode == deModes.INSERT then
        DrawInsert();
    elseif eMode == deModes.COMMAND then
        DrawCommand();
    end

end

local function pcursor(ev)
    if ev.sType == "key_up" then
        return false
    end
    if ev.eKey == DEKeys.ARROW_UP then
        return decCursorY().bIncremented;
    elseif ev.eKey == DEKeys.ARROW_DOWN then
        return incCursorY().bIncremented;
    elseif ev.eKey == DEKeys.ARROW_LEFT then
        decCursorX();
        return true
    elseif ev.eKey == DEKeys.ARROW_RIGHT then
        incCursorX();
        return true
    end
    return false
end

local function NORMAL(ev)
    if ev.sType == "key_up" then
        return
    end
    if ev.eKey == ':' then
        eMode = deModes.COMMAND;
    elseif ev.eKey == 'i' then
        eMode = deModes.INSERT;
    elseif ev.eKey == '/' then
        --search
    elseif pcursor(ev) then
    end
end

local function insert(s, thing, pos)
    return string.sub(s, 1,pos)..thing..string.sub(s, pos+1)
end
local function pop(s, pos)
    return string.sub(s,1, pos-1)..string.sub(s, pos+1)
end
local function write()
    WriteLines(sFilename,asLines)
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


-- do this shit
local function INSERT(ev)

    -- asLines[1+iYCursor] == current line
    if ev.sType == "key" then
        if ev.eKey == DEKeys.BACKSPACE then
            if iXCursor > 0 then
                asLines[1+iYCursor] = pop(asLines[1+iYCursor], iXCursor);
                decCursorX();
            elseif iYCursor > 0 and asLines[iYCursor] then
                local line = asLines[iYCursor];
                asLines[iYCursor] = line .. asLines[1+iYCursor];
                table.remove(asLines, 1+iYCursor);
                if decCursorY() then
                    CursorXTo(#line)
                end
            end
        elseif ev.eKey == DEKeys.DEL then
            asLines[1+iYCursor] = pop(asLines[1+iYCursor], iXCursor+1);
        elseif ev.eKey == DEKeys.ENTER then
            local line = asLines[1+iYCursor];
            local s = line.sub(line, 1, iXCursor)
            local e = line.sub(line, iXCursor+1)
            asLines[1+iYCursor] = s;
            table.insert(asLines, iYCursor+2, e);
            if incCursorY() then
                CursorXTo(0)
            end
        elseif pcursor(ev) then
        end
    elseif ev.sType == "char" then
        asLines[1+iYCursor] = insert(asLines[1+iYCursor], ev.eKey, iXCursor)
        iXCursor=iXCursor+1;
    end
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
    term.setCursorPos(1,1);
    REDISPLAY()
end

term.clear()
term.setCursorPos(1,1);
