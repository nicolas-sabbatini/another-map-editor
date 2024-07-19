require("globals")

function love.focus(f)
	IN_FOCUS = f
end

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.update(dt) end

function love.draw()
	love.graphics.clear(0.0, 0.0, 0.0)
end
