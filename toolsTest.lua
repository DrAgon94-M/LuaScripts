local tools = require "tools"
---测试printTable()
function test1()
    local t = {
        name = "DrAgon94",
        age = 19,
        jobInfo = {
            name = "programmer",
            salary = 4000,
            companyInfo = {
                name = "SandBox",
                staffNames = {
                    VP = "xxx"
                }
            }
        },
    }

    --测试表作为键的打印情况
    -- local t1 = {"x"}
    -- local t2 = {"y"}
    -- t[t1] = t2

    --测试元表的打印情况
    setmetatable(t, {
        Type = "human"
    })

    tools:print(t, "T", true, 5)
end

---测试key2Value()接口
function test2()
    local t = {
        name = "DrAgon94",
        age = 19,
    }

    --测试表作为键的打印情况
    -- local t1 = {"x"}
    -- local t2 = {"y"}
    -- t[t1] = t2

    tools:print(tools:key2Value(t))
end

do
    test2()
end