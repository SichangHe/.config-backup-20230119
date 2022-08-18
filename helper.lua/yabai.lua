function run_command(command, pattern)
    handle = io.popen(command)
    result = handle:read(pattern or "*a")
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

function cycle()
    ids = run_command("yabai -m query --windows --space mouse | jq '.[].id'")
    id = tonumber(run_command("yabai -m query --windows --window | jq '.id'"))

    id_list = {}
    for now in string.gmatch(ids, "%w+") do
        table.insert(id_list, tonumber(now))
    end
    table.sort(id_list)

    target = args[1] == 'next' and get_next() or get_last()
    return run_command("yabai -m window --focus " .. target)
end

function info()
    apps = run_command("yabai -m query --windows --space mouse | jq '.[].app'")
    app_str = ''
    for app in string.gmatch(apps, "\"%w+[%s\"]") do
        app_str = app_str .. string.match(app, "%w+") .. ' '
    end
    space_id = run_command("yabai -m query --spaces --space mouse | jq '.index'", "*l")
    window_num = run_command("yabai -m query --windows --space mouse | jq '.[].title' | wc -l", "*l")
    command = string.format("osascript -e 'display notification \"%s\" with title \"Space %s\" subtitle \"%s windows\"'"
        , app_str, space_id, window_num)
    return run_command(command)
end

args = { ... }
if args[1] == 'next' or args[1] == 'last' then
    return cycle()
else if args[1] == 'info' then
        return info()
    end
end
