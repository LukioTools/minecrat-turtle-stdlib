require "https"

local urls = {
    {
        filename="move.lua"
    },
    {
        filename="moveTo.lua"
    },
    {
        filename="stdlib.lua"
    },
    {
        filename="update.lua"
    },
    {
        filename="inspect.lua"
    },
    {
        filename="inventory.lua"
    },
    {
        filename="comparation.lua"
    },
    {
        filename="fuel.lua"
    },
    {
        filename="suck.lua"
    },
    {
        filename="drop.lua"
    },
    {
        filename="dig.lua"
    },
    {
        filename="detect.lua"
    },
    {
        filename="equip.lua"
    },
    {
        filename="clear_area.lua"
    }
}

for index, value in ipairs(urls) do
    WriteTo(value.filename, GetHTTP("http://0.0.0.0/"..value.filename));
end