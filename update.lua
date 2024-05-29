require "https"

local urls = {
    {
        url="http://0.0.0.0/move.lua",
        filename="move.lua"
    },
    {
        url="http://0.0.0.0/moveTo.lua",
        filename="moveTo.lua"
    },
    {
        url="http://0.0.0.0/stdlib.lua",
        filename="stdlib.lua"
    },
    {
        url="http://0.0.0.0/update.lua",
        filename="update.lua"
    },
    {
        url="http://0.0.0.0/inspect.lua",
        filename="inspect.lua"
    },
    {
        url="http://0.0.0.0/inventory.lua",
        filename="inventory.lua"
    },
    {
        url="http://0.0.0.0/comparation.lua",
        filename="comparationg.lua"
    },
    {
        url="http://0.0.0.0/fuel.lua",
        filename="fuel.lua"
    },
}

for index, value in ipairs(urls) do
    print("filename: " .. value.filename .. ", url: ".. value.url);
    WriteTo(value.filename, GetHTTP(value.url));
end