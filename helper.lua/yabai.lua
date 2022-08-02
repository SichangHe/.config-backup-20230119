function get_last()
    if id == id_list[1] then
        last = id_list[#id_list]
    else
        for _, now in ipairs(id_list) do
            if now == id then break end
            last = now
        end
    end
    return last
end

function get_next()
    if id == id_list[#id_list] then
        next_ = id_list[1]
    else
        for i, now in ipairs(id_list) do
            if now == id then next_ = id_list[i + 1] break end
        end
    end
    return next_
end

handle = io.popen("yabai -m query --windows --space mouse | jq '.[].id'")
ids = handle:read("*a")
handle:close()

handle = io.popen("yabai -m query --windows --window mouse | jq '.id'")
id = tonumber(handle:read("l"))
handle:close()

id_list = {}
for now in string.gmatch(ids, "%w+") do
    table.insert(id_list, tonumber(now))
end
table.sort(id_list)

args = { ... }
target = args[1] == 'next' and get_next() or get_last()

handle = io.popen("yabai -m window --focus " .. target)
result = handle:read("*a")
handle:close()
return result
