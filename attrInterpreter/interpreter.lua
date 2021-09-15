local config = {
    modifier = {
        gainOnLearn = "L",
        gainOnEquip = "E",
    },
    type = {
        add = "+",
        mul = "*"
    }
}

local tools = require "tools"
local interpreter = {}

function interpreter:parse(str)
    -- L*[100+8]
    local i,j,modifier = string.find(str, self.pattern_modifiers)
    print("modifier : " .. modifier)
    return modifier
end

do
    interpreter.cfg = tools:key2Value(config)
    interpreter.pattern_modifiers = string.format("%s{1}", table.concat(tools:keysToArray(interpreter.cfg.modifier), '|'))

    print(interpreter.pattern_modifiers)


    local modifier = interpreter:parse("E*[100+8]")
end

return interpreter