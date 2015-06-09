--[[
local t1 = {x = 0 ,y = 0}
print(getmetatable(t1))  --nil  创建的表是默认没有元表的  后备函数库
local t2 = {x = 1 ,y = 1}
local mt = {}
mt.__add = function(a,b)
	local c = {}
	c.x = a.x + b.x 
	c.y = a.y + b.y
	return c 
end
setmetatable(t1, mt)
local t3 = t1+t2  --第一个操作数有元表，并且有__add字段
print(t3.x)
print(t3.y)
]]

--[[
__add 加法
__sub 减法
__mul 乘法
__div 除法
__unm 相反数
__mod 取模
__pow 乘幂
]]

--[[
--乘法
local t4 = {x = 1, y = 2}
local t5 = {x = 3, y = 4}
local mt1 = {}
mt1.__mul = function(a,b)
	local c = {}
	c.x = a.x * b.x
	c.y = a.y * b.y 
	return c
end
setmetatable(t4, mt1)
local t6 = t4*t5
print(t6.x)
print(t6.y)
]]

--[[
关系类的元方法
__eq 等于  等于操作比较特殊，需要两个操作数都有元表，并且是同一个元表
__lt 小于
__le 小于等于 
]]

--[[
local t = {x = 10}
print(t.y)  --nil
local mt = {}
mt.__index = function(t, key)  --两个参数 一个是t这个表，另一个是访问的元素
		print("访问不存在的元素" .. key)
		return 1
end
setmetatable(t, mt)
print(t.x)  --访问表的元素的时候，首先在自己本身这个表中查找，没有找到，查看是否有元表，元表是否有__index字段
print(t.y)   
]]

--[[
local t = {x = 10} 
local mt = {}
mt.__index = {y = 100}
setmetatable(t, mt)
print(t.x)
print(t.y)
]]

--[[
local t = {}
local mt = {}
mt.__index = {
	myfunc = function()
		print("myfunc")
	end
}
setmetatable(t, mt)
t.myfunc()  
]]

--[[
local t = {x = 10}
-- t.y = 20
-- print(t.y)  --20
local mt = {}
local k = {}

-- mt.__newindex = function(t,k,v)  --该函数其实带三个参数 function(t,k,v) 表 元素 值
-- 	print(k .. " " .. v)
-- 	print("元素不存在，不能赋值")
-- end

mt.__newindex = k

-- mt.__index = {  --这个仍然可以访问到 y = 20
-- 	y = 20
-- }
setmetatable(t, mt)
t.y = 10  --__newindex字段的时候，不能给表直接添加元素的
print(t.y)  --nil 20
print(k.y)  --10
t.x = 30
print(t.x)
]]

--a.如果__newindex是一个函数，则在给table不存在的字段赋值时，会调用这个函数
--b.如果__newindex是一个table，则在给table不存在的字段赋值时，会直接给__newindex的table赋值

--[[
local t = {}
local mt = {}
local k = {}
-- mt.__index = {
-- 	x = 10
-- }
mt.__index = k

setmetatable(t, mt)
print(rawget(t, "x"))  --会忽略元表 t中有该元素就返回，没有就返回nil，不查找元表
rawset(t, "y", 10)  --同样，赋值也会忽略元表，t中有该元素就赋值，没有就不赋值
print(k.y)
]]







