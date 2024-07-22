require("globals")

local work_area = require("work_area")
local side_bar = require("side_bar")

-- Callback on actions
function love.mousepressed(x, y, button)
	if not IN_FOCUS then
		GUI:pressed(x, y, button)
	end
end
function love.mousemoved(x, y, dx, dy)
	if not IN_FOCUS then
		GUI:moved(x, y, dx, dy)
	end
end
function love.mousereleased(x, y, button)
	if not IN_FOCUS then
		GUI:released(x, y, button)
	end
end
function love.textinput(text)
	if not IN_FOCUS then
		GUI:textinput(text)
	end
end
function love.keypressed(k, scancode, isrepeat)
	if not IN_FOCUS then
		GUI:keypressed(k, scancode, isrepeat)
	end
end
function love.wheelmoved(x, y)
	if not IN_FOCUS then
		GUI:wheelmoved(x, y)
	end
end
function love.resize(new_width, new_height)
	WINDOW_WIDTH = new_width
	WINDOW_HEIGHT = new_height
	work_area:build_transform()
end
function love.focus(f)
	IN_FOCUS = f
end
--

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	side_bar:load()
	work_area:init()
end

function love.update(dt)
	GUI:update(dt)
	work_area:update(dt)
end

function love.draw()
	love.graphics.clear(1, 1, 1)
	work_area:draw()
	GUI:draw()
end
