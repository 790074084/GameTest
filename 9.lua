--[[
game = {}
game.play = function()
	print("play")
end
return game
]]

module("game", package.seeall)
function play()
	print("play")
end