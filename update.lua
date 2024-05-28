require "https"

local urls = {
    {
        url="http://83.245.166.243/move.lua",
        filename="move.lua"
    },
    {
        url="http://83.245.166.243/moveTo.lua",
        filename="moveTo.lua"
    },
    {
        url="http://83.245.166.243/stdlib.lua",
        filename="stdlib.lua"
    },
    {
        url="http://83.245.166.243/update.lua",
        filename="update.lua"
    },
    {
        url="http://83.245.166.243/inspect.lua",
        filename="inspect.lua"
    },
}

for index, value in ipairs(urls) do
    print("filename: " .. value.filename .. ", url: ".. value.url);
    WriteTo(value.filename, GetHTTP(value.url));
end