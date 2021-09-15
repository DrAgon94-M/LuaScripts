local config = {
    modifier = {
        gainOnLearn = "&",
        gainOnEquip = "|",
    },
    type = {
        add = "+",
        mul = "*"
    }
}

local interpreter = {}

function interpreter:key2Value(t)
    if type(t) ~= "table" then
        return t
    else
        for k, v in pairs(t) do
            t[self:key2Value(v)] = self:key2Value(k)
            t[k] = nil
        end

        return t
    end
end

interpreter.cfg = interpreter:key2Value(config)

function interpreter:parse(str)
    
end


return interpreter