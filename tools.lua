local tools = {}

function tools:printStr(value, des, printMeta, maxDepth)
    local strList = {}
    local curDepth = 0
    maxDepth = maxDepth or 3
    
    function strList:insert(str)
        table.insert(self, str)
    end
    
    if des and type(des) == "string" then
        strList:insert(des .. " : ")
    end
    
    -- pre : 前缀
    function strList:getStr(value, pre)
        if type(value) ~= "table" then
            if type(value) == "string" then
                self:insert(string.format("\"%s\"", value))
            else
                self:insert(tostring(value))
            end
        else
            --查看深度
            curDepth = curDepth + 1
            
            if curDepth > maxDepth then
                self:insert("{...}")
                return 
            end
            
            --前缀
            local newPre = pre .. '\t'
            
            --插入表
            self:insert("{\n")
            
            for k, v in pairs(value) do
                self:insert(newPre)
                self:getStr(k, newPre)
                self:insert(" : ")
                self:getStr(v, newPre)
                self:insert("\n")
            end
            
            --如果需要打印元表，打印
            if printMeta then
                local meta = getmetatable(value)
                
                if meta then
                    self:insert(newPre .. "[metatable] : ")
                    self:getStr(meta, newPre)
                    self:insert(newPre .. "\n")
                end
            end
            
            strList:insert(pre .. "}")
            --插入表结束
            
            curDepth = curDepth - 1
        end
    end
    
    --调用方法
    strList:getStr(value, "")
    
    return table.concat(strList)
end

function tools:print(value, des, printMeta, maxDepth)
    print(self:printStr(value, des, printMeta, maxDepth))
end

function tools:key2Value(t)
    local newt = {}

    for k, v in pairs(t) do
        if type(v) == "table" then
            newt[k] = self:key2Value(v)       
        else
            newt[v] = k
            t[k] = nil
        end
    end
    
    return newt
end

function tools:keysToArray(t)
    local arr = {}
    
    for k, v in pairs(t) do
        table.insert(arr, k)
    end
    return arr
end

return tools
