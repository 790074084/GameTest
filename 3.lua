--[[
loadfile  --只编译，不运行
dofile  --执行代码
require  --只执行一次
]]

-- loadfile("4.lua")
-- print(add(1,2))

-- dofile("4.lua")
-- dofile("4.lua")
-- print(add(1,2))

-- require("4.lua")  --需要写成模块
-- require("4.lua")
-- print(add(1,2))

--协程
local co = coroutine.create(function ()
	for i=1,10 do
		print(i)
		coroutine.yield()  --挂起

	end
end)  --状态是挂起状态

for i=1,10 do
	print("for ")
	coroutine.resume(co)
end
print("-------------------------------")

--生产者和消费者问题