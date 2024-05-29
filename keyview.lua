

local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

while true do
    local ev = {os.pullEvent()};
    print(dump(ev));
    if(ev[2] == '§')then
        break
    end
end