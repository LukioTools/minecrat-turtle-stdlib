require "https"

local urls = {
    {
        url="https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/move.lua",
        filename="move.lua"
    },
    {
        url="https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/moveTo.lua",
        filename="moveTo.lua"
    },
    {
        url="https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/stdlib.lua",
        filename="stdlib.lua"
    },
    {
        url="https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/update.lua",
        filename="update.lua"
    },
    {
        url="https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/inspect.lua",
        filename="update.lua"
    },
}

for index, value in ipairs(urls) do
    print("filename: " .. value.filename .. ", url: ".. value.url);
    WriteTo(value.filename, GetHTTP(value.url));
end