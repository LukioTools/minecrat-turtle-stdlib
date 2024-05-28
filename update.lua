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
    -- "https://raw.githubusercontent.com/LukioTools/minecrat-turtle-stdlib/main/https.lua",
}

for index, value in ipairs(urls) do
    print("filename: " .. value.filename .. ", url: ".. value.url);
    WriteTo(value.url, GetHTTP(value.url));
end