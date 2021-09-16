local tools = require "tools"
local parser = {}

--这些字符在正则表达式里有意义，在拼接这些字符时，需要转义
parser.needEscape_inPattern = {'*', '+', '?', '-', '[', ']', '(', ')'}

---将一个符号数组里需要转义的字符转义(这个转义是针对正则表达式的)
function parser:escape(chars)
    for index, v in pairs(chars) do
        if self.needEscape_inPattern[v] then
            chars[index] = '%' .. v
        end
    end
end

function parser:getModifierPattern()
    --"^%s*([L|E]?)"
    return "^%s*([" .. table.concat(self.modifiers, '|') .. "]?)"
end

function parser:getTypePattern()
    --"^.*([%*|%+])%s*%["
    return "^.*([" .. table.concat(self.types, '|') .. "])%s*%["
end

function parser:parse(str)
    -- L*[100+8]
    local _, _, modifier = string.find(str, self.pattern_modifiers)
    local _, _, type = string.find(str, self.pattern_type)
    print("modifier : " .. modifier)
    print("type : " .. type)
end

do
    parser.cfg = {
        modifier = {
            gainOnLearn = "L",
            gainOnEquip = "E",
        },
        type = {
            add = "+",
            mul = "*"
        }
    }
    parser.cfg_k2v = tools:key2Value(parser.cfg)
    parser.needEscape_inPattern = tools:key2Value(parser.needEscape_inPattern)
    tools:print(parser.cfg_k2v)

    parser.modifiers = parser:escape(tools:keysToArray(parser.cfg_k2v.modifier))  --{'L','E'}
    parser.types = parser:escape(tools:keysToArray(parser.cfg_k2v.type)) --{'%*','%+'}

    tools:print(parser.modifiers)
    tools:print(parser.types)

    parser.pattern_modifiers = parser:getModifierPattern()
    parser.pattern_type = parser:getTypePattern()

    print(parser.pattern_modifiers)
    print(parser.pattern_type)


    
    local modifier = parser:parse("E*[100+8]")
end

return parser
