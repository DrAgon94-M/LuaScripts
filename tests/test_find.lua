local targets = 
{
    "L*[800.1+0.9]",
    "*[900 + 6]",
    " E + [ 0.4 + 0.1]"
}
---@param str string
local function parse(str)
    local _, _, s1 = str:find("^%s*([L|E]?)")
    local _, _, s2 = str:find("^.*([%*|%+])%s*%[")
    local _, _, s3 = str:find("%[%s*(%d*%.?%d*)%s*%+")
    local _, _, s4 = str:find("%s*(%d*%.?%d*)%s*%]$")


    print(s1 == "" and "E" or s1)
    print(s2)
    print(s3)
    print(s4)

    print("\n")
end

do
    for _, v in pairs(targets)do
        parse(v)
    end
end