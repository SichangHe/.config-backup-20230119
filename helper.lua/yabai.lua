function run_command(command)
    handle = io.popen(command)
    result = handle:read("*a")
    handle:close()
    return result
end

function get_last()
    if id == id_list[1] then
        return id_list[#id_list]
    end
    for _, now in ipairs(id_list) do
        if now == id then break end
        last = now
    end
    return last
end

function get_next()
    if id == id_list[#id_list] then
        return id_list[1]
    end
    for i, now in ipairs(id_list) do
        if now == id then return id_list[i + 1] end
    end
end

ids = run_command("yabai -m query --windows --space mouse | jq '.[].id'")
id = tonumber(run_command("yabai -m query --windows --window mouse | jq '.id'"))

id_list = {}
for now in string.gmatch(ids, "%w+") do
    table.insert(id_list, tonumber(now))
end
table.sort(id_list)

args = { ... }
target = args[1] == 'next' and get_next() or get_last()

return run_command("yabai -m window --focus " .. target)
