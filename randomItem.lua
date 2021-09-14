local itemIds = { 1, 2, 3, 4 }
local itemOdds = { 0.002, 0.1, 0.5, 0.01 }
local gotItems = {}

function printTable(t)
    for k, v in pairs(t) do
        print(string.format("%s : %s", k, v))
    end
end

function float2Int(value)
    while value - math.floor(value) ~= 0 do
        value = value * 10
    end
    
    return value
end

function update(count)
    for i = 1, count do
        for index, itemId in pairs(itemIds) do
            local pre_float = itemOdds[index]
            local pre_int = float2Int(pre_float)
            local mul = pre_int / pre_float
            local random = math.random(mul)
            
            if random <= pre_int then
                if not gotItems[itemId] then
                    gotItems[itemId] = 0
                end
                
                gotItems[itemId] = gotItems[itemId] + 1
            end
        end
    end
end

function update2(count)
    --(//|#|<!--|;|/\*|^|^[ \t]*(-|\d+.)|--)\s*($TAGS)
    --[[
        // TODO
        # TODO
        <!-- TODO
        ; TODO
        /* TODO
        -TODO
        -- TODO
    --]]
    

end


update(100)
printTable(gotItems)
